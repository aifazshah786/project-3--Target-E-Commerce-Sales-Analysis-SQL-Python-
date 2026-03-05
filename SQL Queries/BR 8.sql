## Business Requirement

**Calculate the percentage of total revenue contributed by each product category.**

SELECT 
    p.[product category],
    
    SUM(oi.price) AS Category_Revenue,

    SUM(oi.price) * 100.0 /
    (SELECT SUM(price) FROM order_items$) 
    AS Revenue_Percentage

FROM order_items$ oi

JOIN products$ p
    ON oi.product_id = p.product_id

GROUP BY p.[product category]

ORDER BY Revenue_Percentage DESC;
