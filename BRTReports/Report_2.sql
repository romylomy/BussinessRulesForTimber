set echo ON
spool 'C:\cprg250s\BRTDB\Prototype_System\Report 2\Report_2_Output.txt'

SET LINESIZE 100

SET PAGESIZE 50

COLUMN "category_name" FORMAT A30

COLUMN "Average Price" FORMAT $9, 999.99

COLUMN "Min Price" FORMAT $9, 999.99

COLUMN "Max Price" FORMAT $9, 999.99

SELECT
    C.CATEGORY_NAME,
    AVG(P.PRICE) AS "Average Price",
    MIN(P.PRICE) AS "Min Price",
    MAX(P.PRICE) AS "Max Price"
FROM
    BRT_CATEGORY C
    JOIN BRT_PRODUCT P
    ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY
    C.CATEGORY_NAME
ORDER BY
    "Average Price";

spool OFF