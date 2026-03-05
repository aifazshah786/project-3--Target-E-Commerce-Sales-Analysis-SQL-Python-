## Business Requirement

**Calculate the retention rate of customers, defined as the percentage of customers who make another purchase within 6 months of their first purchase.**

WITH FirstPurchase AS
(
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date
    FROM dbo.orders$
    GROUP BY customer_id
),

NextPurchase AS
(
    SELECT
        fp.customer_id,
        fp.first_purchase_date,
        MIN(o.order_purchase_timestamp) AS next_purchase_date
    FROM FirstPurchase fp
    JOIN dbo.orders$ o
        ON fp.customer_id = o.customer_id
        AND o.order_purchase_timestamp > fp.first_purchase_date
    GROUP BY
        fp.customer_id,
        fp.first_purchase_date
)

SELECT

COUNT(customer_id) * 100.0 /

(
SELECT COUNT(*) FROM FirstPurchase
)

AS Retention_Rate_Percentage

FROM NextPurchase

WHERE DATEDIFF(MONTH, first_purchase_date, next_purchase_date) <= 6;
