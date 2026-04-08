# sql-practice

Repositorio de práctica de SQL enfocado en análisis de datos,
usando el **Brazilian E-Commerce Public Dataset by Olist** —
un dataset real de ~100k órdenes de e-commerce en Brasil (2016–2018).

---

## Dataset

**Fuente:** [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

| Tabla | Filas aprox. | Descripción |
|---|---|---|
| `olist_customers_dataset` | 99.441 | Clientes únicos con estado y ciudad |
| `olist_orders_dataset` | 99.441 | Órdenes con estado y timestamps |
| `olist_order_items_dataset` | 112.650 | Productos, precio y flete por orden |
| `olist_order_payments_dataset` | 103.886 | Pagos con tipo y monto |
| `olist_order_reviews_dataset` | 99.224 | Reseñas con score (1–5) |
| `olist_products_dataset` | 32.951 | Productos con categoría y dimensiones |
| `olist_sellers_dataset` | 3.095 | Vendedores con estado |
| `product_category_name_translation` | 71 | Traducción de categorías al inglés |

---

## Setup

1. Descarga los CSVs desde Kaggle (link arriba).
2. Crea la base de datos:
   ```sql
   CREATE DATABASE olist;
   ```
3. Ejecuta `datasets/olist_setup.sql` — crea todas las tablas e índices.
4. Importa los CSVs en el orden indicado dentro del script.

**Sin instalar nada:** usa [pgplayground.com](https://pgplayground.com)
o [db-fiddle.com](https://www.db-fiddle.com/) con el motor PostgreSQL.

---

## Estructura

```
sql-practice/
├── datasets/
│   └── olist_setup.sql                  # DDL: tablas, FK e índices
├── 03-window-functions/
│   └── ejercicios.sql                   # ROW_NUMBER, RANK, LAG/LEAD, acumulados
└── 04-ctes-queries-complejas/
    └── ejercicios.sql                   # WITH, CTEs encadenadas, recursivas
```

---

## Módulos

### Módulo · Window Functions
Funciones de ventana aplicadas a datos reales de ventas, sellers y clientes.

| Sección | Tema |
|---|---|
| 3.1 | Ranking básico: ROW_NUMBER, RANK, DENSE_RANK |
| 3.2 | LAG y LEAD — comparación entre filas |
| 3.3 | Acumulados y promedios móviles |
| 3.4 | Percentiles y distribución con NTILE |

---

### Módulo · CTEs y Queries Complejas
Dominio del patrón `WITH` para construir análisis de negocio
legibles, escalables y reutilizables.

| Sección | Tema |
|---|---|
| 4.1 | CTEs básicas |
| 4.2 | CTEs encadenadas — segmentación y retención |
| 4.3 | CTEs + Window Functions combinadas |
| 4.4 | CTE recursiva — series de tiempo |

---

## Herramientas recomendadas

- **Motor:** PostgreSQL 15+
- **Cliente:** [DBeaver](https://dbeaver.io/) (gratis) · [pgAdmin](https://www.pgadmin.org/)
- **Sin instalar:** [pgplayground.com](https://pgplayground.com) · [db-fiddle.com](https://www.db-fiddle.com/)

---

## Progreso

| Módulo | Ejercicios | Estado |
|---|---|---|
| 03 · Window Functions | 11 | 🔄 En progreso |
| 04 · CTEs y Queries Complejas | 10 | ⏳ Pendiente |
