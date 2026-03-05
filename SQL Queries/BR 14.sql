## Business Requirement
**Calculate the year-over-year growth rate of total sales.**


SELECT 
    YEAR(o.order_purchase_timestamp) AS Year,

    SUM(p.payment_value) AS Total_Sales,

    LAG(SUM(p.payment_value)) OVER
    (
        ORDER BY YEAR(o.order_purchase_timestamp)
    ) AS Previous_Year_Sales,

    (
        SUM(p.payment_value)
        - LAG(SUM(p.payment_value)) OVER
        (ORDER BY YEAR(o.order_purchase_timestamp))
    ) * 100.0

    /

    LAG(SUM(p.payment_value)) OVER
    (ORDER BY YEAR(o.order_purchase_timestamp))

    AS YoY_Growth_Percentage

FROM dbo.orders$ o

JOIN dbo.payments$ p
ON o.order_id = p.order_id

GROUP BY YEAR(o.order_purchase_timestamp)

ORDER BY Year;

