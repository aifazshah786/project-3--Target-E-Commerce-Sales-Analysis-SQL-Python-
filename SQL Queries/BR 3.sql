##Bussiness Requirement**
**Find the total sales per category.**

SELECT 
    p.[product category] AS category_name,
    SUM(oi.price) AS total_sales
FROM dbo.order_items$ oi
JOIN dbo.products$ p
    ON oi.product_id = p.product_id
GROUP BY p.[product category]
ORDER BY total_sales DESC;
