-- Which items or categories have the highest average review ratings?
SELECT 
    category,
    ROUND(AVG(review_rating)::numeric, 3) AS avg_review_rating
FROM customer
GROUP BY category
ORDER BY avg_review_rating DESC;

-- Which sizes and colors are most popular among customers?	
select size,count(*) as No_of_products_bought from customer
group by size
order by No_of_products_bought desc;

select color,count(*) as No_of_products_bought from customer
group by color
order by No_of_products_bought desc;

-- Which items are most frequently purchased again (repeat buys)?
select item_purchased,count(*) as total_No_of_Products_bought from customer
group by item_purchased
order by total_No_of_Products_bought desc;

-- Which categories offer the highest discounts?
select category,count(*) as total_count from customer
where discount_applied = 'Yes'
group by category
order by total_count desc;
