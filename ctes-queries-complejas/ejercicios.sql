-- ============================================================
-- MÓDULO: CTEs y Queries Complejas
-- Dataset: Brazilian E-Commerce Public Dataset by Olist
--          https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
-- Temas: WITH, CTEs encadenadas, CTEs recursivas,
--        combinación con window functions
-- ============================================================
-- Instrucciones:
--   · Escribe tu solución debajo de cada ejercicio.
--   · Intenta resolver cada ejercicio usando CTE (WITH),
--     incluso cuando una subquery también funcionaría.
--     El objetivo es que practiques el patrón CTE.
--   · Cuando termines una sección, compártela para revisión.
-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · CTEs básicas
-- ------------------------------------------------------------

-- Ejercicio 1
-- Usa una CTE para calcular el revenue total por estado
-- del vendedor (seller_state), considerando solo órdenes
-- 'delivered'. Luego filtra solo los estados con revenue
-- mayor a $100,000.
-- Columnas esperadas: seller_state, total_revenue

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 2
-- Crea una CTE que calcule el review_score promedio por
-- categoría de producto (en inglés).
-- Luego muestra las 10 categorías con mejor y peor puntaje
-- (puedes hacer dos queries separados o un UNION).
-- Columnas esperadas: category_english, avg_score, total_reviews

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 3
-- Usa una CTE para identificar las órdenes cuyo valor total
-- (suma de payment_value) supera el doble del promedio
-- de todas las órdenes entregadas.
-- Columnas esperadas: order_id, customer_state,
--                     order_total, avg_order_value

-- TU SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · CTEs encadenadas
-- ------------------------------------------------------------

-- Ejercicio 4
-- Encadena dos CTEs:
--   CTE 1: cuenta las órdenes entregadas y calcula el revenue
--           total por customer_unique_id.
--   CTE 2: segmenta a los clientes en:
--             · 'VIP'      → revenue >= $500
--             · 'regular'  → revenue entre $200 y $499
--             · 'ocasional'→ revenue < $200
-- Resultado final: cuántos clientes hay en cada segmento
-- y su revenue promedio.
-- Columnas esperadas: segment, num_customers, avg_revenue

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 5
-- Encadena tres CTEs para encontrar el mejor mes de cada
-- seller (por revenue):
--   CTE 1: revenue por seller por mes.
--   CTE 2: rankea los meses de cada seller (RANK).
--   CTE 3: filtra solo el mes con rank = 1.
-- Columnas esperadas: seller_id, seller_state,
--                     best_month, monthly_revenue

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 6  [Desafío]
-- Análisis de retención de clientes:
-- Considera "retenido" a un customer_unique_id que compró
-- en el primer semestre de 2017 (ene–jun) Y también en
-- el segundo semestre (jul–dic).
-- Usando CTEs:
--   · Identifica clientes activos en S1 2017.
--   · Identifica clientes activos en S2 2017.
--   · Cruza ambas listas.
-- Muestra: cuántos compraron solo en S1, solo en S2,
--          en ambos semestres, y la tasa de retención (%).
-- Columnas esperadas: only_s1, only_s2, retained, retention_rate

-- TU SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · CTEs + Window Functions combinadas
-- ------------------------------------------------------------

-- Ejercicio 7
-- Usa una CTE para calcular el revenue mensual de 2017,
-- luego aplica LAG para calcular el crecimiento mes a mes
-- en porcentaje respecto al mes anterior.
-- Columnas esperadas: month, revenue, prev_revenue, growth_pct

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 8
-- Encuentra el seller con mayor revenue dentro de cada
-- estado (seller_state), usando CTEs y RANK.
-- Si hay empate, muéstralos todos.
-- Columnas esperadas: seller_state, seller_id,
--                     total_revenue, rank_in_state

-- TU SOLUCIÓN:


-- ============================================================

-- Ejercicio 9  [Desafío]
-- Calcula el "lifetime value" (LTV) acumulado de cada
-- customer_unique_id mes a mes durante 2017:
-- cuánto ha gastado (payment_value) desde su primera compra
-- hasta cada mes.
-- Incluye solo clientes con al menos 2 órdenes en 2017.
-- Columnas esperadas: customer_unique_id, month,
--                     monthly_spent, cumulative_ltv

-- TU SOLUCIÓN:


-- ============================================================


-- ------------------------------------------------------------
-- SECCIÓN · CTE recursiva
-- ------------------------------------------------------------

-- Ejercicio 10  [Desafío avanzado]
-- Genera una secuencia de fechas (primer día de cada mes)
-- desde '2017-01-01' hasta '2018-08-01' usando una CTE
-- recursiva. Luego haz LEFT JOIN con los pagos para mostrar
-- el revenue de cada mes, incluyendo los meses sin ventas
-- como 0.
-- Columnas esperadas: month, revenue
-- Pista: en PostgreSQL usa interval '1 month' para avanzar.

-- TU SOLUCIÓN:


-- ============================================================