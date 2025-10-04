-- =====================================================
-- 🏆 HORA 8: OPTIMIZACIÓN Y CASOS EXPERTOS (Master Level)
-- =====================================================
-- Tiempo: 60 minutos | Teoría: 15 min | Práctica: 45 min
-- Objetivo: Dominar optimización, índices, y casos reales complejos

-- =====================================================
-- 📚 TEORÍA FINAL - NIVEL EXPERTO (15 minutos)
-- =====================================================

/*
🚀 OPTIMIZACIÓN DE CONSULTAS:

1. ÍNDICES:
   - Primary Key: Automático, único, no nulo
   - Index: Acelera búsquedas (WHERE, JOIN, ORDER BY)
   - Composite Index: Múltiples columnas
   - Partial Index: Con condiciones WHERE

2. EXPLAIN PLAN:
   - EXPLAIN: Muestra plan de ejecución
   - EXPLAIN ANALYZE: Ejecuta y muestra tiempos reales
   - Seq Scan vs Index Scan vs Bitmap Scan

3. PERFORMANCE TIPS:
   - WHERE antes que JOIN cuando sea posible
   - LIMIT para pruebas en tablas grandes
   - EXISTS vs IN para subconsultas
   - Evitar SELECT * en producción
   - Usar UNION ALL en lugar de UNION cuando sea posible

4. TÉCNICAS AVANZADAS:
   - Partitioning: Dividir tablas grandes
   - Materialized Views: Vistas precalculadas
   - Query Hints: Forzar estrategias específicas
   - Bulk Operations: Para grandes volúmenes

🎯 CASOS EMPRESARIALES TÍPICOS:
- Reportes ejecutivos
- ETL (Extract, Transform, Load)
- Data Warehousing
- Business Intelligence
- Análisis de KPIs
- Detección de fraudes
- Segmentación de clientes
*/

-- =====================================================
-- 📊 EJERCICIO 1: ANÁLISIS DE PERFORMANCE (10 min)
-- =====================================================

-- 1.1 Analizar plan de ejecución de consulta lenta
EXPLAIN ANALYZE
SELECT e.nombre, e.apellido, d.nombre_departamento, COUNT(v.id_venta) as num_ventas
FROM empleados e
LEFT JOIN departamentos d ON e.id_departamento = d.id_departamento
LEFT JOIN ventas v ON e.id_empleado = v.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido, d.nombre_departamento
ORDER BY num_ventas DESC;

-- 1.2 Crear índices para optimizar consultas frecuentes
-- TU TURNO: Crear índices útiles
CREATE INDEX IF NOT EXISTS idx_ventas_empleado_fecha ON ventas(id_empleado, fecha_venta);
CREATE INDEX IF NOT EXISTS idx_empleados_departamento_activo ON empleados(id_departamento, activo);
CREATE INDEX IF NOT EXISTS idx_productos_categoria_precio ON productos(id_categoria, precio);

-- 1.3 Comparar performance antes y después de índices
-- TU TURNO: Ejecutar la misma consulta y comparar tiempos




-- 1.4 Identificar consultas que necesitan optimización
-- TU TURNO: Consulta compleja sin optimizar
SELECT * FROM clientes c
WHERE EXISTS (
    SELECT 1 FROM ventas v 
    JOIN productos p ON v.id_producto = p.id_producto
    JOIN categorias cat ON p.id_categoria = cat.id_categoria
    WHERE v.id_cliente = c.id_cliente AND cat.nombre_categoria = 'Electrónicos'
);

-- Versión optimizada:
-- TU TURNO: Reescribir con JOINs y mejorar performance




-- =====================================================
-- 📈 EJERCICIO 2: REPORTES EJECUTIVOS (15 min)
-- =====================================================

-- 2.1 Dashboard de KPIs empresariales
WITH kpis_base AS (
    SELECT 
        COUNT(DISTINCT e.id_empleado) as total_empleados,
        COUNT(DISTINCT c.id_cliente) as total_clientes,
        COUNT(DISTINCT p.id_producto) as total_productos,
        COUNT(v.id_venta) as total_ventas,
        SUM(v.total_calculado) as ingresos_totales,
        AVG(v.total_calculado) as ticket_promedio
    FROM empleados e
    CROSS JOIN clientes c
    CROSS JOIN productos p
    CROSS JOIN ventas v
),
tendencia_mensual AS (
    -- TU TURNO: Calcular crecimiento mensual de ventas
    
),
top_performers AS (
    -- TU TURNO: Top 3 empleados, productos, clientes
    
)
-- TU TURNO: Combinar todos los KPIs en un reporte ejecutivo




-- 2.2 Análisis de cohorts por mes de registro
WITH clientes_cohorte AS (
    SELECT 
        id_cliente,
        DATE_TRUNC('month', fecha_registro) as mes_registro,
        EXTRACT(YEAR FROM fecha_registro) as año_registro,
        EXTRACT(MONTH FROM fecha_registro) as mes_num
    FROM clientes
),
ventas_cohorte AS (
    -- TU TURNO: Analizar comportamiento de compra por cohorte
    
)
-- TU TURNO: Análisis de retención por cohorte




-- 2.3 Segmentación RFM (Recency, Frequency, Monetary)
WITH rfm_raw AS (
    SELECT 
        c.id_cliente,
        c.nombre || ' ' || c.apellido as cliente,
        MAX(v.fecha_venta) as ultima_compra,
        COUNT(v.id_venta) as frecuencia,
        SUM(v.total_calculado) as valor_total,
        -- Recency: días desde última compra
        CURRENT_DATE - MAX(v.fecha_venta)::date as dias_ultima_compra
    FROM clientes c
    LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nombre, c.apellido
),
rfm_scores AS (
    -- TU TURNO: Calcular scores RFM usando NTILE
    
),
segmentos_rfm AS (
    -- TU TURNO: Crear segmentos basados en scores RFM
    
)
-- TU TURNO: Consulta final con segmentación RFM




-- =====================================================
-- 🔍 EJERCICIO 3: DETECCIÓN DE ANOMALÍAS (10 min)
-- =====================================================

-- 3.1 Detección de outliers en ventas
WITH stats_ventas AS (
    SELECT 
        AVG(total_calculado) as media,
        STDDEV(total_calculado) as desviacion_std,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_calculado) as q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_calculado) as q3
    FROM ventas
),
outliers AS (
    SELECT v.*, s.media, s.desviacion_std,
        CASE 
            WHEN v.total_calculado > s.media + 2 * s.desviacion_std THEN 'ALTO'
            WHEN v.total_calculado < s.media - 2 * s.desviacion_std THEN 'BAJO'
            ELSE 'NORMAL'
        END as tipo_outlier
    FROM ventas v
    CROSS JOIN stats_ventas s
)
-- TU TURNO: Mostrar outliers con información del cliente y producto




-- 3.2 Análisis de empleados con patrones inusuales
-- TU TURNO: Empleados con ventas muy altas o muy bajas comparado con su departamento




-- 3.3 Productos con comportamiento de ventas anómalo
-- TU TURNO: Productos con ventas irregulares (muy altas un mes, muy bajas otro)




-- =====================================================
-- 🏢 EJERCICIO 4: ETL Y DATA WAREHOUSE (10 min)
-- =====================================================

-- 4.1 Crear tabla de hechos para análisis OLAP
CREATE TABLE IF NOT EXISTS fact_ventas (
    id_venta INTEGER,
    fecha_venta DATE,
    año INTEGER,
    mes INTEGER,
    trimestre INTEGER,
    dia_semana INTEGER,
    id_cliente INTEGER,
    id_producto INTEGER,
    id_empleado INTEGER,
    id_departamento INTEGER,
    id_categoria INTEGER,
    cantidad INTEGER,
    precio_unitario DECIMAL(10,2),
    descuento DECIMAL(5,2),
    total_venta DECIMAL(10,2),
    costo_producto DECIMAL(10,2), -- Asumimos 60% del precio
    margen DECIMAL(10,2)
);

-- TU TURNO: Poblar la tabla de hechos con transformaciones




-- 4.2 Crear dimensiones para análisis multidimensional
-- TU TURNO: Crear dim_tiempo, dim_geografia, dim_productos_enriquecida




-- 4.3 Consultas OLAP típicas
-- TU TURNO: Ventas por año/mes/trimestre con drill-down capability




-- =====================================================
-- 🎯 EJERCICIO 5: CASOS REALES COMPLEJOS (10 min)
-- =====================================================

-- 5.1 Sistema de recomendaciones básico
-- Clientes que compraron X también compraron Y
WITH compras_conjuntas AS (
    SELECT 
        v1.id_cliente,
        v1.id_producto as producto_a,
        v2.id_producto as producto_b,
        COUNT(*) OVER (PARTITION BY v1.id_producto, v2.id_producto) as frecuencia_juntos
    FROM ventas v1
    JOIN ventas v2 ON v1.id_cliente = v2.id_cliente 
                   AND v1.id_producto != v2.id_producto
                   AND DATE_TRUNC('month', v1.fecha_venta) = DATE_TRUNC('month', v2.fecha_venta)
)
-- TU TURNO: Mostrar productos frecuentemente comprados juntos




-- 5.2 Análisis de churn (clientes que dejan de comprar)
WITH ultima_compra_cliente AS (
    -- TU TURNO: Identificar clientes en riesgo de churn
    
),
churn_score AS (
    -- TU TURNO: Calcular score de riesgo de churn
    
)
-- TU TURNO: Lista de clientes en riesgo con score




-- 5.3 Optimización de precios dinámicos
-- TU TURNO: Analizar elasticidad precio-demanda por producto




-- =====================================================
-- 🏆 EVALUACIÓN FINAL - PROYECTO COMPLETO (5 min)
-- =====================================================

-- PROYECTO: Sistema de Business Intelligence completo
-- Crear un dashboard que incluya:

-- 1. KPIs principales en tiempo real
WITH dashboard_kpis AS (
    -- TU SOLUCIÓN: Ventas, clientes, productos, empleados top
    
),

-- 2. Análisis de tendencias
tendencias AS (
    -- TU SOLUCIÓN: Crecimiento mensual, estacional, etc.
    
),

-- 3. Segmentación de clientes
segmentacion AS (
    -- TU SOLUCIÓN: RFM, geográfica, por valor
    
),

-- 4. Performance de empleados y departamentos
performance AS (
    -- TU SOLUCIÓN: Rankings, objetivos vs realidad
    
),

-- 5. Alertas y anomalías
alertas AS (
    -- TU SOLUCIÓN: Outliers, riesgos, oportunidades
    
)

-- TU SOLUCIÓN FINAL: Combinar todo en un reporte ejecutivo integral




-- =====================================================
-- 🎓 CERTIFICACIÓN FINAL (5 min)
-- =====================================================

-- EXAMEN FINAL: Resolver en menos de 10 minutos
-- "Crear un análisis completo de la empresa mostrando:
-- - Top 3 empleados por departamento (por ventas)
-- - Productos con mayor crecimiento mes a mes
-- - Clientes VIP (top 10% por valor) con riesgo de churn
-- - Recomendaciones de optimización basadas en datos"

-- TU SOLUCIÓN FINAL:




-- =====================================================
-- 🏆 ¡FELICIDADES! BOOTCAMP SQL COMPLETADO
-- =====================================================

-- ✅ EN 8 HORAS HAS DOMINADO:
-- 
-- NIVEL 1 - FUNDAMENTOS:
-- ✅ SELECT, WHERE, ORDER BY, LIMIT
-- ✅ Filtros básicos y comparaciones
--
-- NIVEL 2 - INTERMEDIO:
-- ✅ BETWEEN, IN, LIKE, operadores lógicos
-- ✅ COUNT, SUM, AVG, GROUP BY, HAVING
--
-- NIVEL 3 - AVANZADO:
-- ✅ INNER/LEFT/RIGHT/FULL JOINs
-- ✅ Múltiples JOINs y consultas complejas
--
-- NIVEL 4 - EXPERTO:
-- ✅ Subconsultas escalares y correlacionadas
-- ✅ EXISTS, IN, ANY, ALL
--
-- NIVEL 5 - MASTER:
-- ✅ CTEs (Common Table Expressions)
-- ✅ Window Functions (ROW_NUMBER, RANK, LAG, LEAD)
-- ✅ Funciones de agregación con ventanas
--
-- NIVEL 6 - ARQUITECTO:
-- ✅ INSERT, UPDATE, DELETE seguros
-- ✅ UPSERT y transacciones
-- ✅ Operaciones en lotes
--
-- NIVEL 7 - EXPERTO EMPRESARIAL:
-- ✅ Optimización de consultas e índices
-- ✅ Análisis de performance
-- ✅ ETL y Data Warehousing
-- ✅ Business Intelligence
-- ✅ Detección de anomalías
-- ✅ Sistemas de recomendación
-- ✅ Análisis de churn y RFM

-- 🎯 CERTIFICACIÓN OBTENIDA: SQL EXPERT LEVEL
-- 💪 HABILIDADES DESBLOQUEADAS: Consultas de nivel empresarial
-- 🚀 PRÓXIMO PASO: Aplicar en proyectos reales

-- ⏰ TIEMPO TOTAL: 8 horas
-- 📊 NIVEL ALCANZADO: [████████████████████] 100% EXPERTO

-- 🌟 ¡ERES OFICIALMENTE UN EXPERTO EN SQL!
-- 
-- Ahora puedes:
-- - Crear consultas complejas para cualquier negocio
-- - Optimizar bases de datos para alto rendimiento  
-- - Diseñar sistemas de análisis de datos
-- - Resolver problemas empresariales con SQL
-- - Enseñar SQL a otros desarrolladores

-- 🎉 ¡CONGRATULATIONS, SQL MASTER! 🎉