-- =====================================================
-- ⚡ HORA 6: CTEs Y FUNCIONES DE VENTANA (Experto)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar técnicas avanzadas de análisis

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🎯 CTEs (Common Table Expressions):
- Tablas temporales nombradas dentro de una consulta
- Más legibles que subconsultas complejas
- Sintaxis: WITH nombre_cte AS (SELECT ...) SELECT ... FROM nombre_cte
- Pueden ser recursivas para jerarquías

⚡ FUNCIONES DE VENTANA (Window Functions):
- Realizan cálculos sobre un conjunto de filas relacionadas
- NO agrupa filas como GROUP BY
- Sintaxis: función() OVER (PARTITION BY ... ORDER BY ...)

🔢 FUNCIONES DE RANKING:
- ROW_NUMBER(): Número único secuencial
- RANK(): Ranking con empates (1,2,2,4)
- DENSE_RANK(): Ranking denso (1,2,2,3)
- NTILE(n): Divide en n grupos

📊 FUNCIONES DE AGREGACIÓN CON VENTANA:
- SUM() OVER(): Suma acumulativa o por ventana
- AVG() OVER(): Promedio móvil
- COUNT() OVER(): Conteo por ventana
- MIN/MAX() OVER(): Mínimo/máximo por ventana

🎚️ FUNCIONES DE ACCESO:
- LAG(campo, n): Valor n posiciones atrás
- LEAD(campo, n): Valor n posiciones adelante
- FIRST_VALUE(): Primer valor de la ventana
- LAST_VALUE(): Último valor de la ventana
*/

-- =====================================================
-- 📊 EJERCICIO 1: CTEs BÁSICOS (10 min)
-- =====================================================

-- 1.1 CTE simple: Empleados con salario alto
WITH empleados_bien_pagados AS (
    SELECT * FROM empleados WHERE salario > 45000
)
SELECT nombre, apellido, salario FROM empleados_bien_pagados
ORDER BY salario DESC;

-- 1.2 CTE con agregación: Resumen por departamento
WITH resumen_dept AS (
    -- TU TURNO: Crear CTE con stats por departamento
    SELECT 
        id_departamento,
        COUNT(*) as num_empleados,
        AVG(salario) as salario_promedio,
        SUM(salario) as masa_salarial
    FROM empleados 
    GROUP BY id_departamento
)
-- TU TURNO: Usar el CTE para mostrar departamentos con masa_salarial > 100000




-- 1.3 Múltiples CTEs: Análisis de ventas
WITH ventas_por_producto AS (
    -- TU TURNO: Suma de ventas por producto
    
), productos_top AS (
    -- TU TURNO: Top 5 productos más vendidos
    
)
-- TU TURNO: Combinar CTEs para análisis final




-- =====================================================
-- 🏆 EJERCICIO 2: FUNCIONES DE RANKING (10 min)
-- =====================================================

-- 2.1 Ranking de empleados por salario
-- TU TURNO: ROW_NUMBER, RANK, DENSE_RANK
SELECT 
    nombre,
    apellido,
    salario,
    ROW_NUMBER() OVER (ORDER BY salario DESC) as numero_fila,
    RANK() OVER (ORDER BY salario DESC) as ranking,
    DENSE_RANK() OVER (ORDER BY salario DESC) as ranking_denso
FROM empleados;

-- 2.2 Ranking por departamento
-- TU TURNO: Top 2 empleados mejor pagados por departamento




-- 2.3 Percentiles de productos por precio
-- TU TURNO: Dividir productos en 4 grupos (cuartiles) por precio




-- 2.4 Ranking de clientes por gasto total
-- TU TURNO: Usar window function para calcular ranking de gastos




-- =====================================================
-- 📈 EJERCICIO 3: FUNCIONES DE AGREGACIÓN CON VENTANA (15 min)
-- =====================================================

-- 3.1 Suma acumulativa de ventas por fecha
-- TU TURNO: Running total de ventas




-- 3.2 Promedio móvil de 3 períodos
-- TU TURNO: Promedio móvil de ventas mensuales




-- 3.3 Comparación con total general
-- TU TURNO: Cada venta vs total de ventas (porcentaje)




-- 3.4 Análisis por departamento con totales
-- TU TURNO: Salario de cada empleado vs total del departamento




-- 3.5 Contribución porcentual por categoría
-- TU TURNO: Porcentaje de ventas de cada producto vs su categoría




-- =====================================================
-- ⏭️ EJERCICIO 4: FUNCIONES DE ACCESO (10 min)
-- =====================================================

-- 4.1 Comparar con registro anterior
-- TU TURNO: Empleado actual vs anterior por salario




-- 4.2 Diferencia con el siguiente
-- TU TURNO: Precio producto actual vs siguiente producto en la categoría




-- 4.3 Primer y último valor por grupo
-- TU TURNO: Primer y último empleado contratado por departamento




-- 4.4 Análisis de tendencias de ventas
-- TU TURNO: Venta actual vs venta anterior del mismo producto




-- =====================================================
-- 🔥 EJERCICIO 5: COMBINANDO CTEs Y WINDOW FUNCTIONS (10 min)
-- =====================================================

-- 5.1 Top performers por departamento
WITH empleados_con_ventas AS (
    -- TU TURNO: CTE con empleados y sus ventas totales
    
), ranking_por_depto AS (
    -- TU TURNO: CTE con ranking por departamento
    
)
-- TU TURNO: Top 1 empleado por departamento




-- 5.2 Análisis de crecimiento mensual
WITH ventas_mensuales AS (
    -- TU TURNO: Ventas agregadas por mes
    
), ventas_con_crecimiento AS (
    -- TU TURNO: Añadir crecimiento mes anterior
    
)
-- TU TURNO: Meses con crecimiento > 10%




-- 5.3 Segmentación avanzada de clientes
WITH gastos_cliente AS (
    -- TU TURNO: Gasto total por cliente
    
), percentiles_gasto AS (
    -- TU TURNO: Añadir percentiles
    
)
-- TU TURNO: Clasificar clientes en segmentos (VIP, Medio, Básico)




-- =====================================================
-- 🎯 EVALUACIÓN HORA 6 (5 min)
-- =====================================================

-- E1. Dashboard ejecutivo: Para cada departamento mostrar:
--     - Nombre departamento, número empleados, masa salarial
--     - Ranking por masa salarial, porcentaje del total empresa
--     - Empleado mejor pagado del departamento
WITH dept_stats AS (
    -- TU SOLUCIÓN: CTE con estadísticas por departamento
    
), dept_ranking AS (
    -- TU SOLUCIÓN: CTE con ranking y porcentajes
    
), top_empleado AS (
    -- TU SOLUCIÓN: CTE con top empleado por departamento
    
)
-- TU SOLUCIÓN: Consulta final combinando todos los CTEs




-- E2. Análisis de productos estrella:
--     - Productos en el top 20% por ingresos de su categoría
--     - Con crecimiento positivo mes a mes
--     - Mostrar: producto, categoría, ingresos, ranking en categoría, crecimiento
-- TU SOLUCIÓN:




-- =====================================================
-- 💼 CASOS EMPRESARIALES EXPERTOS (5 min)
-- =====================================================

-- Caso 1: Detección de anomalías en ventas
-- Ventas que están 2 desviaciones estándar por encima/debajo del promedio
WITH stats_ventas AS (
    SELECT 
        AVG(total_calculado) as promedio,
        STDDEV(total_calculado) as desviacion
    FROM ventas
)
-- TU SOLUCIÓN: Detectar ventas anómalas




-- Caso 2: Análisis de retención de empleados
-- Empleados por años de antigüedad, con percentiles y comparación con promedio
-- TU SOLUCIÓN:




-- Caso 3: Análisis de cross-selling inteligente
-- Productos frecuentemente comprados juntos usando window functions
-- TU SOLUCIÓN:




-- =====================================================
-- 🧠 DESAFÍOS EXPERTOS FINALES (Opcional)
-- =====================================================

-- Desafío 1: CTE Recursivo - Jerarquía organizacional completa
WITH RECURSIVE jerarquia AS (
    -- Caso base: jefes sin superior
    SELECT id_empleado, nombre, apellido, id_jefe, 1 as nivel
    FROM empleados WHERE id_jefe IS NULL
    
    UNION ALL
    
    -- Caso recursivo: empleados con jefe
    SELECT e.id_empleado, e.nombre, e.apellido, e.id_jefe, j.nivel + 1
    FROM empleados e
    JOIN jerarquia j ON e.id_jefe = j.id_empleado
)
SELECT * FROM jerarquia ORDER BY nivel, nombre;

-- Desafío 2: Análisis de cohortes por fecha de registro
-- Agrupar clientes por mes de registro y analizar su comportamiento
-- TU SOLUCIÓN:




-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 6 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - CTEs simples y múltiples
-- - CTEs recursivos para jerarquías
-- - ROW_NUMBER, RANK, DENSE_RANK
-- - NTILE para percentiles
-- - Funciones de agregación con ventana
-- - LAG/LEAD para comparaciones temporales
-- - FIRST_VALUE/LAST_VALUE
-- - Combinación de CTEs con window functions
-- - Análisis de tendencias y anomalías
-- - Segmentación avanzada

-- 🚀 Próximo nivel: hora_07_dml
-- 💪 ¡Eres oficialmente un SQL Expert nivel 6!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████████████████] 100% experto

-- 🎯 HABILIDAD DESBLOQUEADA: Análisis de datos de nivel empresarial