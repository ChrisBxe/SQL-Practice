-- ============================================================
-- MÓDULO : Window Functions
-- Dataset: Brazilian E-Commerce Public Dataset by Olist
--          https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
-- Temas: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD,
--        SUM/AVG acumulados, promedios móviles, NTILE
-- ============================================================
--   olist_orders_dataset            (order_id, customer_id, order_status,
--                                    order_purchase_timestamp, ...)
--   olist_order_items_dataset       (order_id, product_id, seller_id,
--                                    price, freight_value)
--   olist_order_payments_dataset    (order_id, payment_type,
--                                    payment_value)
--   olist_customers_dataset         (customer_id, customer_unique_id,
--                                    customer_state)
--   olist_products_dataset          (product_id, product_category_name)
--   product_category_name_translation (product_category_name,
--                                      product_category_name_english)
--   olist_sellers_dataset           (seller_id, seller_state)
--   olist_order_reviews_dataset     (order_id, review_score)


-- ------------------------------------------------------------
-- SECCIÓN · Ranking básico
-- ------------------------------------------------------------

-- Ejercicio 1
-- Rankea a los vendedores (sellers) por su revenue total
-- (suma de price en olist_order_items_dataset),
-- considerando solo órdenes con status = 'delivered'.
-- Usa ROW_NUMBER. Muestra el top 20.
-- Columnas esperadas: seller_id, seller_state, total_revenue, revenue_rank

-- SOLUCIÓN:
SELECT 
    ooid.seller_id,
    osd.seller_state,
    SUM(price) as total_revenue,
    ROW_NUMBER() OVER(ORDER BY SUM(price) DESC) as revenue_rank
FROM olist_order_items_dataset AS ooid
JOIN olist_sellers_dataset AS osd
ON ooid.seller_id = osd.seller_id
JOIN olist_orders_dataset AS ood
ON ooid.order_id = ood.order_id
WHERE order_status = 'delivered'
GROUP BY ooid.seller_id, osd.seller_state
ORDER BY total_revenue DESC
LIMIT 20;


-- ============================================================

-- Ejercicio 2
-- Mismo ranking de vendedores por revenue, pero usa RANK
-- en lugar de ROW_NUMBER.

-- SOLUCIÓN:
SELECT 
    ooid.seller_id,
    osd.seller_state,
    SUM(price) as total_revenue,
    RANK() OVER(ORDER BY SUM(price) DESC) as revenue_rank
FROM olist_order_items_dataset AS ooid
JOIN olist_sellers_dataset AS osd
ON ooid.seller_id = osd.seller_id
JOIN olist_orders_dataset AS ood
ON ooid.order_id = ood.order_id
WHERE order_status = 'delivered'
GROUP BY ooid.seller_id, osd.seller_state
ORDER BY total_revenue DESC
LIMIT 20;


-- ============================================================

-- Ejercicio 3
-- Rankea los productos DENTRO de cada categoría por su
-- revenue total (suma de price en order_items),
-- usando DENSE_RANK. Muestra solo el top 3 por categoría.
-- Usa el nombre de categoría en inglés
-- (product_category_name_english).
-- Columnas esperadas: category_english, product_id,
--                     total_revenue, rank_in_category

-- SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · LAG y LEAD
-- ------------------------------------------------------------

-- Ejercicio 4
-- Para cada customer_unique_id con más de una orden,
-- muestra la fecha de compra (order_purchase_timestamp)
-- y la fecha de su orden ANTERIOR (NULL si es la primera).
-- Ordena por customer_unique_id y order_purchase_timestamp.
-- Columnas esperadas: customer_unique_id, order_id,
--                     order_purchase_timestamp, prev_order_date
-- Nota: usa customer_unique_id (no customer_id) para identificar
-- al mismo cliente a través de múltiples órdenes.

-- SOLUCIÓN:

-- ============================================================

-- Ejercicio 5
-- Calcula los días transcurridos entre la orden actual
-- y la anterior de cada cliente (customer_unique_id).
-- Incluye solo clientes con al menos 2 órdenes.
-- Columnas esperadas: customer_unique_id, order_id,
--                     order_purchase_timestamp,
--                     days_since_last_order

-- SOLUCIÓN:


-- ============================================================

-- Ejercicio 6
-- Para cada orden entregada ('delivered'), muestra también
-- la fecha de compra de la SIGUIENTE orden del mismo cliente
-- (LEAD). Si no hay orden siguiente, muestra NULL.
-- Columnas esperadas: customer_unique_id, order_id,
--                     order_purchase_timestamp, next_order_date

-- SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · Acumulados y promedios móviles
-- ------------------------------------------------------------

-- Ejercicio 7
-- Calcula el revenue mensual (SUM de payment_value en
-- olist_order_payments_dataset) y el acumulado mes a mes
-- durante 2017, usando solo órdenes con status = 'delivered'.
-- Columnas esperadas: month, monthly_revenue, cumulative_revenue
-- Pista: usa DATE_TRUNC('month', order_purchase_timestamp)

-- SOLUCIÓN:


-- ============================================================

-- Ejercicio 8
-- Para cada seller, calcula el revenue acumulado orden por orden
-- (suma de price) ordenado por la fecha de la orden.
-- Incluye solo sellers con más de 50 órdenes entregadas.
-- Columnas esperadas: seller_id, order_id,
--                     order_purchase_timestamp,
--                     order_revenue, cumulative_revenue

-- SOLUCIÓN:


-- ============================================================

-- Ejercicio 9  [Desafío]
-- Calcula el promedio móvil de 3 meses del revenue
-- (payment_value) durante 2017–2018, incluyendo el mes
-- actual y los 2 anteriores.
-- Columnas esperadas: month, monthly_revenue, moving_avg_3m
-- Pista: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

-- SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · Percentiles y distribución
-- ------------------------------------------------------------

-- Ejercicio 10
-- Clasifica a los sellers en cuartiles según su revenue total
-- (solo órdenes 'delivered'). Cuartil 1 = menor revenue.
-- Muestra además el revenue promedio por cuartil.
-- Columnas esperadas: seller_id, total_revenue, quartile
-- Pista: NTILE(4)

-- SOLUCIÓN:


-- ============================================================

-- Ejercicio 11  [Desafío]
-- Para cada categoría de producto (en inglés), calcula qué
-- porcentaje representa su revenue sobre el revenue total
-- de todos los productos.
-- Muestra solo las 15 categorías con mayor revenue.
-- Columnas esperadas: category_english, category_revenue,
--                     total_revenue, pct_of_total
-- Pista: SUM() OVER () sin PARTITION BY

-- SOLUCIÓN:


-- ============================================================