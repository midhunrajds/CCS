---Task 1: Chain brand preference ----

-- Total number of unique gas stations
SELECT COUNT(DISTINCT GasStationID) AS TotalGasStations
FROM gasstations;

-- Number of transactions per gas station
SELECT GasStationID, COUNT(*) AS TransactionCount
FROM transactions_1k
GROUP BY GasStationID
ORDER BY TransactionCount DESC;

-- Total revenue generated per gas station
SELECT GasStationID, SUM(Amount) AS TotalRevenue
FROM transactions_1k
GROUP BY GasStationID
ORDER BY TotalRevenue DESC;

-- Market share of each gas station chain
SELECT chainID, COUNT(*) AS TransactionCount, SUM(Amount) AS TotalRevenue
FROM transactions_1k t
JOIN gasstations g ON t.GasStationID = g.GasStationID
GROUP BY chainID
ORDER BY TotalRevenue DESC;

