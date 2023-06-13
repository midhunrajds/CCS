-- Select the year and month, count of distinct customers in each group, new customers, and churned customers
SELECT
    yearmonth,
    COUNT(DISTINCT CustomerID) AS GroupSize, -- Calculate the group size (number of unique customers)
    COUNT(DISTINCT CASE WHEN prev_yearmonth IS NULL THEN CustomerID END) AS NewCustomers, -- Identify new customers
    COUNT(DISTINCT CASE WHEN prev_yearmonth IS NOT NULL AND yearmonth <> prev_yearmonth THEN CustomerID END) AS ChurnedCustomers -- Identify churned customers
FROM (
    -- Subquery to calculate the year and month for each transaction and the previous year and month for each customer
    SELECT
        CONCAT(YEAR(Date), '-', MONTH(Date)) AS yearmonth, -- Combine the year and month into 'YYYY-MM' format
        CustomerID,
        LAG(CONCAT(YEAR(Date), '-', MONTH(Date))) OVER (PARTITION BY CustomerID ORDER BY Date) AS prev_yearmonth -- Calculate the previous year and month for each customer
    FROM transactions_1k
    WHERE YEAR(Date) BETWEEN 2012 AND 2014 -- Filter transactions for the years 2012-2014
) AS grouped_data
GROUP BY yearmonth -- Group the data by year and month
ORDER BY yearmonth; -- Order the results by year and month

