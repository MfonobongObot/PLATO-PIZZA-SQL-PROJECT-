 
 --Total Revenue Generated-----
 SELECT SUM(REVENUE) AS Revenue
 FROM order_details
 ----Answer =  817,860

----Total orders placed------
 SELECT COUNT (DISTINCT order_id) as Total_Orders_Placed
 FROM order_details
 ----Answer =  21,350
 
 ----Total quantity Sold-----
 SELECT sum(quantity) as Total_Quantity_Sold
 FROM order_details
 ----Answer =  49,574
 
 ----Average Order Value------
 SELECT ROUND(SUM(REVENUE)/COUNT(DISTINCT ORDER_ID),2) AS  Average_Orders_Value
 FROM order_details
 ----Answer =  38.31
 
 ----Average Order per Day------
 SELECT COUNT(Order_id)/Count (Distinct date) as Daily
 FROM orders
 ----Answer = 59 

  ----Average Amount of pizza made per Day in a week------
 SELECT orders.Days, sum(order_details.quantity)/Count (Distinct date) as Average_pizza_order_per_day
 FROM orders
 JOIN order_details ON order_details.order_id = orders.order_id
 GROUP BY orders.Days
 ORDER BY Average_pizza_order_per_day DESC
 ----Answer = Friday has an average of 164,saturday and thursday had 144 and 143 respectively, while sunday had 116
 ----Monday had 135,Tuesday had 132 and wednesday had 133

----Average Amount of orders placed per Day in a week------
 SELECT orders.Days, COUNT(orders.order_id)/ Count(Distinct date) as Average_order_per_day
 FROM orders
 GROUP BY orders.Days
 ORDER BY Average_order_per_day DESC
 ----Answer = Friday has an average order of 70,Saturday and Thursday had 60 and 62 respectively, while Sunday had 50
 ----Monday and wednesday had 58,Tuesday had 57.
  

----Average Amount of pizza placed per Day in a month------
 SELECT orders.month, sum(order_details.quantity)/Count (Distinct date) as Average_pizza_order_per_day
 FROM orders
 JOIN order_details ON order_details.order_id = orders.order_id
 GROUP BY orders.month
 ORDER BY Average_pizza_order_per_day DESC
 ----Answer = The month of November and October had an average of 143 and 142 pizza solded respectively
 ----while the month with the lowest average pizza placed was in December with 131 pizza.

 -----The Day with the Highest No of Order---------
SELECT TOP 1 count(orders.order_id)AS No_of_Orders, orders.Days
FROM orders
GROUP BY orders.Days
ORDER BY No_of_Orders DESC
----Answer = friday has the highest number of orders with total orders of 3538----

-----The Day with the lowest No of Order---------
SELECT TOP 1 count(orders.order_id)AS No_of_Orders, orders.Days
FROM orders
GROUP BY orders.Days
ORDER BY No_of_Orders 
----Answer = Sunday has the highest number of orders with total orders of 2624----


---What the highest no of pizza in an order----
SELECT TOP 1  order_id,SUM(quantity) AS quantity
FROM order_details
GROUP BY order_id
ORDER BY quantity DESC
--Answer = The highest number of pizza in an order 28 pizza with order_id 18845----

----TOP 3 Month with the Most Quantity sold------
SELECT TOP 3 orders.month,SUM(order_details.Quantity) AS Total_Quantity
FROM orders
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY orders.month
ORDER BY total_Quantity DESC
----- Answer Month     Total_Quantity
 ----        July	 	        4392
-----        May	 	        4328
-----        March	 	        4261

----TOP 3 Month that Generated the most Revenue------
SELECT TOP 3 orders.month,ROUND(SUM(order_details.REVENUE),0) AS Revenue
FROM orders
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY orders.month
ORDER BY Revenue DESC
----Answer The month of July and May genrated 72,558 and 71,403 respectively while March generated 70397--


----Pizza that Generated the Highest Revenue----
 SELECT TOP 3 pizza_types.pizza_type_id,pizza_types.name, SUM (order_details.REVENUE) as Total_Revenue
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.pizza_type_id,pizza_types.name
ORDER BY Total_Revenue DESC
--- Answer = Name                     Total_Revenue
 ----        The Thai Chicken Pizza       43,434
-----        The Barbecue Chicken Pizza   42,768
-----       The California Chicken Pizza  41,409

----Pizza that generated the Lowest Revenue----
 SELECT TOP 3 pizza_types.pizza_type_id,pizza_types.name, SUM (order_details.REVENUE) as Total_Revenue
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.pizza_type_id,pizza_types.name
ORDER BY Total_Revenue 
--- Answer = Name                     Total_Revenue
 ----        The Spinach Supreme Pizza    15,277.75
-------------The Green Garden Pizza       13,955.75
------------ The Brie Carre Pizza         11,588.49
-----        

----Best 3 Quantity of pizza by  Pizza Type--------
 SELECT TOP 3 pizza_types.pizza_type_id,pizza_types.name, SUM (order_details.quantity) as Total_Quantity
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.pizza_type_id,pizza_types.name
ORDER BY Total_Quantity DESC
----Answer = The Classic Deluxe Pizza, total quantity sold of 2453 pizzas------
-----        The Barbecue chicken Pizza,total quantity sold 2432 pizzas
-----        The Hawaiian Pizza,total quantity sold 2422 pizzas

-----Least 3 Quantity of pizza by  Pizza Type--------
SELECT TOP 3 pizza_types.pizza_type_id,pizza_types.name, SUM (order_details.quantity) as Total_Quantity
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.pizza_type_id,pizza_types.name
ORDER BY Total_Quantity 
----Answer = The Calabrese Pizza,total quantity sold 937 pizzas
 ------------The Mediterranean Pizza,total quantity sold 934 pizzas
-------------The Brie Carre Pizza, total quantity sold of 490 pizzas------      

-----Best Quantity of Pizza sold by size  -------
SELECT TOP 1 pizzas.pizza_id, pizza_types.name, pizzas.size, COUNT(pizzas.size) as Total_Quantity_by_size
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizzas.pizza_id,pizza_types.name,pizzas.size
ORDER BY Total_Quantity_by_size DESC
----Answer = The Big Meat Pizza small size with a total quantity of 1811 pizza sold------

-----Least Quantity of Pizza sold by size -------
SELECT TOP 1 pizzas.pizza_id, pizza_types.name, pizzas.size, count(pizzas.size) as Total_Quantity_by_size
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizzas.pizza_id,pizza_types.name,pizzas.size
ORDER BY Total_Quantity_by_size 
----Answer = The Greek Pizza XXL size with a total quantity of 28 pizza sold------

-----Quantity sold by pizza category-----
SELECT pizza_types.category, sum(order_details.quantity) as Total_Quantity
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.category
ORDER BY Total_Quantity DESC
-----Answer = Classic =	14888, Supreme = 11987, Veggie = 11649, Chicken = 11050
-----Classic pizza type had the highest while Chicken pizza type had the lowest quantity sold

-----The most sold pizza in each by pizza_type category-----
SELECT pizza_types.name , pizza_types.category, sum(order_details.quantity) as Total_Quantity
 FROM pizza_types
 JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.name, pizza_types.category
ORDER BY Total_Quantity DESC
-----Answer = The Classic Deluxe Pizza in Classic Category with 2453 pieces sold
-----         The Barbecue Chicken pizza in Chicken Categoy with 2432 pieces sold 
-----         The Sicilian pizza in Supreme Category with 1938 pieces sold
---           The Four Cheese pizza in the Veggie Category with 1902 pieces sold

---Date with the most pizza sale------
SELECT orders.date,orders.Days,sum(order_details.quantity) AS Total_Quantity, ROUND(sum(order_details.REVENUE),0) as Total_Sales, COUNT(order_details.order_id) AS Total_order
FROM orders
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY orders.date,orders.Days
ORDER BY total_sales
 ----Answer = November 27th had the highest no of sale with a total sale of 4,422 and a total order of 259 selling 264 pizza-----

----Busiest time(peak hours)------
SELECT orders.time,sum(order_details.quantity) AS total_quantity, SUM(order_details.REVENUE) AS Revenue
FROM orders
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY orders.time
ORDER BY total_quantity DESC
----Answer = The Busiest hours are between 12:00hr - 13:00hr ----

----No of orders taken during the busiest time period---------
SELECT orders.time,count(order_details.order_id) AS total_Orders
FROM orders
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY orders.time
ORDER BY total_Orders DESC
----Answer = The orders taken at the busiest hour is about 198 orders ----


