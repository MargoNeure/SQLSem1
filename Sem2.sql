/*1. Вам необходимо проверить влияние семейного
положения (family_status) на средний	доход
клиентов (income) и запрашиваемый кредит
(credit_amount) */

SELECT family_status, ROUND(avg(income)) as AVG_income, ROUND(avg(credit_amount)) as AVG_credit_amount FROM Clusters
GROUP BY family_status 
ORDER BY family_status 

/*
2. Сколько товаров в категории Meat/Poultry. */


SELECT  CASE when CategoryID in (6) THEN  'Meat_Poultry' else 0 end as Category, COUNT(*) FROM Products
WHERE CategoryID IN (SELECT CategoryID FROM Categories
WHERE CategoryName = 'Meat/Poultry')

/*
3. Какой товар (название) заказывали в сумме в
самом большом количестве (sum(Quantity) в
таблице OrderDetails)*/


SELECT ProductName, (SELECT sum(Quantity) from OrderDetails
					WHERE ProductID = Products.ProductID) as sum_order FROM Products
WHERE ProductID = ( SELECT ProductID from OrderDetails
					GROUP BY ProductID
					ORDER BY sum(Quantity) DESC 
					LIMIT (1))