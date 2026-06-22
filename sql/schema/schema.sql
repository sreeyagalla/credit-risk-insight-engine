DROP TABLE IF EXISTS loan_performance CASCADE;
DROP TABLE IF EXISTS loans CASCADE;

CREATE TABLE loans (
    loan_seq_no               VARCHAR(12) PRIMARY KEY,
    credit_score              SMALLINT,
    first_payment_date        DATE,
    first_time_homebuyer_flag CHAR(1),
    maturity_date             DATE,
    msa                       VARCHAR(5),
    mi_pct                    SMALLINT,
    number_of_units           SMALLINT,
    occupancy_status          CHAR(1),
    orig_cltv                 SMALLINT,
    orig_dti                  SMALLINT,
    orig_upb                  INTEGER,
    orig_ltv                  SMALLINT,
    orig_interest_rate        NUMERIC(6,3),
    channel                   CHAR(1),
    ppm_flag                  CHAR(1),
    amortization_type         VARCHAR(5),
    property_state            CHAR(2),
    property_type             VARCHAR(5),
    postal_code               VARCHAR(5),
    loan_purpose              CHAR(1),
    orig_loan_term            SMALLINT,
    number_of_borrowers       VARCHAR(2),
    seller_name               VARCHAR(100),
    servicer_name             VARCHAR(100),
    program_indicator         VARCHAR(3),
    property_valuation_method VARCHAR(3),
    interest_only_indicator   CHAR(1),
    mi_cancellation_indicator VARCHAR(3),
    defaulted                 SMALLINT NOT NULL
);

CREATE TABLE loan_performance (
    loan_seq_no           VARCHAR(12) NOT NULL REFERENCES loans(loan_seq_no),
    reporting_period      DATE        NOT NULL,
    current_upb           NUMERIC(15,2),
    delinquency_status    VARCHAR(3),
    loan_age              INTEGER,
    zero_balance_code     VARCHAR(2),
    current_interest_rate NUMERIC(6,3)
);