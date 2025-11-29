-- Which payment methods are most commonly used?
SELECT 
    payment_method,
    COUNT(*) AS total_orders
FROM customer
GROUP BY payment_method
ORDER BY total_orders DESC;


-- Which shipping type is preferred by customers?
SELECT 
    shipping_type,
    COUNT(*) AS total_orders
FROM customer
GROUP BY shipping_type
ORDER BY total_orders DESC;

-- Is there a relationship between shipping type and purchase amount?
SELECT 
    shipping_type,
    ROUND(AVG(purchase_amount)::numeric, 2) AS avg_purchase_amount,
    COUNT(*) AS total_orders
FROM customer
GROUP BY shipping_type
ORDER BY avg_purchase_amount DESC;

-- How does discount usage impact spending and ratings?
SELECT 
    discount_applied,
    ROUND(AVG(purchase_amount)::numeric, 2) AS avg_spending,
    ROUND(AVG(review_rating)::numeric, 2) AS avg_rating,
    COUNT(*) AS total_customers
FROM customer
GROUP BY discount_applied
ORDER BY avg_spending DESC;

-- How does purchase frequency vary with shipping type or payment method?
SELECT 
    shipping_type,
    payment_method,
    ROUND(AVG(previous_purchases)::numeric, 2) AS avg_purchase_frequency,
    COUNT(*) AS total_customers
FROM customer
GROUP BY shipping_type, payment_method
ORDER BY avg_purchase_frequency DESC;




