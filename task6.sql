SELECT
    gs.Segment AS ChainSegment,
    COUNT(DISTINCT t.CustomerID) AS CustomerCount
FROM transactions_1k t
JOIN gasstations gs ON t.GasStationID = gs.GasStationID
GROUP BY gs.Segment
ORDER BY CustomerCount DESC;
