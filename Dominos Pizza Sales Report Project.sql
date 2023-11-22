

-- Total Revenue
select sum(total_price) as Total_sales from dominos_sales;
--817860.049999993


-- Average order value
select sum(total_price)/count(distinct order_id) as avg_order_value
from dominos_sales;
-- 38.3072622950816


-- Total pizza sold
select sum(quantity) as Total_pizza_sold from dominos_sales;
-- 49574


-- Total order
select count( distinct order_id) as Total_order
from dominos_sales;
-- 21350


-- Average pizzas per order
select cast(cast(sum(quantity)as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2))
as decimal(10,2))
as avg_pizza_ord
from dominos_sales;
-- 2.32


-- Daily trend for total orders
select datename(DW,order_date) as day_name,count(distinct order_id) as total_orders
from dominos_sales
group by datename(DW,order_date);


-- Monthly trend for total orders
select datename(MONTH,order_date) as month_name,count(distinct order_id) as total_orders
from dominos_sales
group by datename(MONTH,order_date);


-- % of sales by pizza category
select pizza_category,cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from dominos_sales) as decimal(10,2)) as PCT
from dominos_sales
group by pizza_category;


-- Percentage of sales by pizza size
select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from dominos_sales) as decimal(10,2)) as PCT
from dominos_sales
group by pizza_size;

-- Total pizza sold by category
select pizza_category,sum(quantity) as Total_pizza_sold
from dominos_sales
group by pizza_category
order by total_pizza_sold desc;


-- Top 5 pizza by total_price
select top 5 pizza_name,sum(total_price) 
from dominos_sales
group by pizza_name
order by sum(total_price) desc;


-- Bottom 5 pizza by total_price
select top 5 pizza_name,sum(total_price) 
from dominos_sales
group by pizza_name
order by sum(total_price) asc;


-- Top 5 pizza by quantity
select top 5 pizza_name,sum(quantity) 
from dominos_sales
group by pizza_name
order by sum(quantity) desc;


-- Bottom 5 pizza by quantity
select top 5 pizza_name,sum(quantity) 
from dominos_sales
group by pizza_name
order by sum(quantity) asc;


-- Top 5 pizza by total_orders
select top 5 pizza_name,count(distinct order_id) 
from dominos_sales
group by pizza_name
order by count(distinct order_id)  desc;


-- Bottom 5 pizza by total_orders
select top 5 pizza_name,count(distinct order_id) 
from dominos_sales
group by pizza_name
order by count(distinct order_id)  asc;




