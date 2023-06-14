# BussinessRulesForTimber
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

<img width="510" alt="Screen Shot 2023-06-14 at 1 27 02 PM" src="https://github.com/romylomy/BussinessRulesForTimber/assets/115190653/4c8fcd0a-06a1-4b46-9078-9a88fdf831a1">
               
              
<h4>The following steps are performed in the code:</h4> 

1. The display format settings are configured using <b>SET</b> commands, such as <b>LINESIZE</b>, <b>PAGESIZE</b>, and <b>COLUMN</b> formats.

2. A SQL query is executed to retrieve the required data from the tables.

3. The query calculates the average, minimum, and maximum prices for each category by joining the <b> BRT_CATEGORY </b> and <b> BRT_PRODUCT</b> tables and grouping the results by category.







