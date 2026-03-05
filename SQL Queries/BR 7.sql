## Business Requirement
**Find the average number of products per order,grouped by customer city.**
SELECT 
    c.customer_city,
    AVG(Product_Count) AS Avg_Products_Per_Order
FROM
(
    SELECT 
        o.order_id,
        o.customer_id,
        COUNT(oi.product_id) AS Product_Count
    FROM orders$ o
    JOIN order_items$ oi
        ON o.order_id = oi.order_id
    GROUP BY 
        o.order_id,
        o.customer_id
) AS OrderProductCount
JOIN customers$ c
    ON OrderProductCount.customer_id = c.customer_id
GROUP BY c.customer_city
ORDER BY Avg_Products_Per_Order DESC;
