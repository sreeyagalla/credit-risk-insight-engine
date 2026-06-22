WITH banded AS (
  SELECT CASE WHEN orig_ltv <= 60 THEN '<=60'
              WHEN orig_ltv <= 80 THEN '61-80'
              WHEN orig_ltv <= 90 THEN '81-90'
              ELSE '90+' END AS ltv_band,
         orig_upb, defaulted
  FROM loans WHERE orig_ltv IS NOT NULL)
SELECT ltv_band, COUNT(*) AS loans,
       ROUND(100.0*AVG(defaulted),2) AS default_rate_pct,
       ROUND(100.0*SUM(orig_upb)/SUM(SUM(orig_upb)) OVER (),2) AS pct_of_total_upb
FROM banded GROUP BY ltv_band ORDER BY ltv_band;