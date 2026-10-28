use northwind;

-- orders and customers
select *
from customers
inner join orders
on customers.customerid = orders.customerid;

select customers.customername, customers.CustomerID, 
orders.orderid, customers.city, customers.country 
from customers
inner join orders
on customers.customerid = orders.customerid;

-- because customerid is on both tables, you must mention source table
-- if column only exists on 1 of your tables, this is not necessary

select customername, orders.CustomerID, 
orderid, city, country 
from customers
inner join orders
on customers.customerid = orders.customerid;

-- find the supplier of each product
select productname, suppliername
from products
inner join suppliers
on products.supplierid = suppliers.supplierid;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM Orders
INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Shippers 
ON Orders.ShipperID = Shippers.ShipperID;


-- find the supplier of each product
select productname, suppliername
from products
inner join suppliers
on products.supplierid = suppliers.supplierid;

-- find the product of the supplier G'day, Mate:
select productname, suppliername
from suppliers
inner join products
on products.supplierid = suppliers.supplierid
where suppliername = "G'day, Mate";

select productname, suppliername
from suppliers
inner join products
on products.supplierid = suppliers.supplierid
where suppliername = "G'day, Mate"
order by productname;

-- Write a query to list the employees who handled each order, along with the order date.
select orders.OrderID, orders.orderdate, employees.EmployeeID, employees.firstname, employees.lastname 
from orders 
inner join employees 
on orders.employeeid = employees.EmployeeID;

-- Write a query to find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express').
SELECT shippers.shipperid, shippername, orderid, orderdate 
FROM shippers 
INNER JOIN orders 
ON shippers.shipperID = orders.shipperID
where shippername = 'speedy express';


-- Write a query to display all products along with their category names.
SELECT p.ProductID , p.ProductName, c.CategoryName 
FROM Products as p 
JOIN Categories as c 
ON p.CategoryID = c.CategoryID;


-- Write a query to list all products and their quantities for each order.
SELECT productname, quantity
FROM products
INNER JOIN order_details
ON order_details.productID = products.productID;


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
-- OrderID is null, that customer didnt place any order

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orderid is null;

SELECT Customers.CustomerName, Orders.OrderID
FROM Orders
right JOIN Customers ON Customers.CustomerID = Orders.CustomerID
where orderid is null;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

select productname, shippername
from products 
cross join shippers;

-- quantity is aggregated, with non-aggregate column productname
-- non-aggregate columns must be in group by 
SELECT p.productname, sum(od.quantity) as totalquantity
FROM products as p
INNER JOIN order_details as od
ON od.productID = p.productID
group by p.productname;

select country, count(customerid) as totalcustomers
from customers
group by country;


SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders 
FROM Orders
LEFT JOIN Shippers 
ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
-- default type of joins is inner join.


-- Write SQL query to list the number of customers in each city.
select city, count(customerid) as totalcustomers
from customers
group by city
order by count(customerid) desc;

-- Write a query to list each product category and the total quantity of products sold in that category.
select CategoryName, sum(quantity) as totalproducts
from products as p
join categories as c
on p.categoryid = c.categoryid
join order_details as od
on p.ProductID= od.ProductID
group by CategoryName;

-- Write a query to list each employee and the number of orders they have handled.
select e.FirstName, e.LastName, count(OrderID) as totalorders
from employees as e 
join orders as o
on e.employeeid = o.employeeid
group by e.FirstName, e.LastName;
