-- =====================================================
-- 🚀 HORA 1: FUNDAMENTOS DE SQL (0 → Básico)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar SELECT básico y estructura SQL

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🎯 QUÉ ES SQL:
- Structured Query Language
- Lenguaje para comunicarse con bases de datos
- Estándar universal para gestionar datos

🏗️ ESTRUCTURA BÁSICA:
SELECT columnas
FROM tabla
WHERE condiciones
ORDER BY columnas;

📊 NUESTRA BASE DE DATOS:
- empleados: información personal y laboral
- departamentos: áreas de la empresa  
- productos: catálogo de productos
- clientes: información de clientes
- ventas: transacciones realizadas
- categorias: tipos de productos
*/

-- =====================================================
-- 🧪 EJERCICIO 1: PRIMEROS PASOS (10 min)
-- =====================================================

-- 1.1 Tu primera consulta SQL - ver todas las tablas
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- 1.2 Ver TODOS los empleados
-- TU TURNO: Escribe SELECT * FROM empleados;
SELECT * FROM empleados;



-- 1.3 Ver solo 5 empleados (usar LIMIT)
-- TU TURNO:
SELECT * FROM empleados LIMIT 5;



-- 1.4 Ver estructura de la tabla empleados
-- PISTA: \d empleados (en psql) o usar Adminer
-- TU TURNO:
\d empleados

-- =====================================================
-- 🎯 EJERCICIO 2: SELECT ESPECÍFICO (10 min)
-- =====================================================

-- 2.1 Solo nombres y apellidos de empleados
-- TU TURNO:
SELECT nombre, apellidos FROM empleados;



-- 2.2 Solo email y salario de empleados  
-- TU TURNO:
SELECT email, salario FROM empleados;



-- 2.3 Nombres completos concatenados
-- PISTA: nombre || ' ' || apellido AS nombre_completo
-- TU TURNO:
SELECT nombre ||' '|| apellido AS nombre_completo FROM empleados;



-- 2.4 Productos: nombre y precio
-- TU TURNO:
SELECT nombre_producto, precio FROM productos;


-- =====================================================
-- 🔍 EJERCICIO 3: WHERE BÁSICO (10 min)
-- =====================================================

-- 3.1 Empleados con salario mayor a 50000
-- TU TURNO:
SELECT * FROM empleados WHERE salario > 50000;



-- 3.2 Empleados del departamento 1 (Ventas)
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id = 1;



-- 3.3 Productos con precio menor a 100 euros
-- TU TURNO:
SELECT * FROM productos WHERE precio < 100;



-- 3.4 Clientes de Madrid
-- TU TURNO:
SELECT * FROM clientes WHERE ciudad = 'madrid';



-- =====================================================
-- 📊 EJERCICIO 4: ORDER BY (10 min)
-- =====================================================

-- 4.1 Empleados ordenados por salario (menor a mayor)
-- TU TURNO:
SELECT * FROM empleados ORDER BY salario;

-- 4.2 Empleados ordenados por salario (mayor a menor)
-- PISTA: usar DESC
-- TU TURNO:
SELECT * FROM empleados ORDER BY  salario DESC;



-- 4.3 Productos ordenados por nombre alfabéticamente
-- TU TURNO:
SELECT * FROM productos ORDER BY nombre_producto;


-- 4.4 Empleados ordenados por departamento, luego por salario
-- PISTA: ORDER BY campo1, campo2
-- TU TURNO:
SELECT * FROM empleados ORDER BY departamento_id, salario;



-- =====================================================
-- 💡 EJERCICIO 5: COMBINANDO TODO (5 min)
-- =====================================================

-- 5.1 Top 3 empleados mejor pagados
-- TU TURNO: usar WHERE, ORDER BY y LIMIT
SELECT * FROM empleados ORDER BY salario DESC LIMIT 3;
SELECT * FROM empleados WHERE salario > 0 ORDER BY salario DESC LIMIT 3;



-- 5.2 Productos baratos (< 50€) ordenados por precio
-- TU TURNO:
SELECT * FROM productos WHERE precio < 50  ORDER BY precio;



-- 5.3 Empleados de ventas ordenados por salario descendente
-- TU TURNO:
SELECT * FROM empleados WHERE departamento_id = 1 ORDER BY salario DESC;



-- =====================================================
-- 🎯 EVALUACIÓN HORA 1 (5 min)
-- =====================================================

-- E1. Muestra nombre, email y salario de empleados con salario > 40000, 
--     ordenados por salario descendente, solo los primeros 5
-- TU SOLUCIÓN:
SELECT nombre, email, salario FROM empleados WHERE salario > 40000 ORDER BY salario DESC LIMIT 5;



-- E2. Muestra nombre_producto y precio de productos con precio entre 100 y 500,
--     ordenados por precio ascendente
-- TU SOLUCIÓN:
SELECT nombre_producto, precio  FROM productos WHERE precio BETWEEN 100 AND 500 ORDER BY precio ASC;



-- E3. Muestra nombre completo y ciudad de clientes de Barcelona o Madrid
-- TU SOLUCIÓN:
SELECT nombre || ' ' || apellido AS nombre_completo, ciudad FROM clientes WHERE ciudad IN ('barcelona', 'madrid');



-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 1 COMPLETADA
-- =====================================================

-- ✅ Has aprendido:
-- - SELECT básico y específico
-- - WHERE para filtrar datos
-- - ORDER BY para ordenar resultados  
-- - LIMIT para limitar resultados
-- - Concatenación de strings
-- - Comparaciones básicas

-- 🚀 Próximo nivel: hora_02_filtros
-- 💪 ¡Eres oficialmente un SQL Warrior nivel 1!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████░░] 80% hacia básico