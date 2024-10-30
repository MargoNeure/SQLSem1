/*1.Задание: Ранжируйте продукты в каждой категории на основе их средней цены
(AvgPrice). Используйте таблицы OrderDetails и Products.
*/

with avg_prices8 as (SELECT 
	p.CategoryID 
	, p.ProductName, 
	AVG (p.Price) as AvgPrice
	FROM OrderDetails od 
join Products p on od.ProductID = p.ProductID
GROUP BY p.CategoryID, p.ProductID, p.ProductName)

SELECT 
CategoryID, 
ProductName, 
	 AvgPrice,
RANK() OVER (PARTITION BY CategoryID ORDER BY AvgPrice DESC) AS rank_prices8
FROM avg_prices8



/*Задание: Рассчитайте среднюю сумму кредита (AvgCreditAmount) для каждого
кластера в каждом месяце и сравните её с максимальной суммой кредита
(MaxCreditAmount) за тот же месяц. Используйте таблицу Clusters.*/


WITH AvgCredit AS (
	SELECT
		month,
		cluster,
		AVG(credit_amount) AS AvgCreditAmount
	FROM Clusters
	GROUP BY month, cluster
	),

MaxCredit AS (
	SELECT
		month,
		MAX(credit_amount) AS MaxCreditAmount
		FROM Clusters
	GROUP BY month
)

SELECT
a.month,
a.cluster,
a.AvgCreditAmount,
m.MaxCreditAmount
FROM AvgCredit a
JOIN MaxCredit m ON a.month = m.month;

/*Задание: Создайте таблицу с разницей (Difference) между суммой кредита и
предыдущей суммой кредита по месяцам для каждого кластера. Используйте таблицу
Clusters.*/

WITH sumCredit AS
(SELECT cluster , month ,credit_amount,
LAG(credit_amount) OVER (PARTITION BY cluster ORDER BY month) AS PreviousCreditAmount
FROM Clusters c 
GROUP BY cluster , MONTH)

SELECT
month,
cluster,
credit_amount,
PreviousCreditAmount,
COALESCE(credit_amount - PreviousCreditAmount, 0) AS Difference
FROM sumCredit;




