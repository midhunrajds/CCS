SELECT gs.chainID, c.Segment, COUNT(*) AS Count
FROM gasstations gs
INNER JOIN transactions_1k t ON gs.GasStationID = t.GasStationID
INNER JOIN customers c ON t.CustomerID = c.CustomerID
WHERE gs.chainID IN (
    SELECT chainID
    FROM (
        SELECT chainID, COUNT(*) AS TotalCount
        FROM gasstations
        GROUP BY chainID
        ORDER BY TotalCount DESC
        LIMIT 5
    ) AS top_chains
)
GROUP BY gs.chainID, c.Segment
ORDER BY gs.chainID, Count DESC;
