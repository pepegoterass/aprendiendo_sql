-- =====================================================
-- 🐘 SCRIPT DE INICIALIZACIÓN - POSTGRESQL
-- =====================================================
-- Configuración inicial para PostgreSQL en Docker

-- Configurar el timezone
SET timezone = 'Europe/Madrid';

-- Crear extensiones útiles
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- 📋 CREACIÓN DE TABLAS (PostgreSQL)
-- =====================================================

-- Tabla: Departamentos
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50),
    presupuesto DECIMAL(10,2),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: Empleados
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),
    id_departamento INTEGER REFERENCES departamentos(id_departamento),
    id_jefe INTEGER REFERENCES empleados(id_empleado),
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: Categorías de Productos
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    activa BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: Productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0),
    stock INTEGER DEFAULT 0 CHECK (stock >= 0),
    id_categoria INTEGER REFERENCES categorias(id_categoria),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla: Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    pais VARCHAR(50) DEFAULT 'España',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla: Ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    id_producto INTEGER NOT NULL REFERENCES productos(id_producto),
    id_empleado INTEGER REFERENCES empleados(id_empleado),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0),
    descuento DECIMAL(5,2) DEFAULT 0 CHECK (descuento >= 0 AND descuento <= 100),
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_calculado DECIMAL(10,2) GENERATED ALWAYS AS 
        ((cantidad * precio_unitario) * (1 - descuento/100)) STORED,
    notas TEXT
);

-- =====================================================
-- 📊 ÍNDICES PARA MEJORAR RENDIMIENTO
-- =====================================================

-- Índices en campos que se usarán frecuentemente en WHERE y JOIN
CREATE INDEX idx_empleados_departamento ON empleados(id_departamento);
CREATE INDEX idx_empleados_jefe ON empleados(id_jefe);
CREATE INDEX idx_productos_categoria ON productos(id_categoria);
CREATE INDEX idx_ventas_fecha ON ventas(fecha_venta);
CREATE INDEX idx_ventas_cliente ON ventas(id_cliente);
CREATE INDEX idx_ventas_producto ON ventas(id_producto);
CREATE INDEX idx_ventas_empleado ON ventas(id_empleado);

-- Índices compuestos para consultas complejas
CREATE INDEX idx_empleados_activo_departamento ON empleados(activo, id_departamento);
CREATE INDEX idx_productos_activo_categoria ON productos(activo, id_categoria);

-- =====================================================
-- 🎯 FUNCIONES ÚTILES PARA EJERCICIOS
-- =====================================================

-- Función para obtener el nombre completo de un empleado
CREATE OR REPLACE FUNCTION nombre_completo_empleado(id_emp INTEGER)
RETURNS VARCHAR(101) AS $$
BEGIN
    RETURN (SELECT nombre || ' ' || apellido FROM empleados WHERE id_empleado = id_emp);
END;
$$ LANGUAGE plpgsql;

-- Función para calcular el total de una venta
CREATE OR REPLACE FUNCTION calcular_total_venta(
    p_cantidad INTEGER, 
    p_precio DECIMAL(10,2), 
    p_descuento DECIMAL(5,2) DEFAULT 0
)
RETURNS DECIMAL(10,2) AS $$
BEGIN
    RETURN (p_cantidad * p_precio) * (1 - p_descuento/100);
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- 🔧 TRIGGERS PARA AUDITORÍA
-- =====================================================

-- Función para actualizar fecha de modificación
CREATE OR REPLACE FUNCTION actualizar_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para productos
CREATE TRIGGER trigger_productos_fecha_actualizacion
    BEFORE UPDATE ON productos
    FOR EACH ROW
    EXECUTE FUNCTION actualizar_fecha_modificacion();

-- =====================================================
-- 📈 VISTAS ÚTILES PARA EJERCICIOS
-- =====================================================

-- Vista: Información completa de empleados
CREATE VIEW vista_empleados_completa AS
SELECT 
    e.id_empleado,
    e.nombre,
    e.apellido,
    e.nombre || ' ' || e.apellido AS nombre_completo,
    e.email,
    e.telefono,
    e.salario,
    e.fecha_contratacion,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.fecha_contratacion)) AS años_antiguedad,
    d.nombre_departamento,
    d.ubicacion AS ubicacion_departamento,
    jefe.nombre || ' ' || jefe.apellido AS nombre_jefe,
    e.activo
FROM empleados e
LEFT JOIN departamentos d ON e.id_departamento = d.id_departamento
LEFT JOIN empleados jefe ON e.id_jefe = jefe.id_empleado;

-- Vista: Resumen de ventas con toda la información
CREATE VIEW vista_resumen_ventas AS
SELECT 
    v.id_venta,
    v.fecha_venta,
    c.nombre || ' ' || c.apellido AS cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.descuento,
    v.total_calculado,
    e.nombre || ' ' || e.apellido AS vendedor,
    d.nombre_departamento AS departamento_vendedor
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN empleados e ON v.id_empleado = e.id_empleado
LEFT JOIN departamentos d ON e.id_departamento = d.id_departamento;

-- Vista: Productos con información extendida
CREATE VIEW vista_productos_info AS
SELECT 
    p.id_producto,
    p.nombre_producto,
    p.descripcion,
    p.precio,
    p.stock,
    CASE 
        WHEN p.stock = 0 THEN 'Sin Stock'
        WHEN p.stock < 10 THEN 'Stock Bajo'
        WHEN p.stock < 50 THEN 'Stock Normal'
        ELSE 'Stock Alto'
    END AS estado_stock,
    c.nombre_categoria,
    p.fecha_creacion,
    p.activo,
    COALESCE(
        (SELECT SUM(v.cantidad) FROM ventas v WHERE v.id_producto = p.id_producto), 
        0
    ) AS total_vendido
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria;

-- =====================================================
-- ✅ MENSAJE DE CONFIRMACIÓN
-- =====================================================

DO $$ 
BEGIN 
    RAISE NOTICE '🎉 Base de datos PostgreSQL inicializada correctamente!';
    RAISE NOTICE '📊 Tablas creadas: departamentos, empleados, categorias, productos, clientes, ventas';
    RAISE NOTICE '👁️ Vistas creadas: vista_empleados_completa, vista_resumen_ventas, vista_productos_info';
    RAISE NOTICE '🚀 ¡Listo para comenzar el entrenamiento SQL!';
END $$;