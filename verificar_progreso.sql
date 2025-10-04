-- =====================================================
-- 📊 TRACKER DE PROGRESO - BOOTCAMP SQL 8 HORAS
-- =====================================================
-- USA ESTA CONSULTA PARA VERIFICAR TU PROGRESO

-- =====================================================
-- 🎯 INFORMACIÓN DEL BOOTCAMP
-- =====================================================
SELECT 
    '🚀 BOOTCAMP SQL: DE 0 A EXPERTO EN 8 HORAS' as "PROGRAMA",
    CURRENT_TIMESTAMP as "VERIFICACIÓN REALIZADA",
    'sqltrainer' as "USUARIO",
    'PostgreSQL ' || version() as "MOTOR BD";

-- =====================================================
-- 📋 CHECKLIST DE PROGRESO
-- =====================================================
SELECT 
    '📚 HORAS COMPLETADAS' as "SECCIÓN",
    'Marca con ✅ las horas que has completado:' as "INSTRUCCIONES";

-- Copia este checklist a tu archivo personal:
/*
PROGRESO PERSONAL - MARCA CON ✅:

⏰ HORAS:
[ ] Hora 1: Fundamentos (SELECT, WHERE, ORDER BY)
[ ] Hora 2: Filtros avanzados (BETWEEN, IN, LIKE, lógica)  
[ ] Hora 3: Agregaciones (COUNT, SUM, AVG, GROUP BY)
[ ] Hora 4: JOINs (INNER, LEFT, RIGHT, múltiples)
[ ] Hora 5: Subconsultas (escalares, correlacionadas, EXISTS)
[ ] Hora 6: Técnicas avanzadas (CTEs, Window Functions)
[ ] Hora 7: Manipulación de datos (INSERT, UPDATE, DELETE)
[ ] Hora 8: Optimización y casos expertos

🎯 EVALUACIONES:
[ ] Evaluación Hora 1 ✅
[ ] Evaluación Hora 2 ✅
[ ] Evaluación Hora 3 ✅
[ ] Evaluación Hora 4 ✅ (PAUSA 30 MIN RECOMENDADA)
[ ] Evaluación Hora 5 ✅
[ ] Evaluación Hora 6 ✅
[ ] Evaluación Hora 7 ✅
[ ] Evaluación Hora 8 ✅ (¡EXAMEN FINAL!)

📊 NIVEL ALCANZADO:
[ ] Básico (Horas 1-2)
[ ] Intermedio (Horas 3-4)
[ ] Avanzado (Horas 5-6)
[ ] Experto (Horas 7-8)

🏆 CERTIFICACIÓN:
[ ] SQL Expert Level Completado ✅
*/

-- =====================================================
-- 🔍 VERIFICACIÓN DE CONOCIMIENTOS POR HORA
-- =====================================================

-- HORA 1: Fundamentos
SELECT '🔍 VERIFICACIÓN HORA 1' as "TEST", 'Ejecuta estas consultas básicas:' as "INSTRUCCIONES";

-- Test 1.1: SELECT básico
SELECT nombre, apellido, salario FROM empleados LIMIT 3;

-- Test 1.2: WHERE con condición
SELECT * FROM productos WHERE precio > 100 LIMIT 3;

-- Test 1.3: ORDER BY
SELECT nombre, salario FROM empleados ORDER BY salario DESC LIMIT 3;

-- =====================================================

-- HORA 2: Filtros avanzados  
SELECT '🔍 VERIFICACIÓN HORA 2' as "TEST", 'Filtros y operadores complejos:' as "INSTRUCCIONES";

-- Test 2.1: BETWEEN
SELECT * FROM empleados WHERE salario BETWEEN 40000 AND 50000;

-- Test 2.2: IN
SELECT * FROM clientes WHERE ciudad IN ('Madrid', 'Barcelona');

-- Test 2.3: LIKE
SELECT * FROM empleados WHERE nombre LIKE 'C%';

-- =====================================================

-- HORA 3: Agregaciones
SELECT '🔍 VERIFICACIÓN HORA 3' as "TEST", 'Funciones agregadas y GROUP BY:' as "INSTRUCCIONES";

-- Test 3.1: COUNT y GROUP BY
SELECT id_departamento, COUNT(*) as num_empleados 
FROM empleados 
GROUP BY id_departamento;

-- Test 3.2: HAVING
SELECT id_departamento, AVG(salario) as salario_promedio
FROM empleados 
GROUP BY id_departamento
HAVING AVG(salario) > 45000;

-- =====================================================

-- HORA 4: JOINs
SELECT '🔍 VERIFICACIÓN HORA 4' as "TEST", 'Relaciones entre tablas:' as "INSTRUCCIONES";

-- Test 4.1: INNER JOIN
SELECT e.nombre, e.apellido, d.nombre_departamento
FROM empleados e
INNER JOIN departamentos d ON e.id_departamento = d.id_departamento
LIMIT 5;

-- Test 4.2: LEFT JOIN con agregación
SELECT d.nombre_departamento, COUNT(e.id_empleado) as num_empleados
FROM departamentos d
LEFT JOIN empleados e ON d.id_departamento = e.id_departamento
GROUP BY d.id_departamento, d.nombre_departamento;

-- =====================================================

-- HORA 5: Subconsultas
SELECT '🔍 VERIFICACIÓN HORA 5' as "TEST", 'Consultas anidadas:' as "INSTRUCCIONES";

-- Test 5.1: Subconsulta escalar
SELECT nombre, apellido, salario
FROM empleados 
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- Test 5.2: EXISTS  
SELECT c.nombre, c.apellido
FROM clientes c
WHERE EXISTS (SELECT 1 FROM ventas v WHERE v.id_cliente = c.id_cliente);

-- =====================================================

-- HORA 6: CTEs y Window Functions
SELECT '🔍 VERIFICACIÓN HORA 6' as "TEST", 'Técnicas avanzadas:' as "INSTRUCCIONES";

-- Test 6.1: CTE
WITH empleados_ventas AS (
    SELECT e.id_empleado, e.nombre, e.apellido, COUNT(v.id_venta) as num_ventas
    FROM empleados e
    LEFT JOIN ventas v ON e.id_empleado = v.id_empleado
    GROUP BY e.id_empleado, e.nombre, e.apellido
)
SELECT * FROM empleados_ventas WHERE num_ventas > 0;

-- Test 6.2: Window Function
SELECT 
    nombre, 
    apellido, 
    salario,
    RANK() OVER (ORDER BY salario DESC) as ranking_salario
FROM empleados
LIMIT 5;

-- =====================================================

-- HORA 7: DML (Ten cuidado - estas consultas modifican datos)
SELECT '🔍 VERIFICACIÓN HORA 7' as "TEST", 'Manipulación de datos (CUIDADO):' as "INSTRUCCIONES";
SELECT 'ℹ️ Para probar DML, usa transacciones con ROLLBACK' as "ADVERTENCIA";

-- Ejemplo seguro con transacción:
/*
BEGIN;
INSERT INTO departamentos (nombre_departamento, ubicacion, presupuesto) 
VALUES ('Test Depto', 'Test Ciudad', 50000);
SELECT * FROM departamentos WHERE nombre_departamento = 'Test Depto';
ROLLBACK; -- Deshace el cambio
*/

-- =====================================================

-- HORA 8: Optimización y casos expertos
SELECT '🔍 VERIFICACIÓN HORA 8' as "TEST", 'Análisis avanzado y optimización:' as "INSTRUCCIONES";

-- Test 8.1: Análisis complejo con múltiples técnicas
WITH ventas_stats AS (
    SELECT 
        EXTRACT(MONTH FROM fecha_venta) as mes,
        COUNT(*) as num_ventas,
        SUM(total_calculado) as total_mes,
        AVG(total_calculado) as promedio_mes
    FROM ventas 
    WHERE EXTRACT(YEAR FROM fecha_venta) = 2024
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
),
ranking_meses AS (
    SELECT 
        mes,
        num_ventas,
        total_mes,
        promedio_mes,
        RANK() OVER (ORDER BY total_mes DESC) as ranking_ingresos
    FROM ventas_stats
)
SELECT * FROM ranking_meses ORDER BY mes;

-- =====================================================
-- 🏆 EVALUACIÓN FINAL DE COMPETENCIAS
-- =====================================================

SELECT '🏆 EVALUACIÓN FINAL' as "EXAMEN", 'Resuelve este caso completo:' as "DESAFÍO";

/*
CASO FINAL: Crear un reporte ejecutivo que muestre:

1. Top 3 empleados por ingresos generados
2. Top 3 productos más vendidos con su categoría  
3. Análisis mensual de 2024 (ventas y crecimiento)
4. Clientes VIP (top 20% por gasto total)
5. Departamentos con mejor performance (ventas/empleado)

CRITERIOS DE EVALUACIÓN:
✅ Usa al menos 2 CTEs
✅ Usa al menos 1 Window Function  
✅ Usa al menos 2 tipos diferentes de JOINs
✅ Incluye agregaciones complejas
✅ El resultado debe ser legible y útil para un ejecutivo

TIEMPO LÍMITE: 30 minutos
NIVEL REQUERIDO: EXPERTO

¿Puedes resolverlo? ¡Es tu examen final!
*/

-- TU SOLUCIÓN AQUÍ:




-- =====================================================
-- 🎓 CERTIFICACIÓN DE COMPETENCIAS
-- =====================================================

SELECT 
    '🎓 CERTIFICACIÓN SQL EXPERT' as "TÍTULO",
    CASE 
        WHEN CURRENT_TIMESTAMP IS NOT NULL THEN '✅ VERIFICACIÓN COMPLETADA'
        ELSE '❌ ERROR EN VERIFICACIÓN'
    END as "ESTADO",
    'Has demostrado dominio en todas las áreas de SQL' as "LOGRO",
    '¡Felicidades por completar el bootcamp!' as "MENSAJE";

-- =====================================================
-- 📈 PRÓXIMOS PASOS RECOMENDADOS
-- =====================================================

SELECT '📈 PRÓXIMOS PASOS' as "DESARROLLO_CONTINUO", 
       'Continúa creciendo como experto SQL:' as "RECOMENDACIONES";

/*
🚀 PRÓXIMOS NIVELES:

1. ESPECIALIZACIÓN:
   • PostgreSQL avanzado (arrays, JSON, full-text search)
   • Stored procedures y triggers
   • Partitioning y sharding
   • Replicación y alta disponibilidad

2. HERRAMIENTAS COMPLEMENTARIAS:
   • Power BI / Tableau para visualización
   • Python/R para análisis de datos
   • Apache Spark para Big Data
   • dbt para transformaciones

3. CERTIFICACIONES:
   • PostgreSQL Certified Professional
   • Microsoft SQL Server Certification
   • Oracle Database Certification
   • Google Cloud SQL Certification

4. PROYECTOS PRÁCTICOS:
   • Data Warehouse personal
   • Sistema de BI para negocio real
   • API REST con base de datos
   • Migración de bases de datos

5. COMUNIDAD:
   • Stack Overflow (ayuda a otros)
   • GitHub (proyectos SQL)
   • LinkedIn (networking)
   • Conferencias de datos
*/

-- =====================================================
-- 🏆 ¡FELICIDADES, SQL EXPERT!
-- =====================================================

SELECT 
    '🎉' as "🎉",
    'HAS COMPLETADO EL BOOTCAMP SQL' as "🏆 LOGRO DESBLOQUEADO",
    'DE 0 A EXPERTO EN 8 HORAS' as "⚡ HAZAÑA",
    '¡ERES OFICIALMENTE UN EXPERTO SQL!' as "🌟 NUEVO TÍTULO";

-- Guarda este archivo como evidencia de tu logro
-- Compártelo en LinkedIn para mostrar tu nueva habilidad
-- ¡El mundo de los datos te espera! 🚀