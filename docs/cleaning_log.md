# Cleaning Log — 2007 Origination Sample (50,000 loans)
- credit_score: 38 values of 9999 (Freddie sentinel for "unknown") set to null.
- orig_dti: 1,124 values of 999 (unknown) set to null.
- orig_cltv / orig_ltv: 2 and 1 values of 999 set to null.
- Dropped super_conforming_flag, pre_harp_loan_seq, harp_indicator: 100% empty
  (post-2007 programs, not applicable to this vintage).
- msa: 11,356 blanks LEFT AS-IS — blank denotes a non-metro property, not missing data.
- Dates (first_payment_date, maturity_date) parsed from YYYYMM text to datetime.