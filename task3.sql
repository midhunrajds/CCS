-- Groups of users who prefer a certain chain (local entrepreneurs and others)
SELECT c.CustomerID, gs.chainID, COUNT(DISTINCT gs.GasStationID) AS distinct_gas_stations
FROM customers AS c
JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
GROUP BY c.CustomerID, gs.chainID
HAVING COUNT(DISTINCT gs.GasStationID) > 1;

-- Most preferred chains by users
SELECT gs.chainID, COUNT(DISTINCT c.CustomerID) AS user_count
FROM customers AS c
JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
GROUP BY gs.chainID
ORDER BY user_count DESC;
