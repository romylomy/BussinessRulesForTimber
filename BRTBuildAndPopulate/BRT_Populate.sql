set echo ON

spool 'C:\cprg250s\BRTDB\populate_BRTDB.log'

--delete data from tables
DELETE FROM brt_suppliers;
DELETE FROM brt_order;
DELETE FROM brt_product;
DELETE FROM brt_product_suppliers;
DELETE FROM brt_product_order;
DELETE FROM brt_category;
DELETE FROM brt_customer_review;
DELETE FROM brt_customer;

-- Populate Parent Tables

--brt_category 
insert into brt_category VALUES(1000,'Electronics', 'Computer');

insert into brt_category VALUES(1100,'Electronics', 'Mobile Devices');

insert into brt_category VALUES(2000,'Home', 'Furniture');

insert into brt_category VALUES(3000,'Clothing and Accessories', 'Men`s Clothing');

insert into brt_category VALUES(3100,'Clothing and Accessories', 'Women`s Clothing');

insert into brt_category VALUES(4000,'Sports and Outdoors ', 'Exercise and fitness');

insert into brt_category VALUES(4100,'Sports and Outdoors ', 'Camping and hiking');

insert into brt_category VALUES(5000,'Beauty and Personal Care', 'Skincare ');

insert into brt_category VALUES(5200,'Beauty and Personal Care', 'Haircare');



--brt_suppliers 

INSERT INTO brt_suppliers
VALUES(1111,'Canada and Computers and Electronics', 'ccomputerselectronics@example.com', 'Calgary','AB');

INSERT INTO brt_suppliers
VALUES(2222,'Boreal Ventures Canada', 'borealventureca@example.com', 'Vancouver','BC');

INSERT INTO brt_suppliers 
VALUES(3333,'Modern Beauty', 'modernbeauty@example.com', 'Toronto','ON');
 

--brt_Order-- (TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));

insert into BRT_Order (order_id, customer_id, order_date, Estimated_delivery_date, shipping_amount, Tax_amount, Shipping_province)
values(1112, 8756, TO_DATE('2023/08/01', 'yyyy/mm/dd'), TO_DATE('2023/08/03', 'yyyy/mm/dd'), 9.95, 99.9, 'AB');

INSERT INTO BRT_Order (order_id, customer_id, order_date, Estimated_delivery_date, shipping_amount, Tax_amount, Shipping_province)
VALUES (1113, 8857, TO_DATE('2022/09/11', 'yyyy/mm/dd'), TO_DATE('2022/12/31', 'yyyy/mm/dd') , 9.95, 11.11, 'BC');

INSERT INTO BRT_Order (order_id, customer_id, order_date, Estimated_delivery_date, shipping_amount, Tax_amount, Shipping_province)
VALUES (1114, 8958, TO_DATE('2022/08/01', 'yyyy/mm/dd'), TO_DATE('2022/08/05', 'yyyy/mm/dd') , 0, 0.55, 'ON');

INSERT INTO BRT_Order (order_id, customer_id, order_date, Estimated_delivery_date, shipping_amount, Tax_amount, Shipping_province)
VALUES (1115, 8759, TO_DATE('2022/02/10', 'yyyy/mm/dd'), TO_DATE('2022/02/15', 'yyyy/mm/dd') , 9.95, 15.04, 'QC');



spool OFF