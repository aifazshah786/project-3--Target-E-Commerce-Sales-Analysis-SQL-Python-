## Business Requirement
**Top 10 Sellers**

-Top 10 Sellers 

SELECT TOP 10
    seller_id,
    SUM(price) AS Revenue
FROM order_items$
GROUP BY seller_id
ORDER BY Revenue DESC;
