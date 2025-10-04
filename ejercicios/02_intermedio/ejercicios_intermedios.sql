-- =====================================================
-- 🎯 EJERCICIOS INTERMEDIOS - NIVEL 2
-- =====================================================
-- JOINs, GROUP BY, HAVING y Funciones Agregadas
-- ¡Subimos el nivel! 💪

-- INSTRUCCIONES:
-- 1. Asegúrate de haber completado los ejercicios básicos
-- 2. Estos ejercicios requieren combinar tablas (JOINs)
-- 3. Usaremos funciones como COUNT, SUM, AVG
-- 4. ¡No te desanimes si es más difícil!

-- =====================================================
-- 🔗 EJERCICIO 1: INNER JOINs
-- =====================================================
-- Objetivo: Combinar información de múltiples tablas

-- 1.1 Empleados con su nombre de departamento
-- TU CONSULTA AQUÍ:




-- 1.2 Productos con su categoría
-- TU CONSULTA AQUÍ:




-- 1.3 Ventas con información del cliente y producto
-- TU CONSULTA AQUÍ:




-- =====================================================
-- 🔗 EJERCICIO 2: LEFT JOINs
-- =====================================================
-- Objetivo: Incluir registros aunque no tengan coincidencias

-- 2.1 Todos los empleados, incluso sin departamento asignado
-- TU CONSULTA AQUÍ:




-- 2.2 Todos los productos, incluso sin ventas
-- TU CONSULTA AQUÍ:
-- PISTA: Combina productos con ventas usando LEFT JOIN




-- =====================================================
-- 📊 EJERCICIO 3: FUNCIONES AGREGADAS
-- =====================================================
-- Objetivo: Calcular estadísticas con COUNT, SUM, AVG, etc.

-- 3.1 Número total de empleados
-- TU CONSULTA AQUÍ:




-- 3.2 Salario promedio de todos los empleados
-- TU CONSULTA AQUÍ:




-- 3.3 Precio más alto y más bajo de los productos
-- TU CONSULTA AQUÍ:




-- 3.4 Total de ventas realizadas (suma de todas las ventas)
-- TU CONSULTA AQUÍ:
-- PISTA: cantidad * precio_unitario - descuento




-- =====================================================
-- 👥 EJERCICIO 4: GROUP BY
-- =====================================================
-- Objetivo: Agrupar datos para análisis

-- 4.1 Número de empleados por departamento
-- TU CONSULTA AQUÍ:




-- 4.2 Productos por categoría (con nombre de categoría)
-- TU CONSULTA AQUÍ:




-- 4.3 Total de ventas por cliente
-- TU CONSULTA AQUÍ:




-- 4.4 Ventas por mes (2023)
-- TU CONSULTA AQUÍ:
-- PISTA: Usa strftime('%Y-%m', fecha_venta) para extraer año-mes




-- =====================================================
-- 🎯 EJERCICIO 5: HAVING
-- =====================================================
-- Objetivo: Filtrar grupos (usar HAVING en lugar de WHERE)

-- 5.1 Departamentos con más de 2 empleados
-- TU CONSULTA AQUÍ:




-- 5.2 Clientes que han comprado más de 3 productos (total cantidad)
-- TU CONSULTA AQUÍ:




-- 5.3 Productos vendidos más de 2 veces
-- TU CONSULTA AQUÍ:




-- =====================================================
-- 🌟 EJERCICIO 6: COMBINANDO TODO
-- =====================================================
-- Objetivo: Consultas complejas combinando múltiples conceptos

-- 6.1 Departamentos con salario promedio > 40000
-- Mostrar: nombre departamento, número empleados, salario promedio
-- TU CONSULTA AQUÍ:




-- 6.2 Top 3 productos más vendidos (por cantidad total vendida)
-- Mostrar: nombre producto, categoría, cantidad total vendida
-- TU CONSULTA AQUÍ:




-- 6.3 Empleados de ventas con sus totales vendidos
-- Mostrar: nombre empleado, número de ventas, total vendido
-- TU CONSULTA AQUÍ:




-- =====================================================
-- 💡 EJERCICIO BONUS: ANÁLISIS AVANZADO
-- =====================================================
-- ¡Desafíos para los más aventureros!

-- B.1 Clientes que nunca han comprado
-- TU CONSULTA AQUÍ:
-- PISTA: Usa LEFT JOIN y WHERE ... IS NULL




-- B.2 Productos sin stock que han sido vendidos
-- TU CONSULTA AQUÍ:




-- B.3 Empleado del mes (quien más ha vendido en total)
-- TU CONSULTA AQUÍ:




-- B.4 Análisis de ventas por ciudad
-- Mostrar: ciudad, número de clientes, total vendido
-- TU CONSULTA AQUÍ:




-- =====================================================
-- 🎓 ¡EXCELENTE TRABAJO!
-- =====================================================
-- Has dominado los JOINs y agregaciones
-- 
-- Próximos pasos:
-- 1. Revisa las soluciones
-- 2. Continúa con ejercicios avanzados
-- 3. Experimenta con tus propias consultas
--
-- ¡Cada consulta te hace más fuerte! 🚀