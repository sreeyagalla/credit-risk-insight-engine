WITH first_default AS (
  SELECT loan_seq_no, MIN(loan_age) AS age_at_default
  FROM loan_performance
  WHERE delinquency_status ~ '^[0-9]+$' AND delinquency_status::int >= 3
  GROUP BY loan_seq_no),
by_age AS (
  SELECT age_at_default, COUNT(*) AS defaults
  FROM first_default GROUP BY age_at_default)
SELECT age_at_default AS loan_age_months, defaults,
       SUM(defaults) OVER (ORDER BY age_at_default) AS cumulative_defaults,
       ROUND(100.0*SUM(defaults) OVER (ORDER BY age_at_default)
             / SUM(defaults) OVER (),1) AS cumulative_pct
FROM by_age ORDER BY age_at_default;