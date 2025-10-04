-- =====================================================
-- 🔍 HORA 2: FILTROS Y OPERADORES AVANZADOS (Básico → Intermedio)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar filtros complejos y operadores

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🎯 OPERADORES DE COMPARACIÓN:
=, !=, <>, <, >, <=, >=

🔍 OPERADORES ESPECIALES:
- BETWEEN: rango de valores
- IN: lista de valores específicos
- LIKE: patrones de texto
- IS NULL / IS NOT NULL: valores nulos
- AND, OR, NOT: lógica booleana

📝 PATRONES LIKE:
- %: cualquier cantidad de caracteres
- _: exactamente un carácter
Ejemplo: 'M%' = empieza por M
         '%ez' = termina en ez
         'M_r%' = M + cualquier char + r + cualquiera

🎨 PRECEDENCIA DE OPERADORES:
1. Paréntesis ()
2. NOT
3. AND  
4. OR
*/

-- =====================================================
-- 🎯 EJERCICIO 1: BETWEEN Y RANGOS (10 min)
-- =====================================================

-- 1.1 Empleados con salario entre 35000 y 50000
-- TU TURNO:
SELECT * FROM empleados WHERE salario BETWEEN 35000 AND 50000;



-- 1.2 Productos con precio entre 100 y 300 euros
-- TU TURNO:
SELECT * FROM productos WHERE precio BETWEEN 100 AND 300;



-- 1.3 Empleados contratados en 2021
-- PISTA: fecha_contratacion BETWEEN '2021-01-01' AND '2021-12-31'
-- TU TURNO:
SELECT * FROM empleados WHERE fecha_contratacion BETWEEN '2021-01-01' AND '2021-12-31';



-- 1.4 Ventas del segundo trimestre 2024 (abril-junio)
-- TU TURNO:
SELECT * FROM ventas WHERE fecha_venta BETWEEN '2024-04-01' AND '2024-06-30';



-- =====================================================
-- 📋 EJERCICIO 2: IN Y LISTAS (10 min)
-- =====================================================

-- 2.1 Empleados de los departamentos 1, 3 y 5
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id IN (1,3,5);




-- 2.2 Productos de las categorías 'Electrónicos' y 'Deportes'
-- PISTA: Necesitarás JOIN o usar IDs directamente
-- TU TURNO:
SELECT p.* FROM productos p 
JOIN categorias c ON p.id_categoria = c.id_categoria 
WHERE c.nombre_categoria IN ('Electrónicos', 'Deportes y Fitness');



-- 2.3 Clientes de Madrid, Barcelona o Valencia
-- TU TURNO:
SELECT * FROM clientes WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia');



-- 2.4 Empleados con salarios específicos: 35000, 42000, 55000
-- TU TURNO:
SELECT * FROM empleados WHERE salario IN (35000, 42000, 55000);



-- =====================================================
-- 🔤 EJERCICIO 3: LIKE Y PATRONES (10 min)
-- =====================================================

-- 3.1 Empleados cuyo nombre empiece por 'C'
-- TU TURNO:
SELECT * FROM empleados WHERE nombre LIKE 'C%';



-- 3.2 Empleados cuyo apellido termine en 'ez'
-- TU TURNO:
SELECT * FROM empleados WHERE apellido LIKE '%ez';



-- 3.3 Productos que contengan la palabra 'Nike'
-- TU TURNO:
SELECT * FROM productos WHERE nombre_producto LIKE '%Nike%';



-- 3.4 Emails que terminen en '@empresa.com'
-- TU TURNO:
SELECT * FROM clientes WHERE email LIKE '%@empresa.com';



-- 3.5 Empleados con nombre de exactamente 4 letras
-- PISTA: usar _ (guión bajo)
-- TU TURNO:
SELECT * FROM empleados WHERE nombre LIKE '____';



-- =====================================================
-- ❓ EJERCICIO 4: NULL Y VALORES AUSENTES (10 min)
-- =====================================================

-- 4.1 Empleados sin jefe asignado
-- TU TURNO:
SELECT * FROM empleados WHERE id_jefe IS NULL;



-- 4.2 Empleados QUE SÍ tienen jefe
-- TU TURNO:
SELECT * FROM empleados WHERE id_jefe IS NOT NULL;



-- 4.3 Productos sin descripción
-- TU TURNO:
SELECT * FROM productos WHERE descripcion IS NULL;



-- 4.4 Clientes con teléfono registrado
-- TU TURNO:
SELECT * FROM clientes WHERE telefono IS NOT NULL;



-- =====================================================
-- 🧠 EJERCICIO 5: LÓGICA BOOLEANA (10 min)
-- =====================================================

-- 5.1 Empleados de Ventas O con salario > 50000
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id = 1 OR  salario > 50000;



-- 5.2 Empleados de Desarrollo Y con salario > 50000
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id = 2 AND salario > 50000;



-- 5.3 Productos caros (>500€) de categoría Electrónicos
-- TU TURNO:
SELECT * FROM productos WHERE precio>500 AND id_categoria = 1;



-- 5.4 Empleados NO del departamento 1 NI del 2
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id NOT IN (1,2);



-- 5.5 Clientes de Madrid con teléfono O clientes de Barcelona
-- TU TURNO:
SELECT * FROM clientes WHERE (ciudad = 'Madrid' AND telefono IS NOT NULL) OR ciudad = 'Barcelona';



-- =====================================================
-- 🔥 EJERCICIO 6: FILTROS COMPLEJOS (5 min)
-- =====================================================

-- 6.1 Empleados contratados en 2021 O 2022, con salario > 40000
-- TU TURNO:
SELECT * FROM empleados WHERE (fecha_contratacion BETWEEN '2021-01-01' AND '2022-12-31') AND salario > 40000;



-- 6.2 Productos entre 50-200€ que NO sean de Ropa ni Libros
-- TU TURNO:
SELECT * FROM productos WHERE precio BETWEEN 50 AND 200 AND id_categoria NOT IN (3,4); 



-- 6.3 Empleados cuyo nombre empiece por 'M' o 'C' del depto Ventas
-- TU TURNO:
SELECT * FROM empleados WHERE (nombre LIKE 'M%' OR nombre LIKE 'C%') AND departamento_id = 1;



-- =====================================================
-- 🎯 EVALUACIÓN HORA 2 (5 min)
-- =====================================================

-- E1. Empleados contratados entre 2020-2022, con salario 30000-60000,
--     del departamento Ventas O Marketing
-- TU SOLUCIÓN:
SELECT *FROM empleados WHERE (fecha_contratacion BETWEEN '2020-01-01' AND '2022-12-31') AND (salario BETWEEN 30000 AND 60000) AND (departamento_id IN (1,4));



-- E2. Productos cuyo nombre contenga 'a' Y precio > 100,
--     que NO sean de categoría Libros
-- TU SOLUCIÓN:
SELECT * FROM productos WHERE nombre_producto LIKE '%a%' AND precio > 100 AND id_categoria != 4;



-- E3. Clientes de Madrid cuyo email termine en 'gmail.com' 
--     O clientes de Barcelona con teléfono
-- TU SOLUCIÓN:
SELECT * FROM clientes WHERE (ciudad = 'Madrid' AND email LIKE '%gmail.com') OR (ciudad = 'Barcelona' AND telefono IS NOT NULL);



-- =====================================================
-- 💡 CASOS PRÁCTICOS EMPRESARIALES
-- =====================================================

-- Caso 1: Análisis de nómina
-- Empleados con salario fuera del rango normal (< 30000 o > 60000)
SELECT * FROM empleados WHERE salario < 30000 OR salario > 60000;



-- Caso 2: Segmentación de productos
-- Productos premium (>500€) y económicos (<50€)
SELECT * FROM productos WHERE precio > 500 OR precio < 50;



-- Caso 3: Clientes target marketing
-- Clientes de grandes ciudades sin compras recientes
SELECT * FROM clientes WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia') AND id_cliente NOT IN (SELECT DISTINCT id_cliente FROM ventas WHERE fecha_venta >= '2024-01-01');

-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 2 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - BETWEEN para rangos
-- - IN para listas de valores
-- - LIKE para patrones de texto
-- - NULL handling
-- - Operadores lógicos AND, OR, NOT
-- - Combinaciones complejas de filtros
-- - Precedencia de operadores

-- 🚀 Próximo nivel: hora_03_agregaciones
-- 💪 ¡Eres oficialmente un SQL Warrior nivel 2!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████████░░] 85% hacia intermedio