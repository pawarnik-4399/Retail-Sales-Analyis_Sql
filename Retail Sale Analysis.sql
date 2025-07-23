select transaction_region,count(*) from combine_data_table group by transaction_region;    -- Que(1)Q1. How many total transactions occurred in each region?

select transaction_region as region, 
sum(sales_amount) as total_sales,
avg(sales_amount) as average_sales from combine_data_table group by transaction_region;  -- que(2)What is the total and average sales amount in each region?

select * from combine_data_table;


select  transaction_region as region,
sum(sales_amount) as Total_sales,
avg(sales_amount) as Avergae_Sales
from combine_data_table
group by transaction_region         -- Q3. Which region has the highest average sales per transaction?
order by Avergae_Sales desc limit 1;

select transaction_region as region,	-- que(4)Which product categories sell the most in each region?	
product_category, 
sum(sales_amount)as category_sale
from combine_data_table
group by region,product_category
order by region,category_sale desc;

select transaction_region as region,   -- Q5. Which region has the highest number of premium membership customers?
count(*) as premium_membership
from combine_data_table
group by region
order by premium_membership;

select * from combine_data_table;
	
    
 select transaction_region as region,store_name,        -- Q6. In each region, which store has the highest total sales?
 sum(sales_amount) as Total_sales
 from combine_data_table
 group by region,store_name
 order by region,total_sales desc limit 5;
 
 select * from combine_data_table;

-- Comparision AS Per The Product_Category

SELECT product_category, COUNT(*) AS total_transactions  -- Q1). What are the distinct product categories and their total number of transactions?
FROM combine_data_table
GROUP BY product_category;


select product_category as category,           -- Q1.1). What is the total and average sales per product_category?
sum(sales_amount) as Total_sales,
avg(sales_amount)as Average_sales
from combine_data_table
group by category
order by Total_sales,Average_sales;
 
select product_category as category,  -- Q1.2). Which product category has the highest units sold?
sum(units_sold) as Total_Sold
from combine_data_table
group by category
order by Total_sold desc;
 
 select product_category,transaction_region, -- Q1.3). Which product category performs best in each region?
 sum(sales_amount) as Total_sales
 from combine_data_table
 group by product_category,transaction_region
 order by transaction_region,Total_sales;

select * from combine_data_table;
 
select product_category as category,gender,     -- Q1.4). Which customer gender prefers which product categories?
count(*) as count_gender
from combine_data_table
group by category,gender
order by gender,count_gender;	

--  What is the gender distribution of customers?

SELECT gender, COUNT(*) AS total_customers
FROM combine_data_table
GROUP BY gender;

-- What is the average age and units_sold of customers by gender?

select * from combine_data_table;
select gender,
avg(age) as Avergae_Age,
avg(units_sold) as Average_unit_sold
from combine_data_table
group by gender;

Q)On Basis of gender what is count of membership_status also min and max in store_region?
select gender,
count(*) as membership_status,
max(store_region) as maximum_region,
min(store_region) as minimum_region
from combine_data_table
group by gender;



-- Question 4)

-- How many transactions occurred under each promotion detail?

SELECT promotion_details, COUNT(*) AS total_transactions
FROM combine_data_table
WHERE promotion_details IS NOT NULL
GROUP BY promotion_details
ORDER BY total_transactions DESC;

-- What is the average discount percentage offered under each promotion detail?
select promotion_details,
avg(discount_percentage) as Discount
from combine_data_table
where promotion_details is not null
group by promotion_details
order by Discount Desc;

-- Which regions respond best to each promotion detail?     
select * from combine_data_table;

select promotion_details,transaction_region,
count(*) as transactions,
sum(sales_amount) as total_sales
from combine_data_table
where promotion_details is not null
group by promotion_details,transaction_region
order by transaction_region,total_sales;