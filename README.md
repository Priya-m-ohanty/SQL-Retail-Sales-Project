# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: 'SQL_project_2'

This project is designed to demonstrate SQL skills and techniques typically used by business/data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for individuals starting their business or data analysis journey and seeking to establish a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `SQL_project_2`.
- **Table Creation**: A table named `RetaisSales_TB` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

---Check If there is any Null Value exists---
SELECT * FROM RetailSales_TB
WHERE transactions_id IS NULL
OR sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL
OR gender IS NULL OR age IS NULL OR category IS NULL OR quantiy IS NULL
OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT * FROM RetailSales_TB
WHERE category = 'Clothing'
AND quantiy >= 4
AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT category, SUM(total_sale) AS net_sale,
COUNT (*) AS total_order FROM RetailSales_TB
GROUP BY 1;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT ROUND(AVG(age),2) AS AVG_AGE_GRP FROM RetailSales_TB
WHERE category= 'Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT * FROM RetailSales_TB
WHERE total_sale >= 1000;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT category, gender, COUNT(*) AS total_trans
FROM RetailSales_TB
GROUP BY 1,2
ORDER BY 1;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale FROM RetailSales_TB
	GROUP BY 1,2
	ORDER BY 1,3 DESC;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT customer_id, SUM (total_sale) AS highest_sale FROM RetailSales_TB
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT category, COUNT (DISTINCT customer_id) AS unique_cx
FROM RetailSales_TB
GROUP BY 1;
```
10. 
```sql
SELECT * FROM RetailSales_TB;
```
---End Of Project

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data or Business analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can inform business decisions by providing insights into sales patterns, customer behavior, and product performance.


## Author - Priyadarsini Mohanty

This project is part of my portfolio, showcasing the SQL skills essential for Business or data analyst roles. If you have any questions, feedback, or would like to collaborate, please don't hesitate to get in touch.

- **LinkedIn**: [Connect with me professionally](www.linkedin.com/in/priyadarsini-mohanty-368b17159)

Thank you for your support, and I look forward to connecting with you!
