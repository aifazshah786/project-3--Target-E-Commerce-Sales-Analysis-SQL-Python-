## Business Requirement

**Identify the top 3 customers who spent the most money in each year.**

WITH CustomerYearSales AS
(
    SELECT 
        YEAR(o.order_purchase_timestamp) AS Year,
        o.customer_id,
        SUM(p.payment_value) AS TotalSpent

    FROM dbo.orders$ o

    JOIN dbo.payments$ p
        ON o.order_id = p.order_id

    GROUP BY 
        YEAR(o.order_purchase_timestamp),
        o.customer_id
),

RankedCustomers AS
(
    SELECT *,
    
    RANK() OVER
    (
        PARTITION BY Year
        ORDER BY TotalSpent DESC
    ) AS RankNum

    FROM CustomerYearSales
)

SELECT 
    Year,
    customer_id,
    TotalSpent,
    RankNum

FROM RankedCustomers

WHERE RankNum <= 3

ORDER BY Year, RankNum;
