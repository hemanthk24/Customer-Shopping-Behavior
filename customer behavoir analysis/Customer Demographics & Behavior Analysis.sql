-- What is the gender distribution among customers?
Select gender,count(*) as total_customers 
from customer
group by gender;

-- What is the average age of customers in each age group?
select age_group,round(avg(age),2) as average_age
from customer
group by age_group;

-- Which age group contributes the most to total revenue?
select age_group,sum(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue DESC;

-- Does gender affect purchase amount or frequency?
select gender,round(avg(purchase_amount),2) as avg_purchase_price,
round(avg(previous_purchases)) as avg_no_of_purchases
from customer
group by gender;

-- How does subscription status affect customer behavior (spend, frequency, loyalty)?
SELECT 
    subscription_status,
    COUNT(*) AS total_customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    ROUND(AVG(previous_purchases), 2) AS avg_loyalty_score
FROM 
    customer
GROUP BY 
    subscription_status
ORDER BY 
    total_revenue DESC;



