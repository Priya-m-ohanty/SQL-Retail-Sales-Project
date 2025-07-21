---SQL Retail Sales Analysis Project---

---Create Table

DROP TABLE IF EXISTS RetaisSales_TB;
CREATE TABLE RetailSales_TB(
               transactions_id	INT,
               sale_date DATE, 
               sale_time TIME,
			   customer_id	INT,
		       gender VARCHAR(20),
	           age	INT,
			   category VARCHAR(25),
               quantiy INT,
               price_per_unit FLOAT,
               cogs FLOAT,
               total_sale FLOAT
                  );

---Check If there is any Null Value exists---
SELECT * FROM RetailSales_TB
WHERE transactions_id IS NULL
OR sale_date IS NULL 
OR sale_time IS NULL 
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL 
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

---DELETE the rows having Null Value---
DELETE FROM RetailSales_TB
WHERE transactions_id IS NULL
OR sale_date IS NULL 
OR sale_time IS NULL 
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL 
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

----Data Exploration

SELECT COUNT (*) total_sale FROM RetailSales_TB;
SELECT DISTINCT category FROM RetailSales_TB;

---Data Analysis & Findings
---1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM RetailSales_TB
WHERE sale_date = '2022-11-05';
---2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**
SELECT * FROM RetailSales_TB
WHERE category = 'Clothing'
AND quantiy >= 4
AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'

---3.Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) AS net_sale,
COUNT (*) AS total_order FROM RetailSales_TB
GROUP BY 1;
---4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
SELECT ROUND(AVG(age),2) AS AVG_AGE_GRP FROM RetailSales_TB
WHERE category= 'Beauty';
---5.Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT * FROM RetailSales_TB
WHERE total_sale >= 1000;
---6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
SELECT category, gender, COUNT(*) AS total_trans
FROM RetailSales_TB
GROUP BY 1,2
ORDER BY 1;

---7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale FROM RetailSales_TB
	GROUP BY 1,2
	ORDER BY 1,3 DESC;
----8. Write a SQL query to find the top 5 customers based on the highest total sales
SELECT customer_id, SUM (total_sale) AS highest_sale FROM RetailSales_TB
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

---9. Write a SQL query to find the number of unique customers who purchased items from each category
SELECT category, COUNT (DISTINCT customer_id) AS unique_cx
FROM RetailSales_TB
GROUP BY 1;

SELECT * FROM RetailSales_TB;
---End Of Project 