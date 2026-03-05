## Business Requirement
** Count the number of customers from each state.**

SELECT 
    customer_state,
    COUNT(customer_id) AS total_customers
FROM customers$
GROUP BY customer_state
ORDER BY total_customers DESC;
