# BussinessRulesForTimber
Programmers: Jerome Corpuz, Zeus Estrella, Sergio Valencia, Emmett Sparrow
<br>
Architecting an Optimized Oracle Database Solution and Generating Reports for an Ecommerce Platform


![page0001](https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/4e0e7c5a-57b9-480d-a776-0199b495c3dc)
![page0002](https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/e74b9606-887d-4c24-94a3-2f078d408dca)



<h2>Conceputal Model</h2> 

<img width="510" alt="Screen Shot 2023-06-14 at 1 27 02 PM" src="https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/9ca73282-2e27-48a4-a18d-a6df926fedb6">

1. Identifying relationships between entities 

<h2>Physical Model</h2> 

<img width="510" alt="Screen Shot 2023-06-14 at 1 27 02 PM" src="https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/339b4e33-43fc-4028-8c23-54c40b8b1619">



1. Breaking all many-to-many relationships into normalized one-to-many relationships by adding bridging table for improved data integrity and efficiency.

2. Determining Primary, Foreign Keys, attribues and attriute values, and constraints


<h2>Reports</h2> 


<h3>Report 1: <i>Customer report based on a specified city name</i></h3>

<img width="862" alt="Screen Shot 2023-06-17 at 5 25 17 PM" src="https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/15a10b23-154e-4a7c-baf6-ff0b41e5da39">               
              
<h4>The following steps are performed in the code:</h4> 

```sql
COLUMN ADDRESS FORMAT A30;
COLUMN CITY FORMAT A20;

accept cityInput char prompt 'Enter a City Name: ';

select customer_id, address, city, province, postal_code, phone_number, email_address
from brt_customer
WHERE city = '&input';
```
#### Code Analysis:

A SQL query is executed to retrieve customer information from brt_customer table based on the user's input regarding the city where customers reside 
<br>
<h3>Report 2: <i>Calculateing the average, minimum, and maximum prices for each category</i></h3>

<img width="510" alt="Screen Shot 2023-06-14 at 1 27 02 PM" src="https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/4c8fcd0a-06a1-4b46-9078-9a88fdf831a1">
               
              
<h4>The following output are performed in the code:</h4> 

```sql
SET LINESIZE 100
SET PAGESIZE 50

COLUMN "category_name" FORMAT A30
COLUMN "Average Price" FORMAT $9, 999.99
COLUMN "Min Price" FORMAT $9, 999.99
COLUMN "Max Price" FORMAT $9, 999.99

SELECT
    C.CATEGORY_NAME,
    AVG(P.PRICE) AS "Average Price",
    MIN(P.PRICE) AS "Min Price",
    MAX(P.PRICE) AS "Max Price"
FROM
    BRT_CATEGORY C
    JOIN BRT_PRODUCT P
    ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY
    C.CATEGORY_NAME
ORDER BY
    "Average Price";
```
#### Code Analysis:
1. The display format settings are configured using <b>SET</b> commands, such as <b>LINESIZE</b>, <b>PAGESIZE</b>, and <b>COLUMN</b> formats.

2. A SQL query is executed to retrieve the required attributes category name from BRT_Category table and its respective  prices from the brt_product table.

3. SQL aggregate functions <b>AVG</b>, <b>MIN</b>, <b>MAX</b> are used to find the average, minimum, and maximum prices for each category by joining the <b> BRT_CATEGORY </b> and <b> BRT_PRODUCT</b> tables and grouping the results by category.








