-- =====================================================
-- 🧪 PRUEBA RÁPIDA - VERIFICACIÓN DEL ENTORNO
-- =====================================================
-- Ejecuta estas consultas para verificar que todo funciona correctamente

-- =====================================================
-- ✅ PASO 1: Verificar tablas creadas
-- =====================================================
-- Esta consulta muestra todas las tablas de la base de datos
SELECT 
    table_name as "📋 Tabla",
    table_type as "🔧 Tipo"
FROM information_schema.tables 
WHERE table_schema = 'public'
ORDER BY table_name;

-- =====================================================
-- ✅ PASO 2: Contar registros en cada tabla
-- =====================================================
-- Verifica que los datos se cargaron correctamente
SELECT 'departamentos' as "📊 Tabla", COUNT(*) as "🔢 Registros" FROM departamentos
UNION ALL
SELECT 'empleados', COUNT(*) FROM empleados
UNION ALL
SELECT 'categorias', COUNT(*) FROM categorias
UNION ALL
SELECT 'productos', COUNT(*) FROM productos
UNION ALL
SELECT 'clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'ventas', COUNT(*) FROM ventas
ORDER BY "📊 Tabla";

-- =====================================================
-- ✅ PASO 3: Tu primera consulta real
-- =====================================================
-- Muestra información básica de empleados
SELECT 
    nombre || ' ' || apellido as "👤 Empleado",
    email as "📧 Email",
    salario as "💰 Salario"
FROM empleados 
ORDER BY salario DESC 
LIMIT 5;

-- =====================================================
-- ✅ PASO 4: Consulta con JOIN
-- =====================================================
-- Empleados con su departamento
SELECT 
    e.nombre || ' ' || e.apellido as "👤 Empleado",
    d.nombre_departamento as "🏢 Departamento",
    d.ubicacion as "📍 Ubicación"
FROM empleados e
JOIN departamentos d ON e.id_departamento = d.id_departamento
ORDER BY d.nombre_departamento, e.apellido;

-- =====================================================
-- ✅ PASO 5: Análisis de ventas
-- =====================================================
-- Resumen de ventas por mes
SELECT 
    TO_CHAR(fecha_venta, 'YYYY-MM') as "📅 Mes",
    COUNT(*) as "🛒 Número Ventas",
    SUM(total_calculado)::DECIMAL(10,2) as "💵 Total Vendido"
FROM ventas 
GROUP BY TO_CHAR(fecha_venta, 'YYYY-MM')
ORDER BY "📅 Mes";

-- =====================================================
-- 🎉 ¡SI VES RESULTADOS AQUÍ, TODO FUNCIONA PERFECTAMENTE!
-- =====================================================

-- 💡 Próximos pasos:
-- 1. Ve a la carpeta ejercicios/01_basico/
-- 2. Comienza con ejercicios_basicos.sql
-- 3. ¡Disfruta aprendiendo SQL!

-- 🚀 Consulta de motivación final:
SELECT 
    '🎓' as "Icono",
    'Has configurado exitosamente tu entorno de entrenamiento SQL' as "🎉 ¡Felicidades!",
    'Estás listo para convertirte en un maestro de SQL' as "💪 Tu destino";