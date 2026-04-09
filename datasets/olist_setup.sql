-- Active: 1775671857494@@127.0.0.1@5432@olist
-- ============================================================
-- SETUP: Brazilian E-Commerce Public Dataset by Olist
-- Fuente: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
-- ============================================================
-- INSTRUCCIONES DE USO:
--
-- 1. Descarga los CSVs desde Kaggle (link arriba).
-- 2. Crea la base de datos en PostgreSQL:
--       CREATE DATABASE olist;
-- 3. Conéctate a ella y ejecuta este script completo.
--    Crea las tablas en el orden correcto (respeta las FK).
-- 4. Importa cada CSV con el comando \copy (psql) o con
--    la función de importación de DBeaver/pgAdmin.
--
-- ORDEN DE IMPORTACIÓN (respetar este orden por las FK):
--   1. olist_customers_dataset
--   2. olist_sellers_dataset
--   3. olist_products_dataset
--   4. product_category_name_translation
--   5. olist_orders_dataset
--   6. olist_order_items_dataset
--   7. olist_order_payments_dataset
--   8. olist_order_reviews_dataset
--
-- COMANDO \copy (ejemplo para psql):
--   \copy olist_customers_dataset FROM 'ruta/olist_customers_dataset.csv'
--   WITH (FORMAT csv, HEADER true, DELIMITER ',');
-- ============================================================


-- -----------------------------------------------
-- DROP (en orden inverso a FK)
-- -----------------------------------------------
DROP TABLE IF EXISTS olist_order_reviews_dataset ;
DROP TABLE IF EXISTS olist_order_payments_dataset;
DROP TABLE IF EXISTS olist_order_items_dataset;
DROP TABLE IF EXISTS olist_orders_dataset;
DROP TABLE IF EXISTS product_category_name_translation;
DROP TABLE IF EXISTS olist_products_dataset;
DROP TABLE IF EXISTS olist_sellers_dataset;
DROP TABLE IF EXISTS olist_customers_dataset;


-- -----------------------------------------------
-- TABLAS
-- -----------------------------------------------

-- Clientes
CREATE TABLE olist_customers_dataset (
    customer_id               VARCHAR(50),
    customer_unique_id        VARCHAR(50) NOT NULL,
    customer_zip_code_prefix  VARCHAR(10),
    customer_city             VARCHAR(80),
    customer_state            CHAR(2)
);

-- Vendedores
CREATE TABLE olist_sellers_dataset (
    seller_id                 VARCHAR(50),
    seller_zip_code_prefix    VARCHAR(10),
    seller_city               VARCHAR(80),
    seller_state              CHAR(2)
);

-- Traducción de categorías
CREATE TABLE product_category_name_translation (
    product_category_name         VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

-- Productos
CREATE TABLE olist_products_dataset (
    product_id                   VARCHAR(50),
    product_category_name        VARCHAR(100),
    product_name_lenght          INT,
    product_description_lenght   INT,
    product_photos_qty           INT,
    product_weight_g             NUMERIC,
    product_length_cm            NUMERIC,
    product_height_cm            NUMERIC,
    product_width_cm             NUMERIC
);

-- Órdenes
CREATE TABLE olist_orders_dataset (
    order_id                        VARCHAR(50),
    customer_id                     VARCHAR(50),
    order_status                    VARCHAR(20),
    order_purchase_timestamp        TIMESTAMP,
    order_approved_at               TIMESTAMP,
    order_delivered_carrier_date    TIMESTAMP,
    order_delivered_customer_date   TIMESTAMP,
    order_estimated_delivery_date   TIMESTAMP
);

-- Items de cada orden
CREATE TABLE olist_order_items_dataset (
    order_id              VARCHAR(50),
    order_item_id         INT,
    product_id            VARCHAR(50),
    seller_id             VARCHAR(50),
    shipping_limit_date   TIMESTAMP,
    price                 NUMERIC(10,2),
    freight_value         NUMERIC(10,2)
);

-- Pagos
CREATE TABLE olist_order_payments_dataset (
    order_id              VARCHAR(50),
    payment_sequential    INT,
    payment_type          VARCHAR(30),
    payment_installments  INT,
    payment_value         NUMERIC(10,2)
);

-- Reseñas
CREATE TABLE olist_order_reviews_dataset (
    review_id               VARCHAR(50),
    order_id                VARCHAR(50),
    review_score            SMALLINT CHECK (review_score BETWEEN 1 AND 5),
    review_comment_title    TEXT,
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);


-- -----------------------------------------------
-- ÍNDICES útiles para los ejercicios
-- -----------------------------------------------
CREATE INDEX idx_orders_customer    ON olist_orders_dataset(customer_id);
CREATE INDEX idx_orders_status      ON olist_orders_dataset(order_status);
CREATE INDEX idx_orders_purchase_ts ON olist_orders_dataset(order_purchase_timestamp);
CREATE INDEX idx_items_product      ON olist_order_items_dataset(product_id);
CREATE INDEX idx_items_seller       ON olist_order_items_dataset(seller_id);
CREATE INDEX idx_payments_order     ON olist_order_payments_dataset(order_id);
CREATE INDEX idx_reviews_order      ON olist_order_reviews_dataset(order_id);


-- -----------------------------------------------
-- VERIFICACIÓN RÁPIDA (ejecutar después de importar CSVs)
-- -----------------------------------------------
-- SELECT 'customers' AS tabla, COUNT(*) FROM olist_customers_dataset
-- UNION ALL
-- SELECT 'orders',   COUNT(*) FROM olist_orders_dataset
-- UNION ALL
-- SELECT 'items',    COUNT(*) FROM olist_order_items_dataset
-- UNION ALL
-- SELECT 'payments', COUNT(*) FROM olist_order_payments_dataset
-- UNION ALL
-- SELECT 'products', COUNT(*) FROM olist_products_dataset
-- UNION ALL
-- SELECT 'sellers',  COUNT(*) FROM olist_sellers_dataset
-- UNION ALL
-- SELECT 'reviews',  COUNT(*) FROM olist_order_reviews_dataset;
--
-- Resultado esperado:
--   customers  ~99.441
--   orders     ~99.441
--   items      ~112.650
--   payments   ~103.886
--   products   ~32.951
--   sellers    ~3.095
--   reviews    ~99.224