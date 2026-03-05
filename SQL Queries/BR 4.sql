##Bussiness Requirement
**Calculate the percentage of orders that were paid in installments.**

SELECT 
    (SUM(CASE WHEN payment_installments > 1 THEN 1 ELSE 0 END) * 100.0 
    / COUNT(*)) AS installment_percentage
