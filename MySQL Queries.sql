-- activate database
use northwind;

select what to bring
from where to find

-- Bring all customers info
select *
from customers;

-- All product
select *
from products;

-- * means grab everything
SELECT * 
fRom products;

select customername, city, country
from customers;


SELECT ProductID, ProductName 
FROM Products;

SELECT productid, ProductName 
FROM Products;

SELECT Country FROM Customers;

-- Name of different countries
SELECT DISTINCT Country 
FROM Customers;

-- number of countries
select count(distinct country)
from customers;

-- Note: Count function returns number of rows.

--  Write an SQL query to return these details from the Employees table.
SELECT FirstName, LastName, BirthDate FROM employees; 


-- Write an SQL query to retrieve this information from the Customers table.
SELECT CustomerName, address, city FROM customers;


-- Write an SQL query to return all unique city names from the Suppliers table.
SELECT DISTINCT City FROM Suppliers;


-- Write an SQL query to count the number of distinct cities in the Customers table.
select count(distinct city) from Customers;


SELECT FirstName, LastName, BirthDate FROM employees;

Select *
from customers
where country = "UK";

Select *
from customers
where country = 'UK';

SELECT * FROM Products
WHERE ProductID =1;

select * 
from customers
where city = "London";

select productname, price
from products
where price >50;

select productname, price
from products
where price <= 5;

SELECT * FROM Orders
WHERE OrderDate > '1996-07-30';

select productname, price
from products
where price !=10;

select productname, price
from products
where price <>10;

-- Write an SQL query to return all customers from London.
select * 
from customers
where city = "London";

-- Write an SQL query to return the number of customers from the USA.
select count(country) from customers where country = "USA";

-- Write an SQL query to return all customers whose CustomerID is equal to or greater than 15.
 select * from customers where customerid >= 15;


SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';

SELECT * FROM Suppliers
WHERE Country = 'Japan' AND City = 'Tokyo';


SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'Stuttgart';

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

-- Write SQL query to return customers from UK but not from London
select customername, city, country
from customers
where country = "UK" and City != "London";

select customername, city, country
from customers
where country = "UK" and not City = "London";

select *
from customers
where Customername LIKE "a%";

select *
from customers
where Customername LIKE "%a";

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers
WHERE CustomerName LIKE '%food%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';


SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

select * from suppliers where country like "%land%";

SELECT * FROM Employees WHERE FirstName LIKE '_n%';


select *
from customers
where country= "UK" or country= "Germany" or country= "France";  

select *
from customers
where country in ("UK", "Germany", "France");


SELECT * FROM Customers
WHERE Country IN (SELECT country FROM Suppliers);
-- this query return customers who are in same country as suppliers
-- SELECT country FROM Suppliers name of country of suppliers


select * 
from products
where price >=5 and price <=10;

select * 
from products
where price between 5 and 10;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;
 
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni';

select *
from customers
order by country;

select *
from products
order by price;

select *
from customers
order by country desc;

select *
from products
order by price desc;

select country, customername
from customers
order by country, customername;

select country, customername
from customers
order by country, customername
limit 3; 

SELECT * FROM Products
ORDER BY PRICE 
LIMIT 5;

select * FROM Customers
WHERE Country='Germany'
LIMIT 3;

select min(price)
from products;

select max(price)
from products;

select avg(price)
from products;

select min(city)
from suppliers;

select max(city)
from suppliers;

-- how many product categories are there?
select count(*)
from categories;

SELECT SUM(Quantity)
FROM Order_Details;

-- Write an SQL query to find the customer with the latest OrderDate in the Orders table.
SELECT CustomerID, OrderDate FROM Orders 
WHERE OrderDate = (SELECT MAX(OrderDate) FROM Orders);

select CustomerID, OrderDate FROM Orders
order by orderdate desc
limit 1;


-- Write an SQL query to find the product with the highest price from the Products table.
select productname, price
from products 
order by price desc
limit 1;


-- Write an SQL query to calculate the average quantity of products ordered in the OrderDetails table.
select avg(quantity) from Order_details; 

-- Write an SQL query to calculate the total quantity of products ordered in the OrderDetails table.
 select sum(quantity) as total_quantity from order_details;


SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;

SELECT CustomerName AS Customer, ContactName AS Contact_Person
FROM Customers;

Write a SQL query to retrieve all columns from the Customers table.

select from 
