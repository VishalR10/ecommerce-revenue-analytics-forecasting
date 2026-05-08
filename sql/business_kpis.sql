USE superstore_analytics;

-- 1.Total Revenue
SELECT 
ROUND(SUM(Sales),2) AS total_revenue
FROM superstore_sales;

-- 2. Total Profit
SELECT 
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales;

-- 3. Total Orders
SELECT 
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore_sales;

-- 4. Average Order Value
SELECT 
    ROUND(
        SUM(Sales) / COUNT(DISTINCT Order_ID),
        2
    ) AS average_order_value
FROM superstore_sales;

-- 5. Profit Margin Percentage
SELECT 
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales;

-- 6. Revenue and Profit by Region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY Region
ORDER BY total_revenue DESC;

-- 7. Category Performance Analysis
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity_sold
FROM superstore_sales
GROUP BY Category
ORDER BY total_revenue DESC;

-- 8. Top 10 Products by Revenue
SELECT 
    Product_Name,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 10;

-- 9. Top 10 Products by Profit
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;

-- 10. Top 10 Loss-Making Products
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_loss
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_loss ASC
LIMIT 10;

-- 11. Monthly Sales Trend
SELECT 
    DATE_FORMAT(
        STR_TO_DATE(Order_Date, '%m/%d/%Y'),
        '%Y-%m'
    ) AS sales_month,

    ROUND(SUM(Sales), 2) AS monthly_revenue,

    ROUND(SUM(Profit), 2) AS monthly_profit

FROM superstore_sales

GROUP BY sales_month

ORDER BY sales_month;