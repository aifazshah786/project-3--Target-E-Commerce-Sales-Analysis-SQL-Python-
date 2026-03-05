Objective: Generate strategic and customer-centric insights.
### Business Requirement

**Calculate the moving average of order values for each customer over their order history.**
  
SELECT 
    o.customer_id,
    o.order_purchase_timestamp,
    SUM(p.payment_value) AS Order_Value,

    AVG(SUM(p.payment_value)) OVER
    (
        PARTITION BY o.customer_id
        ORDER BY o.order_purchase_timestamp
    ) AS Moving_Average

FROM dbo.orders$ o

JOIN dbo.payments$ p
ON o.order_id = p.order_id

GROUP BY 
    o.customer_id,
    o.order_purchase_timestamp

ORDER BY 
    o.customer_id,
    o.order_purchase_timestamp;
