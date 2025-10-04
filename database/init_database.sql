-- =====================================================
-- 🗄️  SCRIPT DE INICIALIZACIÓN - BASE DE DATOS EMPRESA
-- =====================================================
-- Este script crea y puebla las tablas para tus ejercicios SQL
-- Ejecuta este script completo para inicializar tu entorno

-- Eliminar tablas si existen (para reiniciar limpio)
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS departamentos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- =====================================================
-- 📋 CREACIÓN DE TABLAS
-- =====================================================

-- Tabla: Departamentos
CREATE TABLE departamentos (
    id_departamento INTEGER PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50),
    presupuesto DECIMAL(10,2)
);

-- Tabla: Empleados
CREATE TABLE empleados (
    id_empleado INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_contratacion DATE,
    salario DECIMAL(10,2),
    id_departamento INTEGER,
    id_jefe INTEGER,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento),
    FOREIGN KEY (id_jefe) REFERENCES empleados(id_empleado)
);

-- Tabla: Categorías de Productos
CREATE TABLE categorias (
    id_categoria INTEGER PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla: Productos
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INTEGER DEFAULT 0,
    id_categoria INTEGER,
    fecha_creacion DATE DEFAULT CURRENT_DATE,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla: Clientes
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    ciudad VARCHAR(50),
    pais VARCHAR(50) DEFAULT 'España',
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla: Ventas
CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    id_empleado INTEGER,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    descuento DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- =====================================================
-- 📊 INSERCIÓN DE DATOS DE MUESTRA
-- =====================================================

-- Insertar Departamentos
INSERT INTO departamentos (id_departamento, nombre_departamento, ubicacion, presupuesto) VALUES
(1, 'Ventas', 'Madrid', 150000.00),
(2, 'Marketing', 'Barcelona', 120000.00),
(3, 'Desarrollo', 'Valencia', 200000.00),
(4, 'Recursos Humanos', 'Sevilla', 80000.00),
(5, 'Finanzas', 'Madrid', 100000.00);

-- Insertar Empleados
INSERT INTO empleados (id_empleado, nombre, apellido, email, telefono, fecha_contratacion, salario, id_departamento, id_jefe) VALUES
(1, 'Carlos', 'García', 'carlos.garcia@empresa.com', '600123456', '2020-01-15', 45000.00, 1, NULL),
(2, 'María', 'López', 'maria.lopez@empresa.com', '600234567', '2020-03-20', 42000.00, 2, NULL),
(3, 'Juan', 'Martínez', 'juan.martinez@empresa.com', '600345678', '2019-11-10', 55000.00, 3, NULL),
(4, 'Ana', 'Rodríguez', 'ana.rodriguez@empresa.com', '600456789', '2021-05-12', 38000.00, 4, NULL),
(5, 'Pedro', 'Sánchez', 'pedro.sanchez@empresa.com', '600567890', '2020-08-30', 48000.00, 5, NULL),
(6, 'Laura', 'Fernández', 'laura.fernandez@empresa.com', '600678901', '2021-02-14', 35000.00, 1, 1),
(7, 'Miguel', 'Torres', 'miguel.torres@empresa.com', '600789012', '2021-07-19', 52000.00, 3, 3),
(8, 'Carmen', 'Ruiz', 'carmen.ruiz@empresa.com', '600890123', '2022-01-10', 33000.00, 2, 2),
(9, 'David', 'Moreno', 'david.moreno@empresa.com', '600901234', '2021-09-25', 40000.00, 1, 1),
(10, 'Isabel', 'Jiménez', 'isabel.jimenez@empresa.com', '600012345', '2022-03-08', 36000.00, 4, 4);

-- Insertar Categorías
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Electrónicos', 'Dispositivos electrónicos y tecnología'),
(2, 'Ropa', 'Vestimenta y accesorios'),
(3, 'Hogar', 'Artículos para el hogar'),
(4, 'Deportes', 'Equipamiento deportivo'),
(5, 'Libros', 'Literatura y material educativo');

-- Insertar Productos
INSERT INTO productos (id_producto, nombre_producto, descripcion, precio, stock, id_categoria, fecha_creacion, activo) VALUES
(1, 'Laptop HP', 'Laptop HP Pavilion 15 pulgadas', 699.99, 25, 1, '2023-01-15', TRUE),
(2, 'iPhone 14', 'Smartphone Apple iPhone 14', 999.99, 15, 1, '2023-02-20', TRUE),
(3, 'Camiseta Nike', 'Camiseta deportiva Nike talla M', 29.99, 100, 2, '2023-03-10', TRUE),
(4, 'Mesa de centro', 'Mesa de centro de madera', 149.99, 8, 3, '2023-01-25', TRUE),
(5, 'Balón de fútbol', 'Balón de fútbol FIFA oficial', 39.99, 50, 4, '2023-02-14', TRUE),
(6, 'El Quijote', 'Don Quijote de la Mancha - Cervantes', 15.99, 200, 5, '2023-01-01', TRUE),
(7, 'Tablet Samsung', 'Tablet Samsung Galaxy Tab 10 pulgadas', 299.99, 30, 1, '2023-03-05', TRUE),
(8, 'Zapatillas Adidas', 'Zapatillas running Adidas', 79.99, 45, 2, '2023-02-28', TRUE),
(9, 'Lámpara LED', 'Lámpara de escritorio LED regulable', 45.99, 60, 3, '2023-03-12', TRUE),
(10, 'Raqueta de tenis', 'Raqueta de tenis profesional', 129.99, 20, 4, '2023-02-05', TRUE);

-- Insertar Clientes
INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, ciudad, pais, fecha_registro) VALUES
(1, 'Antonio', 'Gómez', 'antonio.gomez@email.com', '610123456', 'Calle Mayor 123', 'Madrid', 'España', '2023-01-10'),
(2, 'Lucía', 'Vázquez', 'lucia.vazquez@email.com', '620234567', 'Av. Diagonal 456', 'Barcelona', 'España', '2023-01-15'),
(3, 'Francisco', 'Herrera', 'francisco.herrera@email.com', '630345678', 'Plaza España 789', 'Valencia', 'España', '2023-02-20'),
(4, 'Elena', 'Castro', 'elena.castro@email.com', '640456789', 'Calle Sierpes 321', 'Sevilla', 'España', '2023-02-25'),
(5, 'Roberto', 'Ortega', 'roberto.ortega@email.com', '650567890', 'Gran Vía 654', 'Madrid', 'España', '2023-03-01'),
(6, 'Cristina', 'Navarro', 'cristina.navarro@email.com', '660678901', 'Ramblas 987', 'Barcelona', 'España', '2023-03-05'),
(7, 'Alejandro', 'Ramos', 'alejandro.ramos@email.com', '670789012', 'Calle Colón 147', 'Valencia', 'España', '2023-03-10'),
(8, 'Beatriz', 'Gil', 'beatriz.gil@email.com', '680890123', 'Alameda 258', 'Sevilla', 'España', '2023-03-15'),
(9, 'Raúl', 'Peña', 'raul.pena@email.com', '690901234', 'Castellana 369', 'Madrid', 'España', '2023-03-20'),
(10, 'Silvia', 'Romero', 'silvia.romero@email.com', '600012345', 'Paseo Gracia 741', 'Barcelona', 'España', '2023-03-25');

-- Insertar Ventas
INSERT INTO ventas (id_venta, id_cliente, id_producto, id_empleado, cantidad, precio_unitario, fecha_venta, descuento) VALUES
(1, 1, 1, 6, 1, 699.99, '2023-04-01 10:30:00', 0.00),
(2, 2, 2, 6, 1, 999.99, '2023-04-02 14:15:00', 5.00),
(3, 3, 3, 9, 2, 29.99, '2023-04-03 09:45:00', 0.00),
(4, 4, 4, 6, 1, 149.99, '2023-04-04 16:20:00', 10.00),
(5, 5, 5, 9, 3, 39.99, '2023-04-05 11:10:00', 0.00),
(6, 1, 6, 6, 5, 15.99, '2023-04-06 13:30:00', 0.00),
(7, 6, 7, 9, 1, 299.99, '2023-04-07 15:45:00', 0.00),
(8, 7, 8, 6, 1, 79.99, '2023-04-08 12:00:00', 0.00),
(9, 8, 9, 9, 2, 45.99, '2023-04-09 10:15:00', 0.00),
(10, 9, 10, 6, 1, 129.99, '2023-04-10 17:30:00', 0.00),
(11, 2, 1, 9, 1, 699.99, '2023-04-11 09:00:00', 0.00),
(12, 10, 3, 6, 3, 29.99, '2023-04-12 14:45:00', 0.00),
(13, 3, 7, 9, 1, 299.99, '2023-04-13 11:30:00', 0.00),
(14, 5, 2, 6, 1, 999.99, '2023-04-14 16:15:00', 0.00),
(15, 8, 5, 9, 2, 39.99, '2023-04-15 13:20:00', 0.00);

-- =====================================================
-- 🎯 CREACIÓN DE VISTAS ÚTILES PARA EJERCICIOS
-- =====================================================

-- Vista: Información completa de empleados
CREATE VIEW vista_empleados_completa AS
SELECT 
    e.id_empleado,
    e.nombre || ' ' || e.apellido AS nombre_completo,
    e.email,
    e.salario,
    d.nombre_departamento,
    d.ubicacion,
    jefe.nombre || ' ' || jefe.apellido AS nombre_jefe
FROM empleados e
LEFT JOIN departamentos d ON e.id_departamento = d.id_departamento
LEFT JOIN empleados jefe ON e.id_jefe = jefe.id_empleado;

-- Vista: Resumen de ventas
CREATE VIEW vista_resumen_ventas AS
SELECT 
    v.id_venta,
    c.nombre || ' ' || c.apellido AS cliente,
    p.nombre_producto,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) - v.descuento AS total_venta,
    v.fecha_venta,
    e.nombre || ' ' || e.apellido AS vendedor
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
LEFT JOIN empleados e ON v.id_empleado = e.id_empleado;

-- =====================================================
-- ✅ VERIFICACIÓN DE LA INSTALACIÓN
-- =====================================================

-- Mostrar resumen de registros creados
SELECT 'Departamentos' as tabla, COUNT(*) as registros FROM departamentos
UNION ALL
SELECT 'Empleados', COUNT(*) FROM empleados
UNION ALL
SELECT 'Categorías', COUNT(*) FROM categorias
UNION ALL
SELECT 'Productos', COUNT(*) FROM productos
UNION ALL
SELECT 'Clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'Ventas', COUNT(*) FROM ventas;

-- =====================================================
-- 🎉 ¡BASE DE DATOS INICIALIZADA CORRECTAMENTE!
-- =====================================================
-- Ya puedes comenzar con los ejercicios en la carpeta "ejercicios/"
-- Usa las vistas creadas para consultas más complejas
-- ¡Feliz entrenamiento SQL! 🚀