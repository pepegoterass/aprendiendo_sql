-- =====================================================
-- 📊 DATOS DE MUESTRA - POSTGRESQL
-- =====================================================
-- Inserción de datos realistas para el entrenamiento

-- =====================================================
-- 🏢 INSERTAR DEPARTAMENTOS
-- =====================================================
INSERT INTO departamentos (nombre_departamento, ubicacion, presupuesto) VALUES
('Ventas', 'Madrid', 150000.00),
('Marketing', 'Barcelona', 120000.00),
('Desarrollo', 'Valencia', 200000.00),
('Recursos Humanos', 'Sevilla', 80000.00),
('Finanzas', 'Madrid', 100000.00),
('Soporte Técnico', 'Bilbao', 90000.00),
('Logística', 'Zaragoza', 110000.00);

-- =====================================================
-- 👥 INSERTAR EMPLEADOS
-- =====================================================
INSERT INTO empleados (nombre, apellido, email, telefono, fecha_contratacion, salario, id_departamento, id_jefe) VALUES
-- Jefes de departamento (sin jefe)
('Carlos', 'García', 'carlos.garcia@empresa.com', '600123456', '2020-01-15', 55000.00, 1, NULL),
('María', 'López', 'maria.lopez@empresa.com', '600234567', '2020-03-20', 52000.00, 2, NULL),
('Juan', 'Martínez', 'juan.martinez@empresa.com', '600345678', '2019-11-10', 65000.00, 3, NULL),
('Ana', 'Rodríguez', 'ana.rodriguez@empresa.com', '600456789', '2021-05-12', 48000.00, 4, NULL),
('Pedro', 'Sánchez', 'pedro.sanchez@empresa.com', '600567890', '2020-08-30', 58000.00, 5, NULL),

-- Empleados de Ventas
('Laura', 'Fernández', 'laura.fernandez@empresa.com', '600678901', '2021-02-14', 35000.00, 1, 1),
('David', 'Moreno', 'david.moreno@empresa.com', '600901234', '2021-09-25', 37000.00, 1, 1),
('Carmen', 'Ruiz', 'carmen.ruiz@empresa.com', '600890123', '2022-01-10', 33000.00, 1, 1),

-- Empleados de Marketing
('Miguel', 'Torres', 'miguel.torres@empresa.com', '600789012', '2021-07-19', 42000.00, 2, 2),
('Isabel', 'Jiménez', 'isabel.jimenez@empresa.com', '600012345', '2022-03-08', 39000.00, 2, 2),

-- Empleados de Desarrollo
('Roberto', 'Vega', 'roberto.vega@empresa.com', '601123456', '2021-01-20', 55000.00, 3, 3),
('Cristina', 'Navarro', 'cristina.navarro@empresa.com', '601234567', '2021-06-15', 52000.00, 3, 3),
('Alejandro', 'Ramos', 'alejandro.ramos@empresa.com', '601345678', '2022-02-10', 48000.00, 3, 3),

-- Empleados de RRHH
('Beatriz', 'Gil', 'beatriz.gil@empresa.com', '601456789', '2021-11-08', 36000.00, 4, 4),

-- Empleados de Finanzas
('Raúl', 'Peña', 'raul.pena@empresa.com', '601567890', '2021-04-12', 45000.00, 5, 5),
('Silvia', 'Romero', 'silvia.romero@empresa.com', '601678901', '2022-01-25', 43000.00, 5, 5);

-- =====================================================
-- 🏷️ INSERTAR CATEGORÍAS
-- =====================================================
INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Electrónicos', 'Dispositivos electrónicos, smartphones, laptops, tablets'),
('Ropa y Moda', 'Vestimenta, calzado y accesorios de moda'),
('Hogar y Jardín', 'Artículos para el hogar, muebles, decoración'),
('Deportes y Fitness', 'Equipamiento deportivo, ropa deportiva, suplementos'),
('Libros y Educación', 'Literatura, material educativo, cursos online'),
('Salud y Belleza', 'Productos de cuidado personal, cosméticos, salud'),
('Automóvil', 'Accesorios para vehículos, herramientas, repuestos');

-- =====================================================
-- 📦 INSERTAR PRODUCTOS
-- =====================================================
INSERT INTO productos (nombre_producto, descripcion, precio, stock, id_categoria) VALUES
-- Electrónicos
('iPhone 15 Pro', 'Smartphone Apple iPhone 15 Pro 256GB', 1199.99, 25, 1),
('Samsung Galaxy S24', 'Smartphone Samsung Galaxy S24 128GB', 899.99, 30, 1),
('MacBook Air M3', 'Laptop Apple MacBook Air 13" M3 256GB', 1299.99, 15, 1),
('HP Pavilion 15', 'Laptop HP Pavilion 15" Intel i7 512GB SSD', 799.99, 20, 1),
('iPad Pro 12.9', 'Tablet Apple iPad Pro 12.9" 256GB', 1099.99, 18, 1),
('Auriculares Sony WH-1000XM5', 'Auriculares inalámbricos con cancelación de ruido', 349.99, 45, 1),

-- Ropa y Moda
('Camiseta Nike Dri-FIT', 'Camiseta deportiva Nike talla M', 29.99, 100, 2),
('Jeans Levi''s 501', 'Jeans clásicos Levi''s 501 talla 32', 89.99, 60, 2),
('Zapatillas Adidas Ultraboost', 'Zapatillas running Adidas Ultraboost', 179.99, 40, 2),
('Chaqueta North Face', 'Chaqueta impermeable The North Face', 149.99, 25, 2),

-- Hogar y Jardín
('Sofá Chester 3 plazas', 'Sofá Chester de cuero sintético 3 plazas', 599.99, 8, 3),
('Mesa de comedor roble', 'Mesa de comedor de madera de roble para 6 personas', 449.99, 12, 3),
('Lámpara LED regulable', 'Lámpara de pie LED con regulador de intensidad', 89.99, 35, 3),
('Aspiradora Dyson V15', 'Aspiradora sin cable Dyson V15 Detect', 649.99, 20, 3),

-- Deportes y Fitness
('Bicicleta Trek FX3', 'Bicicleta híbrida Trek FX3 talla M', 699.99, 15, 4),
('Pesas ajustables 20kg', 'Set de pesas ajustables hasta 20kg por mancuerna', 299.99, 25, 4),
('Raqueta Wilson Pro Staff', 'Raqueta de tenis Wilson Pro Staff RF97', 199.99, 20, 4),
('Balón Nike Premier League', 'Balón oficial Nike Premier League 2024', 49.99, 50, 4),

-- Libros y Educación
('Curso Python Completo', 'Curso online completo de programación Python', 199.99, 999, 5),
('Clean Code', 'Libro "Clean Code" de Robert C. Martin', 39.99, 100, 5),
('El Arte de la Guerra', 'Libro clásico "El Arte de la Guerra" de Sun Tzu', 15.99, 200, 5),

-- Salud y Belleza
('Crema hidratante L''Oréal', 'Crema hidratante facial L''Oréal 50ml', 24.99, 80, 6),
('Perfume Chanel No.5', 'Perfume Chanel No.5 eau de parfum 50ml', 129.99, 30, 6),
('Proteína Whey Gold', 'Proteína en polvo Whey Gold 2kg sabor vainilla', 59.99, 45, 6),

-- Automóvil
('Neumáticos Michelin', 'Set de 4 neumáticos Michelin 205/55R16', 399.99, 20, 7),
('GPS TomTom', 'Navegador GPS TomTom GO Premium 6"', 199.99, 25, 7),
('Kit herramientas coche', 'Kit completo de herramientas para automóvil', 89.99, 30, 7);

-- =====================================================
-- 👥 INSERTAR CLIENTES
-- =====================================================
INSERT INTO clientes (nombre, apellido, email, telefono, direccion, ciudad, codigo_postal, pais) VALUES
('Antonio', 'González', 'antonio.gonzalez@email.com', '610123456', 'Calle Mayor 123, 4°B', 'Madrid', '28001', 'España'),
('Lucía', 'Vázquez', 'lucia.vazquez@email.com', '620234567', 'Av. Diagonal 456, 2°A', 'Barcelona', '08001', 'España'),
('Francisco', 'Herrera', 'francisco.herrera@email.com', '630345678', 'Plaza España 789', 'Valencia', '46001', 'España'),
('Elena', 'Castro', 'elena.castro@email.com', '640456789', 'Calle Sierpes 321, 1°C', 'Sevilla', '41001', 'España'),
('Roberto', 'Ortega', 'roberto.ortega@email.com', '650567890', 'Gran Vía 654, 5°D', 'Madrid', '28013', 'España'),
('Cristina', 'Medina', 'cristina.medina@email.com', '660678901', 'Las Ramblas 987, 3°A', 'Barcelona', '08002', 'España'),
('Alejandro', 'Cortés', 'alejandro.cortes@email.com', '670789012', 'Calle Colón 147, 2°B', 'Valencia', '46002', 'España'),
('Beatriz', 'Delgado', 'beatriz.delgado@email.com', '680890123', 'Alameda 258, 4°A', 'Sevilla', '41002', 'España'),
('Raúl', 'Aguilar', 'raul.aguilar@email.com', '690901234', 'Castellana 369, 6°C', 'Madrid', '28046', 'España'),
('Silvia', 'Prieto', 'silvia.prieto@email.com', '600012345', 'Paseo Gracia 741, 1°D', 'Barcelona', '08007', 'España'),
('Diego', 'Flores', 'diego.flores@email.com', '611123456', 'Calle Larios 852, 3°B', 'Málaga', '29001', 'España'),
('Carmen', 'Iglesias', 'carmen.iglesias@email.com', '622234567', 'Alameda Principal 963, 2°A', 'Málaga', '29005', 'España'),
('Sergio', 'Rubio', 'sergio.rubio@email.com', '633345678', 'Calle Uría 741, 4°C', 'Oviedo', '33003', 'España'),
('Natalia', 'Guerrero', 'natalia.guerrero@email.com', '644456789', 'Plaza Pilatos 159, 1°B', 'Sevilla', '41003', 'España'),
('Adrián', 'Marín', 'adrian.marin@email.com', '655567890', 'Calle Alcalá 357, 5°A', 'Madrid', '28009', 'España');

-- =====================================================
-- 💰 INSERTAR VENTAS
-- =====================================================
INSERT INTO ventas (id_cliente, id_producto, id_empleado, cantidad, precio_unitario, descuento, fecha_venta, notas) VALUES
-- Enero 2024
(1, 1, 6, 1, 1199.99, 0.00, '2024-01-15 10:30:00', 'Cliente VIP - Sin descuento'),
(2, 3, 6, 1, 1299.99, 5.00, '2024-01-18 14:15:00', 'Descuento por fidelidad'),
(3, 7, 7, 2, 29.99, 0.00, '2024-01-22 09:45:00', 'Compra para regalo'),
(4, 11, 6, 1, 599.99, 10.00, '2024-01-25 16:20:00', 'Promoción muebles'),

-- Febrero 2024
(5, 15, 7, 1, 699.99, 0.00, '2024-02-02 11:10:00', 'Entrega urgente solicitada'),
(1, 19, 6, 5, 39.99, 0.00, '2024-02-08 13:30:00', 'Descuento por volumen aplicado'),
(6, 5, 7, 1, 1099.99, 0.00, '2024-02-12 15:45:00', 'Compra empresarial'),
(7, 9, 6, 1, 179.99, 0.00, '2024-02-18 12:00:00', 'Cliente nuevo'),

-- Marzo 2024
(8, 13, 7, 2, 89.99, 0.00, '2024-03-05 10:15:00', 'Compra conjunta con familia'),
(9, 2, 6, 1, 899.99, 0.00, '2024-03-12 17:30:00', 'Renovación smartphone'),
(2, 6, 7, 1, 349.99, 0.00, '2024-03-18 09:00:00', 'Compra adicional'),
(10, 8, 6, 3, 89.99, 0.00, '2024-03-22 14:45:00', 'Regalos de cumpleaños'),

-- Abril 2024
(3, 4, 7, 1, 799.99, 0.00, '2024-04-08 11:30:00', 'Upgrade laptop trabajo'),
(11, 16, 6, 1, 299.99, 0.00, '2024-04-15 16:15:00', 'Inicio rutina fitness'),
(5, 14, 7, 1, 649.99, 5.00, '2024-04-20 13:20:00', 'Cliente frecuente'),
(12, 18, 6, 1, 49.99, 0.00, '2024-04-25 10:45:00', 'Compra deportiva'),

-- Mayo 2024
(4, 21, 7, 1, 199.99, 0.00, '2024-05-03 15:00:00', 'Curso online desarrollo'),
(13, 10, 6, 1, 149.99, 0.00, '2024-05-10 12:30:00', 'Ropa de temporada'),
(6, 20, 7, 1, 199.99, 0.00, '2024-05-18 14:20:00', 'Equipo tenis nuevo'),
(14, 24, 6, 1, 129.99, 0.00, '2024-05-25 11:15:00', 'Regalo aniversario'),

-- Junio 2024
(7, 12, 7, 1, 449.99, 10.00, '2024-06-05 16:45:00', 'Renovación comedor'),
(15, 1, 6, 1, 1199.99, 0.00, '2024-06-12 10:00:00', 'Upgrade smartphone premium'),
(8, 17, 7, 1, 199.99, 0.00, '2024-06-20 13:45:00', 'Equipo tenis profesional'),
(1, 25, 6, 1, 59.99, 0.00, '2024-06-28 15:30:00', 'Suplemento deportivo'),

-- Julio-Septiembre 2024 (más ventas para análisis)
(9, 26, 7, 4, 399.99, 0.00, '2024-07-08 11:20:00', 'Cambio neumáticos completo'),
(10, 6, 6, 2, 349.99, 5.00, '2024-07-15 14:30:00', 'Pack auriculares familia'),
(11, 15, 7, 1, 699.99, 0.00, '2024-08-10 12:15:00', 'Bicicleta urbana'),
(12, 22, 6, 2, 39.99, 0.00, '2024-08-22 16:00:00', 'Literatura clásica'),
(13, 3, 7, 1, 1299.99, 10.00, '2024-09-05 10:45:00', 'Laptop trabajo remoto'),
(14, 27, 6, 1, 199.99, 0.00, '2024-09-18 13:15:00', 'GPS nuevo vehículo'),
(15, 23, 7, 1, 24.99, 0.00, '2024-09-25 15:45:00', 'Producto cuidado facial');

-- =====================================================
-- 📊 ESTADÍSTICAS DE VERIFICACIÓN
-- =====================================================

-- Mostrar resumen de registros insertados
DO $$ 
DECLARE
    dept_count INTEGER;
    emp_count INTEGER;
    cat_count INTEGER;
    prod_count INTEGER;
    client_count INTEGER;
    sales_count INTEGER;
    total_sales DECIMAL(10,2);
BEGIN
    SELECT COUNT(*) INTO dept_count FROM departamentos;
    SELECT COUNT(*) INTO emp_count FROM empleados;
    SELECT COUNT(*) INTO cat_count FROM categorias;
    SELECT COUNT(*) INTO prod_count FROM productos;
    SELECT COUNT(*) INTO client_count FROM clientes;
    SELECT COUNT(*) INTO sales_count FROM ventas;
    SELECT SUM(total_calculado) INTO total_sales FROM ventas;
    
    RAISE NOTICE '📊 RESUMEN DE DATOS INSERTADOS:';
    RAISE NOTICE '🏢 Departamentos: %', dept_count;
    RAISE NOTICE '👥 Empleados: %', emp_count;
    RAISE NOTICE '🏷️ Categorías: %', cat_count;
    RAISE NOTICE '📦 Productos: %', prod_count;
    RAISE NOTICE '👤 Clientes: %', client_count;
    RAISE NOTICE '💰 Ventas: %', sales_count;
    RAISE NOTICE '💵 Total facturado: €%', COALESCE(total_sales, 0);
    RAISE NOTICE '🎉 ¡Datos de muestra cargados correctamente!';
END $$;