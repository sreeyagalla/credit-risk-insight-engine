SELECT property_state, COUNT(*) AS loans,
       ROUND(100.0*AVG(defaulted),2) AS default_rate_pct
FROM loans GROUP BY property_state
HAVING COUNT(*) >= 300
ORDER BY default_rate_pct DESC LIMIT 8;