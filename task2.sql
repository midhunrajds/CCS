-- Frequency distribution of purchases at chains by users
SELECT gs.chainID, COUNT(*) AS user_purchase_count
FROM transactions_1k AS t
JOIN customers AS c ON t.CustomerID = c.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
GROUP BY gs.chainID
ORDER BY user_purchase_count DESC;

-- Frequency distribution of purchases at chains by clients
SELECT gs.Segment, COUNT(*) AS client_purchase_count
FROM transactions_1k AS t
JOIN customers AS c ON t.CustomerID = c.CustomerID
JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID
GROUP BY gs.Segment
ORDER BY client_purchase_count DESC;
