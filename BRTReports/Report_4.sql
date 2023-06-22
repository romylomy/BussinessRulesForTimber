set echo ON
spool 'C:\cprg250s\BRTDB\Prototype_System\Report 4\Report_4_Output.txt'

SET LINESIZE 200

COLUMN SUPPLIER_NAME FORMAT A40

COLUMN EMAIL_ADDRESS FORMAT A40

COLUMN CITY FORMAT A20

SELECT
    REVIEW_ID,
    RATING,
    WEIGHT_KG,
    IS_TAX_EXEMPT,
    REVIEW_DATE,
    PRICE,
    CASE
        WHEN RATING = 5 THEN
            'Excellent'
        WHEN RATING = 4 THEN
            'Very Good'
        WHEN RATING = 3 THEN
            'Good'
        WHEN RATING = 2 THEN
            'Fair'
        WHEN RATING = 1 THEN
            'Poor'
        ELSE
            'Unknown'
    END AS RATING_DESCRIPTION
FROM
    BRT_CUSTOMER_REVIEW
WHERE
    PRODUCT_ID = 1001;

SELECT
    REVIEW_ID,
    RATING,
    WEIGHT_KG,
    IS_TAX_EXEMPT,
    REVIEW_DATE,
    PRICE,
    CASE
        WHEN RATING = 5 THEN
            'Excellent'
        WHEN RATING = 4 THEN
            'Very Good'
        WHEN RATING = 3 THEN
            'Good'
        WHEN RATING = 2 THEN
            'Fair'
        WHEN RATING = 1 THEN
            'Poor'
        ELSE
            'Unknown'
    END AS RATING_DESCRIPTION
FROM
    BRT_CUSTOMER_REVIEW
WHERE
    PRODUCT_ID = 4101;

spool OFF