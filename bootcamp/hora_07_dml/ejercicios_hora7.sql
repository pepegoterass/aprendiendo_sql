-- =====================================================
-- 🛠️ HORA 7: MANIPULACIÓN DE DATOS (DML) - CRUD COMPLETO
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar INSERT, UPDATE, DELETE y transacciones

-- =====================================================
-- 📚 TEORÍA RÁPIDA (15 minutos)
-- =====================================================

/*
🔧 OPERACIONES DML (Data Manipulation Language):

1. INSERT: Agregar nuevos registros
   - INSERT INTO tabla (campos) VALUES (valores)
   - INSERT INTO tabla SELECT ... FROM otra_tabla

2. UPDATE: Modificar registros existentes
   - UPDATE tabla SET campo = valor WHERE condicion
   - UPDATE con JOINs para datos complejos

3. DELETE: Eliminar registros
   - DELETE FROM tabla WHERE condicion
   - ¡SIEMPRE usa WHERE! Sin WHERE elimina TODA la tabla

4. UPSERT: INSERT + UPDATE (PostgreSQL: ON CONFLICT)
   - INSERT ... ON CONFLICT DO UPDATE
   - Útil para sincronización de datos

🔒 TRANSACCIONES:
- BEGIN: Iniciar transacción
- COMMIT: Confirmar cambios
- ROLLBACK: Deshacer cambios
- ACID: Atomicidad, Consistencia, Aislamiento, Durabilidad

⚠️ PRECAUCIONES:
- SIEMPRE hacer backup antes de cambios masivos
- Usar transacciones para operaciones críticas
- Testear en datos de prueba primero
- WHERE es tu mejor amigo en UPDATE/DELETE
*/

-- =====================================================
-- ➕ EJERCICIO 1: INSERT - AGREGAR DATOS (10 min)
-- =====================================================

-- 1.1 Insertar un nuevo departamento
-- TU TURNO:
INSERT INTO departamentos (nombre_departamento, ubicacion, presupuesto) 
VALUES ('Innovación', 'Barcelona', 180000.00);

-- 1.2 Insertar múltiples empleados de una vez
-- TU TURNO:




-- 1.3 Insertar un producto con todos los campos
-- TU TURNO:




-- 1.4 Insertar cliente con valores mínimos requeridos
-- TU TURNO:




-- 1.5 INSERT con subconsulta - empleados de departamentos ricos
-- TU TURNO: Crear tabla temporal con empleados de deptos con presupuesto > 150000
-- CREATE TEMP TABLE empleados_departamentos_ricos AS
-- SELECT ... WHERE ...




-- =====================================================
-- 🔄 EJERCICIO 2: UPDATE - MODIFICAR DATOS (15 min)
-- =====================================================

-- ⚠️ IMPORTANTE: Antes de cualquier UPDATE, hacer SELECT para verificar

-- 2.1 Actualizar salario de un empleado específico
-- TU TURNO: Aumentar 5000 al salario de Carlos García
-- Primero SELECT:
SELECT * FROM empleados WHERE nombre = 'Carlos' AND apellido = 'García';

-- Luego UPDATE:




-- 2.2 Aumentar 10% el salario de empleados de Ventas
-- TU TURNO: Primero SELECT para verificar cuántos se afectarán




-- 2.3 Actualizar precios con descuento por categoría
-- TU TURNO: 15% descuento en productos de Ropa y Moda




-- 2.4 UPDATE con JOIN - actualizar stock basado en ventas
-- TU TURNO: Reducir stock de productos vendidos en las últimas ventas




-- 2.5 Actualizar datos de empleados usando CASE
-- TU TURNO: Bonus del 5% para salarios > 50000, 10% para <= 50000




-- =====================================================
-- 🗑️ EJERCICIO 3: DELETE - ELIMINAR DATOS (10 min)
-- =====================================================

-- ⚠️ CRÍTICO: SIEMPRE verificar con SELECT antes de DELETE

-- 3.1 Eliminar un producto específico (que no se haya vendido)
-- TU TURNO: Primero verificar que no tenga ventas
SELECT * FROM productos p 
LEFT JOIN ventas v ON p.id_producto = v.id_producto 
WHERE v.id_producto IS NULL AND p.nombre_producto = 'Producto a eliminar';

-- Si es seguro, entonces DELETE:




-- 3.2 Eliminar ventas anteriores a cierta fecha
-- TU TURNO: Eliminar ventas de prueba (si las hay) anteriores a 2024




-- 3.3 Eliminar empleados inactivos sin ventas asignadas
-- TU TURNO: Primero identificar empleados inactivos sin ventas




-- 3.4 Cleanup de datos - eliminar registros huérfanos
-- TU TURNO: Productos sin categoría (si los hay)




-- =====================================================
-- 🔄 EJERCICIO 4: UPSERT - INSERT O UPDATE (10 min)
-- =====================================================

-- 4.1 UPSERT de cliente - insertar o actualizar si existe
-- TU TURNO: Si el email existe, actualizar datos; si no, insertar
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad, pais)
VALUES ('Test', 'Usuario', 'test@email.com', '999999999', 'Madrid', 'España')
ON CONFLICT (email) 
DO UPDATE SET 
    telefono = EXCLUDED.telefono,
    ciudad = EXCLUDED.ciudad;

-- 4.2 UPSERT de producto con gestión de stock
-- TU TURNO: Si producto existe, sumar al stock; si no, crear nuevo




-- 4.3 UPSERT masivo desde datos temporales
-- TU TURNO: Crear tabla temporal con nuevos empleados y hacer UPSERT




-- =====================================================
-- 🔒 EJERCICIO 5: TRANSACCIONES (10 min)
-- =====================================================

-- 5.1 Transacción simple - transferir empleado de departamento
BEGIN;

-- Verificar estado actual
SELECT nombre, apellido, id_departamento FROM empleados WHERE id_empleado = 1;

-- Actualizar departamento
UPDATE empleados SET id_departamento = 3 WHERE id_empleado = 1;

-- Verificar cambio
SELECT nombre, apellido, id_departamento FROM empleados WHERE id_empleado = 1;

-- Decidir: COMMIT para confirmar o ROLLBACK para deshacer
-- COMMIT;
ROLLBACK; -- Para este ejercicio, deshacemos

-- 5.2 Transacción compleja - procesar venta completa
-- TU TURNO: 
-- 1. Insertar venta
-- 2. Actualizar stock del producto
-- 3. Si algo falla, hacer rollback




-- 5.3 Transacción con savepoints
-- TU TURNO: Usar SAVEPOINT para rollbacks parciales




-- =====================================================
-- 🎯 EVALUACIÓN HORA 7 (5 min)
-- =====================================================

-- E1. Migración de datos: Crear nueva tabla "empleados_historico"
--     y mover empleados inactivos (si los hay)
-- TU SOLUCIÓN:
-- 1. CREATE TABLE empleados_historico (misma estructura que empleados)
-- 2. INSERT INTO empleados_historico SELECT * FROM empleados WHERE activo = FALSE
-- 3. DELETE FROM empleados WHERE activo = FALSE




-- E2. Actualización masiva con lógica de negocio:
--     - Empleados con más de 2 años: aumentar salario 8%
--     - Empleados con 1-2 años: aumentar salario 5%
--     - Empleados con menos de 1 año: aumentar salario 3%
-- TU SOLUCIÓN:




-- E3. Limpieza de datos y normalización:
--     - Estandarizar emails a minúsculas
--     - Formatear teléfonos al formato español (+34)
--     - Actualizar ciudades para capitalizar primera letra
-- TU SOLUCIÓN:




-- =====================================================
-- 💼 CASOS EMPRESARIALES DML (5 min)
-- =====================================================

-- Caso 1: Proceso de cierre mensual
-- Crear tabla de resumen mensual y poblarla con datos del mes actual
CREATE TABLE IF NOT EXISTS resumen_ventas_mensual (
    mes DATE,
    total_ventas DECIMAL(12,2),
    num_transacciones INTEGER,
    producto_mas_vendido VARCHAR(100),
    cliente_top VARCHAR(100),
    empleado_mes VARCHAR(100)
);

-- TU SOLUCIÓN: INSERT con datos agregados del mes actual




-- Caso 2: Actualización de precios por inflación
-- Aumentar todos los precios 3% excepto productos de primera necesidad
-- TU SOLUCIÓN:




-- Caso 3: Reactivación de clientes inactivos
-- Marcar clientes sin compras en 6+ meses para campaña de marketing
-- TU SOLUCIÓN: 
-- 1. Agregar campo "estado_marketing" a clientes
-- 2. Actualizarlo basado en última compra




-- =====================================================
-- ⚡ EJERCICIOS DE PERFORMANCE (5 min)
-- =====================================================

-- Performance 1: UPDATE masivo eficiente
-- En lugar de actualizar fila por fila, usar una sola consulta
-- TU TURNO: Actualizar salarios basado en performance (tabla ventas)




-- Performance 2: DELETE con EXISTS vs IN
-- Comparar performance de diferentes enfoques
-- TU TURNO: Eliminar productos no vendidos (método más eficiente)




-- Performance 3: BATCH processing
-- Procesar datos en lotes para evitar bloqueos largos
-- TU TURNO: Actualizar 1000 registros por lote




-- =====================================================
-- 🧪 LABORATORIO DE PRUEBAS (Opcional)
-- =====================================================

-- Crear datos de prueba para experimentar
CREATE TEMP TABLE test_empleados AS 
SELECT * FROM empleados LIMIT 0; -- Solo estructura

-- Insertar datos de prueba
INSERT INTO test_empleados SELECT * FROM empleados LIMIT 5;

-- Experimentar con UPDATEs seguros
UPDATE test_empleados SET salario = salario * 1.1 WHERE id_empleado IN (1,2);

-- Ver resultados
SELECT * FROM test_empleados;

-- La tabla temporal se elimina automáticamente al cerrar sesión

-- =====================================================
-- 🏆 ¡FELICIDADES! HORA 7 COMPLETADA
-- =====================================================

-- ✅ Has dominado:
-- - INSERT simple y múltiple
-- - INSERT con subconsultas
-- - UPDATE con condiciones simples y complejas
-- - UPDATE con JOINs
-- - DELETE seguro con verificaciones
-- - UPSERT con ON CONFLICT
-- - Transacciones con BEGIN/COMMIT/ROLLBACK
-- - Savepoints para control granular
-- - Mejores prácticas de seguridad
-- - Operaciones en lotes para performance
-- - Casos de uso empresariales reales

-- 🚀 Próximo nivel: hora_08_experto
-- 💪 ¡Eres oficialmente un SQL Master nivel 7!

-- ⏰ TIEMPO OBJETIVO: 60 minutos
-- 📊 PROGRESO: [████████████████████] 100% hacia experto

-- 🎯 HABILIDAD DESBLOQUEADA: Manipulación segura y eficiente de datos

-- ⚠️ RECORDATORIO FINAL: En producción, SIEMPRE:
-- 1. Hacer backup antes de cambios masivos
-- 2. Probar en entorno de desarrollo primero
-- 3. Usar transacciones para operaciones críticas
-- 4. Verificar con SELECT antes de UPDATE/DELETE