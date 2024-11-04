create table student_info(
std_id int not null,
std_name varchar(20),
department varchar(20)
);
insert into student_info(std_id,std_name,department)
values(2102043,'Amit','CSE'),(2102044,'Porag','CSE'),(2102045,'Utal','CSE');

select department, count(std_id),std_name
from student_info
group by department
having count(std_id)>2;

select department, count(std_id) as student_count
from student_info
group by department
having count(std_id) > 2
order by student_count desc;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, LastName, FirstName)
VALUES 
    (1, 'Smith', 'John'),
    (2, 'Doe', 'Jane'),
    (3, 'Brown', 'Charlie');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderID, EmployeeID, OrderDate)
VALUES 
    (101, 1, '2024-01-15'),
    (102, 1, '2024-02-20'),
    (103, 2, '2024-03-05'),
    (104, 3, '2024-04-10'),
    (105, 1, '2024-05-15'),
    (106, 2, '2024-06-18'),
    (107, 1, '2024-07-25'),
    (108, 1, '2024-08-13'),
    (109, 2, '2024-09-09'),
    (110, 1, '2024-10-01'),
    (111, 1, '2024-11-01');
    CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100),
    Phone VARCHAR(50)
);
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, Country, Phone)
VALUES 
    (1, 'ABC Supply Co.', 'Alice Johnson', '123 Market Street', 'New York', 'USA', '123-456-7890'),
    (2, 'Global Products', 'Michael Smith', '456 Elm Road', 'San Francisco', 'USA', '987-654-3210'),
    (3, 'Tech Supplies Inc.', 'Sarah Brown', '789 Main Avenue', 'Chicago', 'USA', '555-123-4567'),
    (4, 'Industrial Hardware', 'John Davis', '321 Industrial Blvd', 'Houston', 'USA', '444-567-8901'),
    (5, 'Euro Components', 'Emma Taylor', '12 Baker Street', 'London', 'UK', '44-20-1234-5678'),
    (6, 'Asia Equipments', 'Liu Wei', '88 Xintiandi Avenue', 'Shanghai', 'China', '86-21-8765-4321');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductID, ProductName, SupplierID, Price)
VALUES 
    (1, 'Widget A', 1, 15.00),
    (2, 'Widget B', 1, 25.00),
    (3, 'Gadget X', 2, 19.99),
    (4, 'Gadget Y', 3, 22.00),
    (5, 'Tool Z', 2, 18.50),
    (6, 'Machine M', 4, 30.00),
    (7, 'Component C', 5, 12.50),
    (8, 'Device D', 6, 45.00),
    (9, 'Tool T', 3, 21.00),
    (10, 'Accessory A', 4, 17.00);


    
-- Query 1
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

-- Query 2
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (
    SELECT ProductName 
    FROM Products 
    WHERE Products.SupplierID = Suppliers.SupplierID AND Price < 20
);

-- Query 3

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (
    SELECT ProductName 
    FROM Products 
    WHERE Products.SupplierID = Suppliers.SupplierID AND Price < 22
);



