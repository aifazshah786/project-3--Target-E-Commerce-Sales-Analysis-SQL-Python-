## Business Requirement
**Objective: Dive deeper into sales and order trends.**

  **Calculate the number of orders per month in 2018.**

SELECT 
    YEAR(order_purchase_timestamp) AS Year,
    MONTH(order_purchase_timestamp) AS Month,
    COUNT(order_id) AS Total_Orders

FROM orders$

WHERE order_purchase_timestamp >= '2018-01-01'
AND order_purchase_timestamp < '2019-01-01'

GROUP BY 
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)

ORDER BY Year, Month;
