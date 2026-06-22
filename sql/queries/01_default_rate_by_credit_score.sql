SELECT CASE
         WHEN credit_score IS NULL THEN 'Unknown'
         WHEN credit_score < 620 THEN '1. <620 (subprime)'
         WHEN credit_score < 660 THEN '2. 620-659'
         WHEN credit_score < 700 THEN '3. 660-699'
         WHEN credit_score < 740 THEN '4. 700-739'
         ELSE '5. 740+'
       END AS score_band,
       COUNT(*) AS loans,
       ROUND(100.0*AVG(defaulted),2) AS default_rate_pct
FROM loans GROUP BY score_band ORDER BY score_band;