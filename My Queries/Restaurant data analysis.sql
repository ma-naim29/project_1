-- Exploring the menu_items table


-- View the menu_items table, find the number of items on the menu.

SELECT *
FROM 
	menu_items;



SELECT 
	count(*)
FROM 
	menu_items;


-- What are the least and most expensive items on the menu?

SELECT *
FROM 
	menu_items
ORDER BY 
	price
LIMIT 3;



SELECT *
FROM 
	menu_items
ORDER BY 
	price DESC
LIMIT 3;



-- What are the asian dishes on the menu? what are the least and most expensive asian dish on the menu?

SELECT 
	count(*)
FROM 
	menu_items
WHERE
	category = 'Asian';
    
    
    
SELECT *
FROM 
	menu_items
WHERE
	category = 'Asian'
ORDER BY 
	price
LIMIT 3; 



SELECT *
FROM menu_items
WHERE
	category = 'Asian'
ORDER BY 
	price DESC
LIMIT 3;



-- How many dishes are in each catagory? what is the average dish price in each catagory?

SELECT 
	category, 
    count(*) num_of_items 
FROM 
	menu_items
GROUP BY 
	category;
    
    
    
SELECT 
	category, 
    AVG(price) avg_price_per_category 
FROM 
	menu_items
GROUP BY 
	category;



-- Exploring the order_details table


-- View the order_details table, what is the date range of the table?

SELECT*
FROM 
	order_details;
  
  
  
SELECT 
	MIN(order_date) 1st_order_date,
	MAX(order_date) 2nd_order_date
FROM 
	order_details;



-- How many orders wear made within this date range? How many items were ordered within this date range?

SELECT DISTINCT order_id
FROM 
	order_details
ORDER BY 
	order_id;
    
    
    
SELECT DISTINCT order_id
FROM 
	order_details
ORDER BY 
	order_id DESC;
    
-- OR 

SELECT 
	COUNT(DISTINCT order_id) num_order 
FROM 
	order_details;
  
  
  
SELECT 
	COUNT(DISTINCT order_details_id) AS num_ordered_item
FROM 
	order_details;
    
    

-- Which order has the most number of items?

SELECT 
	order_id,
	count(item_id) num_order
FROM 
	order_details
GROUP BY
	order_id 
ORDER BY
	num_order desc;



-- How many orders had more than 12 items?

SELECT 
	order_id,
	count(item_id) num_order
FROM 
	order_details
GROUP BY
	order_id 
HAVING 
	num_order > 12;
                        
                        
    
    
WITH order_num AS (SELECT 
						order_id,
						count(item_id) num_order
					FROM 
						order_details
					GROUP BY
						order_id 
					HAVING 
						num_order > 12)
SELECT COUNT(order_id) from order_num;



-- Analyze customer behaviour


-- Combine the menu_items and order_details tables

SELECT*
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id;

	
 
-- What are the least and most ordered items, what categories were they in?
SELECT 
	item_name,
    category,
	COUNT(item_id) AS num_order
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
GROUP BY 
	item_name,
    category
ORDER BY 
	num_order;
    
    
    
SELECT 
	item_name,
	category,
	COUNT(item_id) AS num_order
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
GROUP BY 
	item_name,
    category
ORDER BY 
	num_order DESC;
    
    

-- what were the top 5 orders that spent the most money?

SELECT
	SUM(price) AS price_per_order,
    order_id
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
GROUP BY
	order_id
HAVING
	price_per_order IS NOT NULL
ORDER BY
	price_per_order;



SELECT
	SUM(price) AS price_per_order,
    order_id
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
GROUP BY
	order_id
having 
	price_per_order = 5.00
ORDER BY
	price_per_order;
-- The least spent order was 5.00$, so i wanted to see how many orders spent the least amount.


WITH lowest_spent_orders AS (SELECT
								SUM(price) AS price_per_order,
								order_id
							FROM
								order_details AS od
							LEFT JOIN
								menu_items AS mi
							ON 
								mi.menu_item_id = od.item_id
							GROUP BY
								order_id
							having 
								price_per_order = 5.00
							ORDER BY
								price_per_order)
                                
SELECT COUNT(*)
FROM lowest_spent_orders;

    
    
SELECT
	SUM(price) AS price_per_order,
	order_id
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
GROUP BY
	order_id
ORDER BY
	price_per_order DESC
LIMIT 5;



-- View the details of the top 5 highest spent orders, and what insights can you gather from the results?

SELECT 
	category,
    COUNT(category) AS num_items
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
WHERE 
	order_id = 440
GROUP BY 
	category;

-- this customer ordered (8) Italian items the most, followed by 2, 2 and 2 American, Mexican and  Asian dishes.



SELECT 
	order_id,
	category,
    COUNT(category) AS num_items
FROM
	order_details AS od
LEFT JOIN
	menu_items AS mi
ON 
	mi.menu_item_id = od.item_id
WHERE 
	order_id IN (440,2075,1957,330,2675)
GROUP BY 
	category,
	order_id
-- TOP 5 highest spent customers all seem to like Italian dishes the most, so we should definitely keep them on the menu.