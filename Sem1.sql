-- ДЗ в презентациях к семинару и в практике отличались. Выполняла то задание, что в практике.

-- 1 Определите, сколько уникальных стран представлено среди клиентов.
SELECT COUNT( DISTINCT Country) FROM Customers;
-- 21

--2 Определите количество клиентов, которые проживают в Бразилии.
SELECT Count(*) FROM Customers
WHERE Country = 'Brazil';
-- 9

-- 3 Посчитайте среднюю цену и общее количество товаров в категории с идентификатором 5.
SELECT AVG(Price) AS PriceAVG, Count(ProductID) AS PrCount FROM Products
WHERE CategoryID = 5
--20.25, 7

--4  Вычислите средний возраст сотрудников на дату 2024-01-01.
SELECT AVG((JULIANDAY('2024-01-01') - JULIANDAY(BirthDate)) / 365.25) AS average_age FROM Employees;
-- 66.123

-- 5 Найдите заказы, сделанные в период с 16 января по 15 февраля 2024 года, и отсортируйте их по дате заказа.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate;

-- 6 Определите количество заказов, сделанных в ноябре 2023 года, используя начальную и конечную дату месяца.
SELECT COUNT(*) FROM Orders
WHERE date(OrderDate) BETWEEN date('2023-11-01') AND date('2023-11-30');
--25

-- 7 Найдите количество заказов за январь 2024 года, используя оператор LIKE для фильтрации даты.
SELECT COUNT(*) FROM Orders
WHERE OrderDate LIKE '2024-01%';
-- 33

--8 Определите количество заказов за 2024 года, используя функцию STRFTIME для извлечения года.
SELECT COUNT(*) FROM Orders
WHERE STRFTIME('%Y', date(OrderDate)) = '2024'
-- 44




