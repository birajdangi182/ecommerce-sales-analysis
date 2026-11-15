-- E-commerce Sales Analysis
-- Database: PostgreSQL
-- Table assumed: sales
-- Import data/sales_data.csv into a table named sales before running.

-- 1. Preview records
SELECT * FROM sales LIMIT 10;

-- 2. Overall business KPIs
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS profit_margin_pct,
    ROUND(AVG(revenue)::numeric, 2) AS average_line_revenue
FROM sales;

-- 3. Monthly revenue and profit
SELECT
    DATE_TRUNC('month', order_date::date)::date AS month,
    ROUND(SUM(revenue)::numeric, 2) AS revenue,
    ROUND(SUM(profit)::numeric, 2) AS profit
FROM sales
GROUP BY 1
ORDER BY 1;

-- 4. Category performance
SELECT
    category,
    ROUND(SUM(revenue)::numeric, 2) AS revenue,
    ROUND(SUM(profit)::numeric, 2) AS profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS margin_pct
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 5. Top 10 products by revenue
SELECT product, SUM(quantity) AS units_sold,
       ROUND(SUM(revenue)::numeric, 2) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;

-- 6. Revenue by region and channel
SELECT region, sales_channel,
       ROUND(SUM(revenue)::numeric, 2) AS revenue
FROM sales
GROUP BY region, sales_channel
ORDER BY region, revenue DESC;

-- 7. Customers with highest lifetime revenue
SELECT customer_id,
       COUNT(DISTINCT order_id) AS order_count,
       ROUND(SUM(revenue)::numeric, 2) AS lifetime_revenue
FROM sales
GROUP BY customer_id
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- 8. Discount analysis
SELECT discount_pct,
       COUNT(*) AS transaction_lines,
       ROUND(AVG(profit)::numeric, 2) AS average_profit,
       ROUND(SUM(revenue)::numeric, 2) AS revenue
FROM sales
GROUP BY discount_pct
ORDER BY discount_pct;
