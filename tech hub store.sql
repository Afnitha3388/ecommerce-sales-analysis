
/*
=============================================================================
PROJECT : E-Commerce Sales Performance Analysis
ANALYST : Afnitha Kareem
DATE: February 2026
DATABASE: PostgreSQL
=============================================================================

BUSINESS PROBLEM:
TechHub electronics store (Germany) experiencing sales decline in January 2025.
Management needs to understand customer behavior, product performance, and 
sales trends to make strategic decisions.

KEY QUESTIONS:
1. Which customers are most valuable?
2. Which products are performing well or failing?
3. Are discounts working or losing money?
4. Should we focus on new or existing customers?

DATASET: Oct 2024 - Jan 2025 (50 orders, 30 customers, 15 products)
TOOLS: PostgreSQL
=============================================================================
*/

-- ============================================================
-- DATABASE SETUP
-- ============================================================

CREATE TABLE customers(
 customer_id int primary key,
 customer_name varchar(25),
 city varchar(20),
 registration_date date,
 customer_segment varchar(20)
)

create table products(
 product_id int primary key,
 product_name varchar(20),
 category varchar(20),
 price float
)

create table orders(
 order_id int primary key,
 customer_id int,
 order_date date,
 total_amount float,
 discount_applied float,
 foreign key (customer_id) references customers(customer_id)
)

create table order_items(
 order_item_id int,
 order_id int,
 product_id int,
 quantity int,
 price_per_unit float
)

INSERT INTO customers values 
(1, 'Anna Schmidt', 'Berlin', '2024-01-15', 'Premium'),
(2, 'Michael Weber', 'Munich', '2024-02-20', 'Regular'),
(3, 'Sarah Klein', 'Hamburg', '2024-01-10', 'Premium'),
(4, 'Thomas Mueller', 'Frankfurt', '2024-03-15', 'Regular'),
(5, 'Laura Wagner', 'Berlin', '2024-02-01', 'Regular'),
(6, 'Daniel Fischer', 'Munich', '2024-04-10', 'Premium'),
(7, 'Julia Becker', 'Hamburg', '2024-01-25', 'Regular'),
(8, 'Markus Schulz', 'Frankfurt', '2024-05-05', 'Premium'),
(9, 'Lisa Meyer', 'Berlin', '2024-03-20', 'Regular'),
(10, 'Sebastian Koch', 'Munich', '2024-02-15', 'Regular'),
(11, 'Nina Hoffmann', 'Hamburg', '2024-06-01', 'Premium'),
(12, 'Jan Schröder', 'Frankfurt', '2024-04-20', 'Regular'),
(13, 'Emma Zimmermann', 'Berlin', '2024-05-15', 'Premium'),
(14, 'Felix Braun', 'Munich', '2024-03-10', 'Regular'),
(15, 'Sophie Lange', 'Hamburg', '2024-07-01', 'Regular'),
(16, 'Lukas Schmitt', 'Frankfurt', '2024-06-15', 'Premium'),
(17, 'Marie Krüger', 'Berlin', '2024-08-01', 'Regular'),
(18, 'Jonas Hartmann', 'Munich', '2024-07-20', 'Regular'),
(19, 'Lena Werner', 'Hamburg', '2024-09-01', 'Premium'),
(20, 'David Engel', 'Frankfurt', '2024-08-15', 'Regular'),
(21, 'Hannah Peters', 'Berlin', '2024-10-01', 'Premium'),
(22, 'Paul Richter', 'Munich', '2024-09-20', 'Regular'),
(23, 'Mia Kaiser', 'Hamburg', '2024-11-01', 'Regular'),
(24, 'Leon Möller', 'Frankfurt', '2024-10-15', 'Premium'),
(25, 'Emily Böhm', 'Berlin', '2024-12-01', 'Regular'),
(26, 'Noah König', 'Munich', '2024-11-15', 'Premium'),
(27, 'Sophia Ludwig', 'Hamburg', '2024-12-20', 'Regular'),
(28, 'Ben Wolf', 'Frankfurt', '2024-01-05', 'Regular'),
(29, 'Clara Frank', 'Berlin', '2025-01-10', 'Premium'),
(30, 'Tim Vogel', 'Munich', '2025-01-15', 'Regular')


insert into products values
(101, 'Laptop Pro 15', 'Laptops', 1299.99),
(102, 'Laptop Basic 14', 'Laptops', 599.99),
(103, 'Wireless Mouse', 'Accessories', 29.99),
(104, 'Mechanical Keyboard', 'Accessories', 89.99),
(105, 'USB-C Hub', 'Accessories', 49.99),
(106, 'Monitor 27inch 4K', 'Monitors', 399.99),
(107, 'Monitor 24inch FHD', 'Monitors', 179.99),
(108, 'Webcam HD', 'Accessories', 79.99),
(109, 'Headphones Bluetooth', 'Audio', 149.99),
(110, 'Speakers Wireless', 'Audio', 99.99),
(111, 'External SSD 1TB', 'Storage', 129.99),
(112, 'External HDD 2TB', 'Storage', 79.99),
(113, 'Graphics Tablet', 'Accessories', 199.99),
(114, 'Desk Lamp LED', 'Office', 39.99),
(115, 'Ergonomic Chair', 'Office', 299.99)

insert into orders values 
(2001, 1, '2024-10-05', 1329.98, 5.00),
(2002, 2, '2024-10-08', 629.98, 0.00),
(2003, 3, '2024-10-12', 1499.98, 10.00),
(2004, 4, '2024-10-15', 119.98, 0.00),
(2005, 5, '2024-10-18', 399.99, 0.00),
(2006, 1, '2024-10-22', 179.98, 5.00),
(2007, 6, '2024-10-25', 1699.97, 15.00),
(2008, 7, '2024-10-28', 209.97, 0.00),
(2009, 8, '2024-11-01', 1449.97, 10.00),
(2010, 3, '2024-11-03', 299.98, 5.00),
(2011, 9, '2024-11-05', 89.99, 0.00),
(2012, 10, '2024-11-08', 599.99, 0.00),
(2013, 11, '2024-11-10', 1329.98, 10.00),
(2014, 2, '2024-11-12', 129.99, 0.00),
(2015, 12, '2024-11-15', 479.97, 5.00),
(2016, 13, '2024-11-18', 1299.99, 10.00),
(2017, 4, '2024-11-20', 199.98, 0.00),
(2018, 14, '2024-11-22', 79.99, 0.00),
(2019, 15, '2024-11-25', 399.99, 0.00),
(2020, 6, '2024-11-27', 149.99, 5.00),
(2021, 16, '2024-11-28', 1699.96, 15.00),
(2022, 7, '2024-12-01', 299.97, 0.00),
(2023, 17, '2024-12-03', 599.99, 0.00),
(2024, 8, '2024-12-05', 229.98, 5.00),
(2025, 18, '2024-12-08', 1299.99, 10.00),
(2026, 19, '2024-12-10', 449.97, 5.00),
(2027, 1, '2024-12-12', 179.99, 5.00),
(2028, 20, '2024-12-15', 89.99, 0.00),
(2029, 21, '2024-12-18', 1599.97, 15.00),
(2030, 3, '2024-12-20', 299.98, 5.00),
(2031, 22, '2024-12-22', 129.99, 0.00),
(2032, 23, '2024-12-25', 399.99, 0.00),
(2033, 11, '2024-12-27', 1329.98, 10.00),
(2034, 24, '2024-12-28', 699.98, 10.00),
(2035, 6, '2024-12-29', 149.99, 5.00),
(2036, 25, '2024-12-30', 599.99, 0.00),
(2037, 13, '2025-01-02', 89.99, 0.00),
(2038, 26, '2025-01-04', 1299.99, 10.00),
(2039, 8, '2025-01-05', 179.99, 0.00),
(2040, 27, '2025-01-07', 399.99, 0.00),
(2041, 2, '2025-01-08', 49.99, 0.00),
(2042, 28, '2025-01-10', 299.99, 0.00),
(2043, 16, '2025-01-12', 1599.97, 15.00),
(2044, 29, '2025-01-15', 1329.98, 10.00),
(2045, 4, '2025-01-16', 129.99, 0.00),
(2046, 14, '2025-01-18', 79.99, 0.00),
(2047, 30, '2025-01-20', 599.99, 0.00),
(2048, 9, '2025-01-22', 399.99, 0.00),
(2049, 19, '2025-01-23', 229.98, 5.00),
(2050, 5, '2025-01-25', 149.99, 0.00)

insert into order_items values
(3001, 2001, 101, 1, 1299.99),
(3002, 2001, 103, 1, 29.99),
(3003, 2002, 102, 1, 599.99),
(3004, 2002, 103, 1, 29.99),
(3005, 2003, 101, 1, 1299.99),
(3006, 2003, 106, 1, 399.99),
(3007, 2004, 104, 1, 89.99),
(3008, 2004, 103, 1, 29.99),
(3009, 2005, 106, 1, 399.99),
(3010, 2006, 107, 1, 179.99),
(3011, 2007, 101, 1, 1299.99),
(3012, 2007, 106, 1, 399.99),
(3013, 2008, 110, 2, 99.99),
(3014, 2009, 101, 1, 1299.99),
(3015, 2009, 109, 1, 149.99),
(3016, 2010, 115, 1, 299.99),
(3017, 2011, 104, 1, 89.99),
(3018, 2012, 102, 1, 599.99),
(3019, 2013, 101, 1, 1299.99),
(3020, 2013, 103, 1, 29.99),
(3021, 2014, 111, 1, 129.99),
(3022, 2015, 106, 1, 399.99),
(3023, 2015, 112, 1, 79.99),
(3024, 2016, 101, 1, 1299.99),
(3025, 2017, 110, 2, 99.99),
(3026, 2018, 112, 1, 79.99),
(3027, 2019, 106, 1, 399.99),
(3028, 2020, 109, 1, 149.99),
(3029, 2021, 101, 1, 1299.99),
(3030, 2021, 106, 1, 399.99),
(3031, 2022, 115, 1, 299.99),
(3032, 2023, 102, 1, 599.99),
(3033, 2024, 109, 1, 149.99),
(3034, 2024, 112, 1, 79.99),
(3035, 2025, 101, 1, 1299.99),
(3036, 2026, 106, 1, 399.99),
(3037, 2026, 105, 1, 49.99),
(3038, 2027, 107, 1, 179.99),
(3039, 2028, 104, 1, 89.99),
(3040, 2029, 101, 1, 1299.99),
(3041, 2029, 115, 1, 299.99),
(3042, 2030, 115, 1, 299.99),
(3043, 2031, 111, 1, 129.99),
(3044, 2032, 106, 1, 399.99),
(3045, 2033, 101, 1, 1299.99),
(3046, 2033, 103, 1, 29.99),
(3047, 2034, 102, 1, 599.99),
(3048, 2034, 110, 1, 99.99),
(3049, 2035, 109, 1, 149.99),
(3050, 2036, 102, 1, 599.99),
(3051, 2037, 104, 1, 89.99),
(3052, 2038, 101, 1, 1299.99),
(3053, 2039, 107, 1, 179.99),
(3054, 2040, 106, 1, 399.99),
(3055, 2041, 105, 1, 49.99),
(3056, 2042, 115, 1, 299.99),
(3057, 2043, 101, 1, 1299.99),
(3058, 2043, 115, 1, 299.99),
(3059, 2044, 101, 1, 1299.99),
(3060, 2044, 103, 1, 29.99),
(3061, 2045, 111, 1, 129.99),
(3062, 2046, 112, 1, 79.99),
(3063, 2047, 102, 1, 599.99),
(3064, 2048, 106, 1, 399.99),
(3065, 2049, 109, 1, 149.99),
(3066, 2049, 112, 1, 79.99),
(3067, 2050, 109, 1, 149.99)

/*
BUSINESS QUESTION: Which customers are most valuable?
SKILLS: JOIN, GROUP BY, SUM, COUNT, AVG, CASE WHEN
*/


 select c.customer_name,
  round((sum(o.total_amount))::numeric,2) as total_spent,
  count(distinct o.order_id) as total_orders,
  round((sum(o.total_amount)/ count(distinct o.order_id))::numeric,2) as avg_order_value,
  case 
   when sum(o.total_amount) > 1000 then 'High Value'
   when sum(o.total_amount) between 500 and 1000 then 'Medium Value'
   else 'Low Value'
  end as customer_value
 from customers c
 left join orders o
 on c.customer_id = o.customer_id
 group by c.customer_name
 order by total_spent desc


/*
INSIGHTS:
- High Value (>€1000): 11 customers (37%) generate 71% of revenue
- Medium Value (€500-€1000): 9 customers (30%)
- Low Value (<€500): 10 customers (33%) generate only 11% of revenue
ACTION: Create VIP program for top 11 customers, upsell campaign for low value
*/

-- ============================================================
-- QUESTION 2: Product Performance Ranking
-- ============================================================
/*
BUSINESS QUESTION: Which products generate most revenue?
SKILLS: JOIN, GROUP BY, SUM, RANK() WINDOW FUNCTION, HAVING
*/

select p.product_name,
 round((sum(i.quantity*i.price_per_unit))::numeric,2) as total_revenue,
 sum(i.quantity) as total_quantity_sold,
 rank() over(order by sum(i.quantity*i.price_per_unit) desc) as rank
from order_items i
left join products p
on i.product_id = p.product_id
group by product_name
having sum(i.quantity*i.price_per_unit) > 500
order by total_revenue desc

/*
INSIGHTS:
- Laptop Pro 15: €16,899 (57% of total revenue) - Star product!
- Top 3 products (2 Laptops + 1 Monitor) = 83% of revenue
- Monitor 24inch FHD barely above threshold (€539) - consider discontinuing
ACTION: Focus marketing on laptops, bundle Monitor 24" with laptops
*/


-- ============================================================
-- QUESTION 3: Monthly Sales Trend
-- ============================================================
/*
BUSINESS QUESTION: How are sales trending month over month?
SKILLS: DATE functions, CTE, LAG() WINDOW FUNCTION, % calculation
*/

with sales_metrics as (
 select extract (month from order_date) as month,
  extract (year from order_date) as year,
  sum(total_amount) as total_sales,
  count(distinct order_id) as number_of_orders
 from orders
 group by extract (month from order_date),extract(year from order_date) 
 )
select month,
 round((total_sales)::numeric,2) as total_sales,
 number_of_orders,
 round((( total_sales - lag(total_sales) over (order by year, month) ) *100 /
   lag(total_sales) over (order by year, month))::numeric,2) as sales_difference
from sales_metrics
order by year asc
/*
INSIGHTS:
- Oct→Nov: +35.26% (strong growth!)
- Nov→Dec: +1.83% (stable, holiday peak)
- Dec→Jan: -18.18% (post-holiday slump)
ACTION: Launch January promotion to prevent seasonal slump
*/

-- ============================================================
-- QUESTION 4: Discount Effectiveness Analysis
-- ============================================================
/*
BUSINESS QUESTION: Are discounts helping or hurting revenue?
SKILLS: CASE WHEN grouping, GROUP BY, aggregations
*/

select 
 case 
  when discount_applied = 0 then  'No Discount'
  when discount_applied between 1 and 5 then 'Small Discount'
  when discount_applied between 6 and 10 then 'Medium Discount'
  when discount_applied > 10 then'Large Discount'
 end as discount_type,
 round((sum(total_amount))::numeric,2) as total_revenue,
 count(distinct order_id) as number_of_orders,
 round((sum(total_amount) / count(distinct order_id))::numeric,2) as avg_order_value
from orders
group by 
 case 
  when discount_applied = 0 then  'No Discount'
  when discount_applied between 1 and 5 then 'Small Discount'
  when discount_applied between 6 and 10 then 'Medium Discount'
  when discount_applied > 10 then'Large Discount'
 end
order by total_revenue desc

/*
INSIGHTS:
- Medium discount (6-10%): highest revenue, avg €1,282 per order
- Large discount (>10%): risky - only 4 orders, giving away margin
- No discount: 26 orders but lowest avg value (€283)
ACTION: Cap discounts at 10%, focus medium discounts on premium products
*/

-- ============================================================
-- QUESTION 5: Customer Retention Analysis
-- ============================================================
/*
BUSINESS QUESTION: Who are our at-risk customers?
SKILLS: CTE, MIN/MAX dates, COUNT, CASE WHEN, COUNT OVER PARTITION BY
*/

WITH customer_metrics AS (
  SELECT
    c.customer_name,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS last_order_date,
    MAX(o.order_date) - MIN(o.order_date) AS days_between_first_and_last_order,
    CASE 
      WHEN COUNT(DISTINCT o.order_id) = 1 THEN 'New'
      WHEN MAX(o.order_date) >= '2025-01-01' THEN 'Active'
      WHEN MAX(o.order_date) < '2025-01-01'
           AND COUNT(DISTINCT o.order_id) > 1 THEN 'At Risk'
    END AS customer_label
  FROM customers c
  LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
  GROUP BY c.customer_name
)
SELECT
  customer_name,
  first_order_date,
  last_order_date,
  days_between_first_and_last_order,
  customer_label,
  COUNT(*) OVER (PARTITION BY customer_label) AS number_of_customers
FROM customer_metrics
ORDER BY customer_label, days_between_first_and_last_order ASC;

/*
INSIGHTS:
- New customers: 53.3% (16 customers) - acquisition is working!
- Active customers: 30% (9 customers) - good retention
- At Risk: 16.7% (5 customers) - need re-engagement!
ACTION: Send "We miss you" campaign to at-risk customers with special offer
*/

-- ============================================================
-- QUESTION 6: City-wise Performance
-- ============================================================
/*
BUSINESS QUESTION: Which cities generate most revenue?
SKILLS: JOIN, GROUP BY, RANK() WINDOW FUNCTION
*/

select c.city,
 round(sum(o.total_amount)::numeric,2) as total_revenue,
 count(distinct c.customer_id) as number_of_customers,
 round((sum(o.total_amount) /  count(distinct c.customer_id))::numeric,2) as avg_revenue,
 rank() over(order by sum(o.total_amount) desc ) as city_rank
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.city

/*
INSIGHTS:
- Berlin: €8,249 (28% of total revenue) - top city!
- Munich: Same customers as Berlin but lower revenue (23%)
ACTION: Focus marketing in Berlin, investigate Munich underperformance
*/

-- ============================================================
-- QUESTION 7: Product Category Analysis with CTE
-- ============================================================
/*
BUSINESS QUESTION: Which product categories drive most revenue?
SKILLS: Multiple CTEs, JOIN, percentage calculation
*/

with product_revenue as( 
 select p.product_name,
  p.category,
  round(sum(i.quantity*i.price_per_unit)::numeric,2) as total_product_revenue
 from products p
 join order_items i
 on p.product_id = i.product_id
 group by p.product_name, p.category
),
category_revenue as (
 select p.category,
  round(sum(i.quantity * i. price_per_unit)::numeric,2) as total_category_revenue
 from products p
 right join order_items i
 on p.product_id = i.product_id
 group by category
 )
 select pr.product_name,
  pr.total_product_revenue,
  pr.category,
  cr.total_category_revenue,
  round((cr.total_category_revenue * 100/ 29479.17)::numeric,2) as category_contribution_to_total_revenue
from product_revenue pr
join category_revenue cr 
on pr.category = cr.category
order by pr.total_product_revenue desc,
  cr.total_category_revenue desc

/*
INSIGHTS:
- Laptops: 69.54% of revenue (heavily dependent!)
- Monitors: 15.40% (secondary category)
- Accessories: only 2.17% (huge upsell opportunity!)
ACTION: Bundle accessories with laptops, reduce dependency on single category
*/
  
-- ============================================================
-- QUESTION 8: Cross-Sell Pattern Analysis
-- ============================================================
/*
BUSINESS QUESTION: Which customers buy laptops AND accessories together?
SKILLS: Multiple CTEs, JOINs, STRING_AGG, complex filtering
*/


with laptop_orders as (
 select distinct i.order_id
 from order_items i
 join products p
 on i.product_id = p.product_id
 where p.category = 'Laptops' 
),   
accessories_orders as (
 select distinct i.order_id
 from order_items i
 join products p
 on i.product_id = p.product_id
 where p.category = 'Accessories'
),
matching_orders as (
 select lo.order_id
 from laptop_orders lo
 join accessories_orders ao
 on lo.order_id = ao.order_id
)
select c.customer_name,
 o.order_id,
 o.order_date,
 string_agg(p.product_name, ', ' order by p.product_name) as products_bought
from matching_orders mo
join orders o on mo.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
join order_items i on o.order_id = i.order_id
join products p on i.product_id = p.product_id
group by c.customer_name, o.order_date, o.order_id 
order by o.order_date

/*
INSIGHTS:
- 5 orders had laptop + accessory combination
- Wireless Mouse is most commonly bundled with laptops
- Natural cross-sell pattern exists!
ACTION: Create "Complete your setup" bundle offer (Laptop + Mouse + Keyboard)
        Recommend accessories automatically when laptop is added to cart
*/









 