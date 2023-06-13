-- Size of the groups within 2012-2014
SELECT gs.chainID, YEAR(t.Date) AS year, COUNT(DISTINCT c.CustomerID) AS group_size
FROM customers AS c
JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
WHERE YEAR(t.Date) BETWEEN 2012 AND 2014
GROUP BY gs.chainID, YEAR(t.Date)
ORDER BY gs.chainID, YEAR(t.Date);

-- Churn among the groups within 2012-2014
SELECT gs.chainID, YEAR(t.Date) AS year, COUNT(DISTINCT c.CustomerID) AS churned_users
FROM customers AS c
JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
WHERE YEAR(t.Date) BETWEEN 2012 AND 2014
GROUP BY gs.chainID, YEAR(t.Date)
ORDER BY gs.chainID, YEAR(t.Date);
