/* 1. Посчитать средний чек одного заказа. */
SELECT od.OrderID, SUM(od.Quantity*p.Price)  FROM OrderDetails od 
JOIN Products p on p.ProductID = od.ProductID 
Group by od.OrderID 
order by od.OrderID 

/*2. Посчитать сколько заказов доставляет в месяц
каждая служба доставки.*/


SELECT 
    sh.ShipperName,
    strftime('%Y-%m', o.OrderDate) as Month,
    COUNT(*) as OrdersCount
FROM Orders o
JOIN Shippers sh ON o.ShipperID = sh.ShipperID
GROUP BY sh.ShipperName, strftime('%Y-%m', o.OrderDate)
ORDER BY Month, sh.ShipperName;

/* Определите, сколько заказов доставила United
Package в декабре 2023 года */

SELECT 
    sh.ShipperName,
    strftime('%Y-%m', o.OrderDate) as Month,
    COUNT(*) as OrdersCount
FROM Orders o
JOIN Shippers sh ON o.ShipperID = sh.ShipperID
WHERE sh.ShipperName = 'United Package' AND strftime('%Y-%m', o.OrderDate) = '2023-12'
GROUP BY sh.ShipperName, strftime('%Y-%m', o.OrderDate)
ORDER BY Month, sh.ShipperName;


/*Определить средний LTV покупателя (сколько
денег покупатели в среднем тратят в магазине
за весь период) */

SELECT SUM(od.Quantity*p.Price)/COUNT( e.LastName ) FROM Orders o 
JOIN Employees e ON e.EmployeeID =o.EmployeeID 
JOIN OrderDetails od on o.OrderID = od.OrderID 
JOIN Products p  ON p.ProductID = od.ProductID 
--GROUP by e.LastName


