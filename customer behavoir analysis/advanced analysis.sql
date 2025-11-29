-- Which 5 products have the highest percentage of purchases with discount applied ?
select item_purchased,
round(100 * SUM(case when discount_applied = 'Yes' Then 1 else 0 END)/COUNT(*),2) as discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5;

-- Segement customers into New, Returning, and loyal based on their total 
-- number of previous purchases, and show the count of  each segment.
with customer_type as (
select customer_id,previous_purchases,
CASE 
	WHEN previous_purchases = 1 THEN 'New'
	WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
	ELSE 'Loyal'
	END AS customer_segment
from customer
)
select customer_segment,count(*) as "Number of customers"
from customer_type
group by customer_segment;

-- What are the top 3 most purchased products within each category?
with item_counts as (
select category,
item_purchased,
count(customer_id) as total_orders,
ROW_NUMBER() OVER(partition by category order by count(customer_id) DESC) as item_rank
from customer
group by category,item_purchased
)
select item_rank,category,item_purchased,total_orders
from item_counts
where item_rank <= 3;

-- Are customers who are repeat buyers (more then 5 previous purchases) also likely to subscribe?
select subscription_status,count(*) as repat_buyers from customer
where previous_purchases > 5
group by subscription_status;

-- what is reveune contribution of each age group
select age_group,sum(purchase_amount) as total_revenue from customer
group by age_group
order by total_revenue desc;