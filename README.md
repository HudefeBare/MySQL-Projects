# SQL Retail & Sales Analysis Project

Data Technician Bootcamp – Week 3 Project

## 🔍 Project Overview

This project was completed as part of a Data Technician bootcamp, focusing on developing strong foundational skills in SQL for querying, filtering, summarising and combining data.

Using the Northwind retail database and a World database (cities, countries and languages), the project demonstrates proficiency with SELECT, WHERE, ORDER BY, GROUP BY and table JOINs to analyse and extract insights from retail and sales data.

## 🚀 Skills & Techniques Used

### ✔️ Writing Queries

Applied a variety of SQL clauses to retrieve and shape data:

* SELECT / DISTINCT – Choosing columns and removing duplicate values
* WHERE – Filtering with =, !=, >, <, AND, OR, NOT, IN, BETWEEN and LIKE
* ORDER BY / LIMIT – Sorting results ascending or descending and returning the top rows
* Aliases (AS) – Giving columns and tables readable names
* Aggregate functions – COUNT(), SUM(), AVG(), MIN() and MAX()
* Subqueries – Using one query inside another to answer multi-step questions

### ✔️ Joining Tables

* INNER JOIN – Linking orders to customers, products to suppliers and products to categories
* Multi-table JOINs – Combining three or more tables in a single report (orders, customers and shippers)
* LEFT JOIN and RIGHT JOIN – Finding customers with no orders and employees with no orders
* CROSS JOIN – Producing every combination of two tables

### ✔️ Grouping & Summarising

* GROUP BY – Summarising data by category, product, country, city, employee and shipper
* COUNT with GROUP BY – Counting customers per country, orders per shipper and orders per employee
* SUM with JOIN – Total quantity sold per product and per category, and total sales value (quantity × price)

### ✔️ Project Tasks Completed

* Retrieving and filtering customer, product and order data from the Northwind database
* Sorting and limiting results to find top and bottom values
* Joining tables to link products with suppliers and categories, and orders with customers and employees
* Grouping data to count products per category and orders per employee
* Running queries on a World database to analyse cities, countries and population
* Running all queries in Supabase

## 📁 Included Outputs

* Northwind queries using SELECT, WHERE, ORDER BY, GROUP BY and JOINs
* World database queries on cities, countries and population
* Screenshots of the queries from the Week 3 workbook

## 🧠 Key Learning Outcomes

This project strengthened skills in:

* Writing SELECT queries with WHERE and ORDER BY
* Combining tables with INNER, LEFT, RIGHT and CROSS JOINs
* Summarising data with GROUP BY and aggregate functions
* Answering retail and sales questions with SQL
* Running and testing queries in Supabase

## 📸 Northwind DB

### SELECT & WHERE – High-Value Products

Query returning all products with a price greater than 50.

```sql
SELECT *
FROM products
WHERE price > 50;
```

### WHERE, AND, IN & ORDER BY – Local Marketing

Query returning customers in the USA from Portland or Kirkland, sorted by customer name.

```sql
SELECT *
FROM customers
WHERE country = ('USA') AND city IN ('Portland', 'Kirkland')
ORDER BY customername asc;
```

### INNER JOIN – Products and Categories

Query joining the categories and products tables on categoryid to show the category of each product.

```sql
SELECT categories.categoryname , products.productname
FROM categories
JOIN products
ON categories.categoryid = products.categoryid;
```

### JOIN & WHERE – 1996 Orders

Query joining orders to customers and filtering order dates to the year 1996.

```sql
SELECT orders.orderid, orders.orderdate, customers.customername
FROM orders
JOIN customers
ON orders.customerid = customers.customerid
WHERE orders.orderdate >= '1996-01-01'
AND orders.orderdate < '1997-01-01';
```

### JOIN & GROUP BY – Product Count by Category

Query joining categories to products and using COUNT with GROUP BY to count the products in each category.

```sql
SELECT categories.categoryname, COUNT(products.productid) AS product_count
FROM categories
JOIN products
ON categories.categoryid = products.categoryid
GROUP BY categories.categoryname;
```

### 💻 Key Query Examples

Total quantity sold per product:

```sql
SELECT p.productname, SUM(od.quantity) AS totalquantity
FROM products AS p
INNER JOIN order_details AS od
ON od.productid = p.productid
GROUP BY p.productname;
```

Total sales value per product, highest first:

```sql
SELECT p.productname, SUM(od.quantity * p.price) AS totalsales
FROM order_details AS od
JOIN products AS p ON od.productid = p.productid
GROUP BY p.productname
ORDER BY totalsales DESC;
```

Total quantity sold per category:

```sql
SELECT categoryname, SUM(quantity) AS totalproducts
FROM products AS p
JOIN categories AS c ON p.categoryid = c.categoryid
JOIN order_details AS od ON p.productid = od.productid
GROUP BY categoryname;
```

Number of orders handled by each employee:

```sql
SELECT e.firstname, e.lastname, COUNT(orderid) AS totalorders
FROM employees AS e
JOIN orders AS o ON e.employeeid = o.employeeid
GROUP BY e.firstname, e.lastname;
```

## 📸 World DB

### COUNT – Cities in the USA

Query counting the cities with country code USA. The result is 274.

```sql
SELECT count (*)
FROM city
WHERE countrycode = 'USA';
```

### GROUP BY – City Name Frequency

Query counting how often each city name appears, grouped by name and sorted A to Z.

```sql
SELECT name , count(*) as frequency
FROM city
GROUP by name
Order by name asc;
```

### JOIN – Cities in Europe

Query joining city to country on the country code and filtering to the continent Europe.

```sql
SELECT city.name
FROM city
JOIN country
ON city.countrycode = country.code
WHERE continent = 'Europe';
```
