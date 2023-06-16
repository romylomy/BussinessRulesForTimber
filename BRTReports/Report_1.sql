set echo ON
spool 'C:\cprg250s\BRTDB\Prototype_System\Report 1\Report_1_Output.txt'

COLUMN ADDRESS FORMAT A30;

COLUMN CITY FORMAT A20;

accept input char prompt 'Enter a City Name: ';

select customer_id, address, city, province, postal_code, phone_number, email_address
from brt_customer
WHERE city = '&input';

spool OFF