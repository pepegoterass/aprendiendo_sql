-- =====================================================
-- 📊 HORA 3: FUNCIONES AGREGADAS Y GROUP BY (Intermedio)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar análisis estadístico con SQL

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🧮 FUNCIONES AGREGADAS:
- COUNT(): contar registros
- SUM(): sumar valores numéricos
- AVG(): promedio de valores
- MIN(): valor mínimo
- MAX(): valor máximo
- COUNT(DISTINCT): contar valores únicos

👥 GROUP BY:
- Agrupa filas por uno o más campos
- Permite aplicar funciones agregadas por grupo
- Se ejecuta DESPUÉS del WHERE
- Todo campo en SELECT debe estar en GROUP BY o ser agregado

🎯 HAVING:
- Filtra DESPUÉS de agrupar
- Usa funciones agregadas en condiciones
- WHERE filtra antes de agrupar, HAVING después

📐 ORDEN DE EJECUCIÓN:
1. FROM
2. WHERE  
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT
*/

-- =====================================================
-- 🔢 EJERCICIO 1: FUNCIONES BÁSICAS (10 min)
-- =====================================================

-- 1.1 Contar total de empleados
-- TU TURNO:
SELECT COUNT(*) FROM empleados;



-- 1.2 Salario promedio de todos los empleados
-- TU TURNO:
SELECT AVG(salario) FROM empleados;



-- 1.3 Salario más alto y más bajo
-- TU TURNO:
SELECT MAX(salario) AS salario_maximo, MIN(salario) AS salario_minimo FROM empleados;



-- 1.4 Suma total de todos los salarios (nómina mensual)
-- TU TURNO:
SELECT SUM(salario) FROM empleados;




-- 1.5 Contar productos únicos vendidos
-- PISTA: COUNT(DISTINCT id_producto) FROM ventas
-- TU TURNO:
SELECT COUNT(DISTINCT id_producto) FROM ventas;




-- =====================================================
-- 👥 EJERCICIO 2: GROUP BY BÁSICO (10 min)
-- =====================================================

-- 2.1 Número de empleados por departamento
-- TU TURNO:
SELECT departamento_id, COUNT(*) AS num_empleados FROM empleados GROUP BY departamento_id;



-- 2.2 Salario promedio por departamento
-- TU TURNO:
SELECT departamento_id, AVG(salario) AS salario_promedio FROM empleados GROUP BY departamento_id


-- 2.3 Número de productos por categoría
-- TU TURNO:
SELECT categoria, COUNT(*) AS num_productos FROM productos GROUP BY categoria;



-- 2.4 Número de clientes por ciudad
-- TU TURNO:
SELECT ciudad, COUNT(*) AS num_clientes FROM clientes GROUP BY ciudad;



-- 2.5 Ventas totales por cliente (suma de total_calculado)
-- TU TURNO:
SELECT id_cliente, SUM(total_calculado) AS total_compras FROM ventas GROUP BY id_cliente;



-- =====================================================
-- 📈 EJERCICIO 3: ANÁLISIS ESTADÍSTICO (10 min)
-- =====================================================

-- 3.1 Estadísticas completas de salarios por departamento
-- (contar, promedio, mínimo, máximo, suma)
-- TU TURNO:
SELECT 
    departamento_id,
    COUNT(*) AS num_empleados,
    AVG(salario) AS salario_promedio, 
    MIN(salario) AS salario_minimo,
    MAX(salario) AS salario_maximo,
    SUM(salario) AS masa_salarial
FROM empleados
GROUP BY departamento_id;



-- 3.2 Análisis de productos por categoría
-- (cantidad productos, precio promedio, precio máximo)
-- TU TURNO:
SELECT
categoria,
COUNT(*) AS num_productos,
AVG(precio) AS precio_promedio,
MAX(precio) AS precio_maximo
FROM productos
GROUP BY categoria;



-- 3.3 Resumen de ventas por mes de 2024
-- PISTA: usar DATE_PART('month', fecha_venta)
-- TU TURNO:
SELECT
    DATE_PART('month', fecha_venta) AS mes,
    COUNT(*) AS num_ventas,
    SUM(total_calculado) AS total_facturado,
    AVG(total_calculado) AS ticket_promedio
FROM ventas
WHERE DATE_PART('year', fecha_venta) = 2024
GROUP BY mes
ORDER BY mes;



-- 3.4 Análisis de clientes por país
-- TU TURNO:
SELECT
pais,
COUNT(*) AS num_clientes,
AVG(edad) AS edad_promedio,
MIN(edad) AS edad_minima,
MAX(edad) AS edad_maxima
FROM clientes
GROUP BY pais;



-- =====================================================
-- 🎯 EJERCICIO 4: HAVING - FILTRAR GRUPOS (10 min)
-- =====================================================

-- 4.1 Departamentos con más de 2 empleados
-- TU TURNO:
SELECT 
    departamento_id,
    COUNT(*) AS num_empleados
    FROM empleados 
    GROUP BY departamento_id,
    HAVING COUNT(*) > 2;



-- 4.2 Categorías con precio promedio > 200€
-- TU TURNO:
SELECT 
    categoria,
    AVG(precio) AS precio_promedio
FROM productos
GROUP BY categoria
HAVING AVG(precio) > 200;



-- 4.3 Clientes que han comprado más de 2 veces
-- TU TURNO:
SELECT 
    id_cliente,
    COUNT(*) AS num_compras
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 2;



-- 4.4 Departamentos con salario promedio > 45000
-- TU TURNO:




-- 4.5 Ciudades con más de 1 cliente
-- TU TURNO:




-- =====================================================
-- 🔥 EJERCICIO 5: COMBINACIONES AVANZADAS (10 min)
-- =====================================================

-- 5.1 TOP 3 departamentos con mayor masa salarial
-- TU TURNO:




-- 5.2 Productos más vendidos (por cantidad total)
-- TU TURNO:




-- 5.3 Meses con mayores ventas en 2024
-- TU TURNO:




-- 5.4 Empleados de ventas con su total vendido (si han vendido)
-- PISTA: Necesitarás WHERE id_departamento = 1
-- TU TURNO:




-- 5.5 Categorías con más de 3 productos Y precio promedio < 500
-- TU TURNO:




-- =====================================================
-- 🎯 EVALUACIÓN HORA 3 (5 min)
-- =====================================================

-- E1. Departamentos con más de 1 empleado, mostrando:
--     nombre_departamento, num_empleados, salario_promedio, salario_total
--     Ordenado por salario_total descendente
-- TU SOLUCIÓN:




-- E2. TOP 5 productos más vendidos (por cantidad total), mostrando:
--     nombre_producto, categoria, cantidad_total_vendida, ingresos_totales
-- TU SOLUCIÓN:




-- E3. Análisis mensual de 2024: mes, número_ventas, total_facturado
--     Solo meses con más de 2 ventas, ordenado por total_facturado DESC
-- TU SOLUCIÓN:




-- =====================================================
-- 💼 CASOS EMPRESARIALES REALES (5 min)
-- =====================================================

-- Caso 1: Análisis de performance de ventas
-- ¿Qué empleado ha generado más ingresos?
-- TU SOLUCIÓN:




-- Caso 2: Segmentación de productos
-- ¿Qué categorías generan más del 20% de los ingresos totales?
-- TU SOLUCIÓN:




-- Caso 3: Análisis de clientes VIP
-- ¿Qué clientes han gastado más de 1000€ en total?
-- TU SOLUCIÓN:




-- =====================================================
-- 🧠 DESAFÍOS MENTALES (Opcional)
-- =====================================================

-- Desafío 1: Diferencia entre mayor y menor salario por departamento
-- TU SOLUCIÓN:




-- Desafío 2: Porcentaje de ventas por empleado sobre el total
-- TU SOLUCIÓN:




-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 3 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - COUNT, SUM, AVG, MIN, MAX
-- - COUNT(DISTINCT)  
-- - GROUP BY con una y múltiples columnas
-- - HAVING para filtrar grupos
-- - Análisis estadístico completo
-- - Combinación de agregaciones con ORDER BY y LIMIT
-- - Casos de uso empresariales

-- 🚀 Próximo nivel: hora_04_joins
-- 💪 ¡Eres oficialmente un SQL Analyst nivel 3!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████████████░░] 90% hacia intermedio-avanzado

-- 🎯 HABILIDAD DESBLOQUEADA: Análisis de datos empresariales