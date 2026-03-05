 Count the number of orders placed in 2017.
   
SELECT COUNT(*) AS total_orders_2017
FROM orders$
WHERE YEAR(order_purchase_timestamp) = 2017;
