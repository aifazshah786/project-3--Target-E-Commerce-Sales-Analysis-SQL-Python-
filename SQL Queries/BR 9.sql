## Business Requirement
**Identify the correlation between product price and the number of times a product has been purchased.**

SELECT 
    price,
    COUNT(product_id) AS Times_Purchased
FROM order_items$
GROUP BY price
ORDER BY price;
