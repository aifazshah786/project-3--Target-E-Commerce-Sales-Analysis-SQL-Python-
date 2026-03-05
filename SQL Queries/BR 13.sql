## Business Requirement
**Calculate the cumulative sales per month for each year.**

	SELECT 
    YEAR(o.order_purchase_timestamp) AS Year,
    MONTH(o.order_purchase_timestamp) AS Month,

    -- Monthly sales
    SUM(p.payment_value) AS Monthly_Sales,

    -- Cumulative sales
    SUM(SUM(p.payment_value)) OVER
    (
        PARTITION BY YEAR(o.order_purchase_timestamp)
        ORDER BY MONTH(o.order_purchase_timestamp)
    ) AS Cumulative_Sales

FROM dbo.orders$ o

JOIN dbo.payments$ p
ON o.order_id = p.order_id

GROUP BY 
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)

ORDER BY Year, Month;
