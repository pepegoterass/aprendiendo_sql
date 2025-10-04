-- =====================================================
-- 🎯 HORA 5: SUBCONSULTAS Y CONSULTAS COMPLEJAS (Avanzado)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar consultas anidadas y lógica compleja

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🎯 TIPOS DE SUBCONSULTAS:

1. SUBCONSULTA ESCALAR: Devuelve un valor único
   SELECT * FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados)

2. SUBCONSULTA DE LISTA: Devuelve múltiples valores
   SELECT * FROM empleados WHERE id_departamento IN (SELECT id FROM departamentos WHERE ubicacion = 'Madrid')

3. SUBCONSULTA CORRELACIONADA: Usa valores de la consulta externa
   SELECT * FROM empleados e WHERE salario > (SELECT AVG(salario) FROM empleados WHERE id_departamento = e.id_departamento)

4. SUBCONSULTA EN FROM: La subconsulta actúa como una tabla temporal
   SELECT * FROM (SELECT nombre, salario FROM empleados) AS temp

📍 OPERADORES PARA SUBCONSULTAS:
- IN / NOT IN: Está/no está en la lista
- EXISTS / NOT EXISTS: Existe/no existe al menos un registro
- ANY / SOME: Alguno de los valores
- ALL: Todos los valores

🔄 SUBCONSULTAS vs JOINs:
- Subconsultas: Más legibles, menos eficientes para grandes volúmenes
- JOINs: Más eficientes, menos legibles para lógica compleja
*/

-- =====================================================
-- 📊 EJERCICIO 1: SUBCONSULTAS ESCALARES (10 min)
-- =====================================================

-- 1.1 Empleados que ganan más que el promedio
-- TU TURNO:




-- 1.2 Productos más caros que el precio promedio
-- TU TURNO:




-- 1.3 Empleados del departamento con mayor presupuesto
-- TU TURNO:




-- 1.4 Clientes que han gastado más que el gasto promedio
-- TU TURNO:




-- 1.5 Ventas por encima del ticket promedio
-- TU TURNO:




-- =====================================================
-- 📋 EJERCICIO 2: SUBCONSULTAS CON IN/NOT IN (10 min)
-- =====================================================

-- 2.1 Empleados de departamentos ubicados en Madrid
-- TU TURNO:




-- 2.2 Productos de categorías con más de 3 productos
-- TU TURNO:




-- 2.3 Clientes que han comprado productos de la categoría Electrónicos
-- TU TURNO:




-- 2.4 Empleados que NO han realizado ninguna venta
-- TU TURNO:




-- 2.5 Productos que nunca se han vendido
-- TU TURNO:




-- =====================================================
-- 🔄 EJERCICIO 3: SUBCONSULTAS CORRELACIONADAS (15 min)
-- =====================================================

-- 3.1 Empleados que ganan más que el promedio de su departamento
-- TU TURNO:




-- 3.2 Productos más caros que el promedio de su categoría
-- TU TURNO:




-- 3.3 Clientes con compras superiores a su promedio personal
-- TU TURNO:




-- 3.4 Empleados con más ventas que el promedio de su departamento
-- TU TURNO:




-- 3.5 Departamentos con salario promedio superior al promedio general
-- TU TURNO:




-- =====================================================
-- ✅ EJERCICIO 4: EXISTS / NOT EXISTS (10 min)
-- =====================================================

-- 4.1 Empleados que han realizado al menos una venta
-- TU TURNO:




-- 4.2 Clientes que nunca han comprado
-- TU TURNO:




-- 4.3 Categorías que tienen productos en stock
-- TU TURNO:




-- 4.4 Departamentos que tienen empleados contratados en 2021
-- TU TURNO:




-- 4.5 Productos que han sido vendidos a clientes de Madrid
-- TU TURNO:




-- =====================================================
-- 🚀 EJERCICIO 5: SUBCONSULTAS EN FROM (10 min)
-- =====================================================

-- 5.1 Top 3 departamentos por masa salarial promedio por empleado
-- TU TURNO: Crear subconsulta que calcule stats por departamento, luego ordenar
-- TU TURNO:




-- 5.2 Ranking de productos por ingresos generados
-- TU TURNO: Subconsulta que calcule ingresos por producto, luego ranking
-- TU TURNO:




-- 5.3 Empleados con rendimiento superior (más ventas que el promedio)
-- TU TURNO: Subconsulta para calcular promedio, luego filtrar
-- TU TURNO:




-- 5.4 Análisis de clientes por segmento de gasto
-- TU TURNO: Crear segmentos (Bajo <500, Medio 500-1500, Alto >1500)
-- TU TURNO:




-- =====================================================
-- 🎯 EVALUACIÓN HORA 5 (5 min)
-- =====================================================

-- E1. Empleados "estrella": ganan más que el promedio de su departamento
--     Y han vendido más que el promedio general de ventas
--     Mostrar: nombre, salario, departamento, total_vendido
-- TU SOLUCIÓN:




-- E2. Productos "problemáticos": precio mayor que el promedio de su categoría
--     PERO nunca se han vendido
--     Mostrar: nombre_producto, categoria, precio, precio_promedio_categoria
-- TU SOLUCIÓN:




-- E3. Análisis de clientes VIP: han comprado productos de al menos 3 categorías diferentes
--     Y su gasto total está en el top 20% de clientes
--     Mostrar: nombre_cliente, num_categorias_compradas, gasto_total
-- TU SOLUCIÓN:




-- =====================================================
-- 💼 CASOS EMPRESARIALES COMPLEJOS (5 min)
-- =====================================================

-- Caso 1: Detección de empleados subutilizados
-- Empleados con salario alto pero ventas bajas comparado con sus pares
-- TU SOLUCIÓN:




-- Caso 2: Análisis de productos competitivos
-- Productos que compiten en precio pero uno se vende más que otros
-- TU SOLUCIÓN:




-- Caso 3: Segmentación avanzada de clientes
-- Clasificar clientes por frecuencia Y valor de compra
-- TU SOLUCIÓN:




-- =====================================================
-- 🧠 DESAFÍOS MENTALES AVANZADOS (Opcional)
-- =====================================================

-- Desafío 1: Empleados que han vendido a más clientes diferentes
-- que cualquier otro empleado de su departamento
-- TU SOLUCIÓN:




-- Desafío 2: Productos con crecimiento en ventas mes a mes
-- TU SOLUCIÓN:




-- Desafío 3: Análisis de cross-selling avanzado
-- Clientes que compran productos complementarios (diferentes categorías en la misma fecha)
-- TU SOLUCIÓN:




-- =====================================================
-- 🔄 REESCRIBIR SUBCONSULTAS COMO JOINS (Ejercicio bonus)
-- =====================================================

-- Convierte estas subconsultas en JOINs (mejor performance):

-- Original: Empleados de departamentos en Madrid
SELECT * FROM empleados 
WHERE id_departamento IN (SELECT id_departamento FROM departamentos WHERE ubicacion = 'Madrid');

-- Con JOIN:
-- TU TURNO:




-- Original: Clientes que han comprado
SELECT * FROM clientes 
WHERE EXISTS (SELECT 1 FROM ventas WHERE ventas.id_cliente = clientes.id_cliente);

-- Con JOIN:
-- TU TURNO:




-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 5 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - Subconsultas escalares para comparaciones
-- - Subconsultas con IN/NOT IN para listas
-- - Subconsultas correlacionadas para comparaciones contextuales
-- - EXISTS/NOT EXISTS para verificar existencia
-- - Subconsultas en FROM para consultas complejas
-- - ANY/ALL para comparaciones múltiples
-- - Conversión entre subconsultas y JOINs
-- - Análisis de rendimiento y detección de patrones

-- 🚀 Próximo nivel: hora_06_avanzado
-- 💪 ¡Eres oficialmente un SQL Architect nivel 5!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████████████████] 100% avanzado

-- 🎯 HABILIDAD DESBLOQUEADA: Consultas complejas multi-nivel