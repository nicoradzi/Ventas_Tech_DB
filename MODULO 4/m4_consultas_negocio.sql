-- RETAILPRO - M4
-- Pre-entrega: Consultas SQL de negocio
-- Archivo: m4_consultas_negocio.sql

-- ============================================================
-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio
-- agrupados por mes.
-- ============================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);


-- ============================================================
-- CONSULTA 2 - RANKING DE PRODUCTOS
-- Top 5 de productos por total facturado,
-- mostrando unidades vendidas y total generado.
-- ============================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- ============================================================
-- CONSULTA 3 - CLIENTES RECURRENTES
-- Clientes que realizaron más de un pedido,
-- mostrando cantidad de pedidos y total gastado.
-- ============================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;


-- ============================================================
-- CONSULTA 4 - MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- Compara la facturación mensual contra el promedio
-- mensual general.
-- ============================================================

WITH resumen_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
),
promedio AS (
    SELECT
        AVG(total_facturado) AS promedio_mensual
    FROM resumen_mensual
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > promedio_mensual THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion
FROM resumen_mensual
CROSS JOIN promedio;


-- ============================================================
-- HALLAZGOS
-- ============================================================

-- 1. El producto 1 concentra aproximadamente el 59,2% de la
--    facturación total.

-- 2. El cliente 1 concentra aproximadamente el 46,8% de la
--    facturación total y realizó 2 pedidos.

-- 3. El producto 2 fue el de mayor volumen de unidades vendidas
--    (13), pero el producto 1 generó la mayor facturación con
--    solo 3 unidades, evidenciando una diferencia entre volumen
--    de ventas y facturación.

-- La base de datos utilizada contiene registros únicamente del
-- mes de marzo. Por este motivo, el promedio mensual coincide
-- con la facturación de marzo ($6.084), por lo que no resulta
-- conceptualmente posible clasificar el mes como "Por encima"
-- o "Por debajo" del promedio.
