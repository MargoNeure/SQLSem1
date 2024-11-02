/*Задание: Создайте таблицу EmployeeDetails для хранения информации о
сотрудниках. Таблица должна содержать следующие столбцы:
● EmployeeID (INTEGER, PRIMARY KEY)
● EmployeeName (TEXT)
● Position (TEXT)
● HireDate (DATE)
● Salary (NUMERIC)
После создания таблицы добавьте в неё три записи с произвольными данными о
сотрудниках.
*/

CREATE TABLE EmployeeDetails (
EmployeeDetailsID INT PRIMARY KEY,
EmployeeName TEXT(50),
Position TEXT(30),
HireDate DATE,
Salary NUMERIC
);

INSERT INTO EmployeeDetails 
VALUES (1, 'Victor K', 'Sales Manager', '2024-10-12', 12000), 
(2, 'Anna S', 'Marketing Director', '2024-11-01', 25000),
(3, 'Maria L', 'Sales Representative', '2024-11-02', 50000);



/*Задание: Создайте представление HighValueOrders для отображения всех заказов,
сумма которых превышает 10000. В представлении должны быть следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● TotalAmount (общая сумма заказа, вычисленная как сумма всех Quantity *
Price).
Используйте таблицы Orders, OrderDetails и Products.
*/

CREATE VIEW HighValueOrders AS
SELECT o.OrderID,
o.OrderDate, 
sum(od.Quantity*p.Price) AS TotalAmount
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID =p.ProductID 
GROUP BY o.OrderID, o.OrderDate
HAVING SUM(od.Quantity * p.Price) > 10000;


/*
Задание: Удалите все записи из таблицы EmployeeDetails, где Salary меньше
50000. Затем удалите таблицу EmployeeDetails из базы данных.
*/


DELETE FROM EmployeeDetails WHERE Salary < 50000;

DROP TABLE IF EXISTS EmployeeDetails; 

/*Задание: Создайте хранимую процедуру GetProductSales с одним параметром
ProductID. Эта процедура должна возвращать список всех заказов, в которых
участвует продукт с заданным ProductID, включая следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● CustomerID (идентификатор клиента).
Подсказки:
1. Используйте команду CREATE PROCEDURE для создания процедуры.
2. Используйте JOIN для объединения таблиц и WHERE для фильтрации данных по
ProductID.*/



CREATE PROCEDURE GetProductSales ( IN @pProductID INTEGER)
BEGIN
	SELECT p.ProductID , o.OrderID , o.OrderDate , o.CustomerID 
	FROM Products p 
	JOIN OrderDetails od  ON p.ProductID = od.ProductID 
	JOIN Orders o ON od.OrderID = o.OrderID 
	WHERE od.ProductID = pProductID
END;
 -- процедуры не работают в sqlite











