-- What is the total sales revenue?
SELECT 
    ROUND(SUM(purchase_amount), 2) AS total_sales_revenue
FROM customer;

-- Which category generates the highest revenue?
SELECT 
    category,
    ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

-- Which locations generate the most revenue?
select location,sum(purchase_amount) as "total_revenue" from customer
group by location
order by "total_revenue" desc
limit 1;

-- Which seasons show peak sales activity?
select season,count(*) as quantity_sold from customer
group by season
order by quantity_sold desc;

-- What is the average purchase amount per transaction?
SELECT 
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_per_transaction
FROM 
    customer;






