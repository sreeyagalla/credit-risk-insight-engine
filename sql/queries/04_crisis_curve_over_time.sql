SELECT DATE_TRUNC('quarter', reporting_period)::date AS qtr,
       ROUND(100.0*AVG(CASE WHEN delinquency_status ~ '^[0-9]+$'
                            AND delinquency_status::int >= 3 THEN 1 ELSE 0 END),2) AS dq90plus_pct
FROM loan_performance
GROUP BY qtr ORDER BY qtr;