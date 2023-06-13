SELECT
    gs.Segment AS ChainSegment,
    COUNT(DISTINCT t.CustomerID) AS UserCount,
    COUNT(DISTINCT t.CardID) AS ClientCount
FROM transactions_1k t
JOIN gasstations gs ON t.GasStationID = gs.GasStationID
GROUP BY gs.Segment
ORDER BY UserCount DESC, ClientCount DESC;
