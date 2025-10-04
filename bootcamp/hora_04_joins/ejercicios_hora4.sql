-- =====================================================
-- 🔗 HORA 4: JOINS - UNIENDO TABLAS (Intermedio → Avanzado)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar relaciones entre tablas

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🔗 TIPOS DE JOINS:

1. INNER JOIN: Solo registros que coinciden en ambas tablas
   A ∩ B (intersección)

2. LEFT JOIN: Todos de la izquierda + coincidencias de la derecha
   A + (A ∩ B)

3. RIGHT JOIN: Todos de la derecha + coincidencias de la izquierda
   B + (A ∩ B)

4. FULL OUTER JOIN: Todos los registros de ambas tablas
   A ∪ B (unión)

5. CROSS JOIN: Producto cartesiano (cada registro de A con cada de B)

📐 SINTAXIS:
SELECT columnas
FROM tabla1 t1
[INNER|LEFT|RIGHT|FULL] JOIN tabla2 t2 
    ON t1.campo = t2.campo

🎯 CLAVES FORÁNEAS EN NUESTRA BD:
- empleados.id_departamento → departamentos.id_departamento
- empleados.id_jefe → empleados.id_empleado  
- productos.id_categoria → categorias.id_categoria
- ventas.id_cliente → clientes.id_cliente
- ventas.id_producto → productos.id_producto
- ventas.id_empleado → empleados.id_empleado
*/

-- =====================================================
-- 🎯 EJERCICIO 1: INNER JOIN BÁSICO (10 min)
-- =====================================================

-- 1.1 Empleados con nombre de su departamento
-- TU TURNO:




-- 1.2 Productos con nombre de su categoría
-- TU TURNO:




-- 1.3 Ventas con nombre del cliente y producto
-- TU TURNO:




-- 1.4 Empleados con nombre de su jefe
-- PISTA: Self join - empleados e JOIN empleados j ON e.id_jefe = j.id_empleado
-- TU TURNO:




-- 1.5 Productos vendidos con su categoría (solo los que se han vendido)
-- TU TURNO:




-- =====================================================
-- ⬅️ EJERCICIO 2: LEFT JOIN (10 min)
-- =====================================================

-- 2.1 TODOS los empleados con su departamento (incluso sin departamento)
-- TU TURNO:




-- 2.2 TODOS los productos con su categoría (incluso sin categoría)
-- TU TURNO:




-- 2.3 TODOS los empleados con nombre de su jefe (incluso sin jefe)
-- TU TURNO:




-- 2.4 TODOS los clientes con sus compras (incluso los que no han comprado)
-- TU TURNO:




-- 2.5 Empleados SIN ventas asignadas
-- PISTA: LEFT JOIN ventas y WHERE ventas.id_empleado IS NULL
-- TU TURNO:




-- =====================================================
-- 🔗 EJERCICIO 3: MÚLTIPLES JOINS (15 min)
-- =====================================================

-- 3.1 Información completa de ventas:
-- cliente, producto, categoría, empleado vendedor, departamento
-- TU TURNO:




-- 3.2 Empleados con departamento, ubicación y nombre del jefe
-- TU TURNO:




-- 3.3 Productos con categoría y total vendido de cada uno
-- TU TURNO:




-- 3.4 Ventas con toda la información: cliente (nombre, ciudad),
-- producto (nombre, categoría), empleado vendedor (nombre, departamento)
-- TU TURNO:




-- =====================================================
-- 📊 EJERCICIO 4: JOINS CON AGREGACIONES (10 min)
-- =====================================================

-- 4.1 Número de empleados por departamento (incluyendo departamentos sin empleados)
-- TU TURNO:




-- 4.2 Total de ventas por categoría de producto
-- TU TURNO:




-- 4.3 Ingresos generados por cada empleado vendedor
-- TU TURNO:




-- 4.4 Número de productos por categoría y total del stock
-- TU TURNO:




-- 4.5 Ventas por ciudad de cliente
-- TU TURNO:




-- =====================================================
-- 🔥 EJERCICIO 5: JOINS AVANZADOS (10 min)
-- =====================================================

-- 5.1 Empleados que ganan más que su jefe
-- TU TURNO:




-- 5.2 Productos que nunca se han vendido
-- TU TURNO:




-- 5.3 Departamentos sin empleados asignados
-- TU TURNO:




-- 5.4 Clientes que han comprado productos de todas las categorías
-- PISTA: Esto es complejo, usa COUNT(DISTINCT id_categoria)
-- TU TURNO:




-- 5.5 Empleados que han vendido más que el promedio de su departamento
-- TU TURNO:




-- =====================================================
-- 🎯 EVALUACIÓN HORA 4 (5 min)
-- =====================================================

-- E1. Crear un reporte completo de empleados mostrando:
--     nombre_completo, email, salario, nombre_departamento, 
--     ubicacion_departamento, nombre_jefe, total_vendido
--     Ordenado por total_vendido DESC
-- TU SOLUCIÓN:




-- E2. Top 5 productos más rentables mostrando:
--     nombre_producto, categoria, precio_unitario, 
--     cantidad_total_vendida, ingresos_totales, margen_bruto
--     (asume que el margen es 40% del precio)
-- TU SOLUCIÓN:




-- E3. Análisis de performance por departamento:
--     nombre_departamento, num_empleados, salario_promedio,
--     total_ventas_departamento, ventas_promedio_por_empleado
--     Solo departamentos que han realizado ventas
-- TU SOLUCIÓN:




-- =====================================================
-- 💼 CASOS EMPRESARIALES AVANZADOS (5 min)
-- =====================================================

-- Caso 1: Reporte ejecutivo mensual
-- Ventas por mes, empleado vendedor, departamento, y categoría de producto
-- TU SOLUCIÓN:




-- Caso 2: Análisis de jerarquía organizacional
-- Mostrar cada empleado con su jefe y el jefe de su jefe
-- TU SOLUCIÓN:




-- Caso 3: Análisis de cross-selling
-- ¿Qué clientes han comprado productos de múltiples categorías?
-- TU SOLUCIÓN:




-- =====================================================
-- 🧠 DESAFÍOS EXPERTOS (Opcional)
-- =====================================================

-- Desafío 1: Empleados que han vendido a clientes de su misma ciudad
-- (necesitas asumir que empleados tienen ciudad basada en su departamento)
-- TU SOLUCIÓN:




-- Desafío 2: Productos complementarios
-- ¿Qué productos se han vendido juntos al mismo cliente?
-- TU SOLUCIÓN:




-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 4 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - INNER JOIN para coincidencias exactas
-- - LEFT JOIN para incluir todos los registros de la izquierda
-- - RIGHT JOIN para incluir todos los registros de la derecha
-- - FULL OUTER JOIN para incluir todos los registros
-- - Self JOINs para relaciones jerárquicas
-- - Múltiples JOINs en una consulta
-- - JOINs con agregaciones
-- - Identificar registros huérfanos
-- - Análisis de relaciones complejas

-- 🚀 Próximo nivel: hora_05_subconsultas
-- 💪 ¡Eres oficialmente un SQL Engineer nivel 4!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [██████████████████░░] 95% hacia avanzado

-- 🎯 HABILIDAD DESBLOQUEADA: Arquitecto de consultas relacionales

-- 💡 PAUSA RECOMENDADA: Has llegado a la mitad del bootcamp
--     Tómate 30 minutos de descanso para asimilar todo lo aprendido