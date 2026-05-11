USE sales_superstore;
-- =====================================================
-- 1. GANANCIAS Y VENTAS TOTALES
-- =====================================================

SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales;


-- =====================================================
-- 2. ANÁLISIS POR CATEGORÍA
-- =====================================================

SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM sales
GROUP BY category
ORDER BY total_profit DESC;


-- =====================================================
-- 3. PRODUCTOS CON PÉRDIDAS
-- =====================================================

SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;


-- =====================================================
-- 4. IMPACTO DE LOS DESCUENTOS EN LA RENTABILIDAD
-- =====================================================

SELECT 
    discount,
    COUNT(*) AS total_orders,
    SUM(profit) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;


-- =====================================================
-- 5. ANÁLISIS POR REGIÓN
-- =====================================================

SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM sales
GROUP BY region
ORDER BY total_profit DESC;


-- =====================================================
-- 6. PRODUCTOS MÁS VENDIDOS
-- =====================================================

SELECT 
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- =====================================================
-- 7. PRODUCTOS MÁS RENTABLES
-- =====================================================

SELECT 
    product_name,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- =====================================================
-- 8. EVOLUCIÓN DE VENTAS POR MES
-- =====================================================

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


-- =====================================================
-- 9. ANÁLISIS DE DESCUENTO PROMEDIO
-- =====================================================

SELECT 
    category,
    AVG(discount) AS avg_discount,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY avg_discount DESC;


-- =====================================================
-- 10. TOP CLIENTES POR GANANCIA
-- =====================================================

SELECT 
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;