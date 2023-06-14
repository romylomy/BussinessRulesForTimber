set echo on

spool 'C:\cprg250s\deliverable_3\brt_timber.log'

drop table brt_suppliers cascade constraints;
drop table brt_order cascade constraints;
drop table brt_product cascade constraints;
drop table brt_product_suppliers cascade constraints;
drop table brt_product_order cascade constraints;
drop table brt_category cascade constraints;
drop table brt_customer_review cascade constraints;
drop table brt_customer cascade constraints;

CREATE TABLE brt_suppliers (
  supplier_id NUMBER PRIMARY KEY,
  supplier_name VARCHAR2(100) NOT NULL,
  email_address VARCHAR2(100) NOT NULL,
  city VARCHAR2(100) NOT NULL,
  province CHAR(2) NOT NULL,
  CONSTRAINT brt_suppliers_province_ck CHECK (province IN ('AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT'))
);

CREATE TABLE brt_customer (
  customer_id NUMBER PRIMARY KEY,
  address VARCHAR2(255) NOT NULL,
  city VARCHAR2(50) NOT NULL,
  province CHAR(2) NOT NULL,
  postal_code CHAR(6) NOT NULL,
  phone_number VARCHAR2(12) NOT NULL,
  email_address VARCHAR2(100) NOT NULL,
  is_timber_member NUMBER NOT NULL,
  CONSTRAINT brt_customer_is_member_ck CHECK (is_timber_member IN(0,1)),
  CONSTRAINT brt_customer_province_ck CHECK (province IN ('AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
  CONSTRAINT postal_code CHECK(regexp_like (postal_code, '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$')),
  CONSTRAINT phone_number_ck CHECK (regexp_like (phone_number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')),
  CONSTRAINT email_address CHECK (regexp_like (email_address, '[A-Za-z]\@[A-Za-z]'))
);


CREATE TABLE brt_order (
    order_id NUMBER UNIQUE,
    customer_id NUMBER UNIQUE,
    order_date DATE NOT NULL,
    estimated_delivery_date DATE NOT NULL,
    shipping_amount NUMBER(12,2) NOT NULL,
    tax_amount NUMBER(12,2) NOT NULL,
    shipping_province CHAR(2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES brt_customer(customer_id)
);

CREATE TABLE brt_category (
  category_id NUMBER PRIMARY KEY,
  category_name VARCHAR2(50) NOT NULL
);

CREATE TABLE brt_product (
  product_id NUMBER PRIMARY KEY,
  order_id NUMBER UNIQUE,
  title VARCHAR2(150) NOT NULL,
  description CLOB,
  price NUMBER(12,2) NOT NULL,
  weight_kg NUMBER(12,2) NOT NULL,
  is_tax_exempt NUMBER(1) NOT NULL,
  category_id NUMBER(1) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES brt_order(order_id),
  FOREIGN KEY (category_id) REFERENCES brt_category(category_id),
  CONSTRAINT brt_product_CHK1 CHECK (price>0),
  CONSTRAINT brt_product_CHK2 CHECK (weight_kg>0),
  CONSTRAINT brt_product_CHK3 CHECK(is_tax_exempt IN (0,1))
);

--BRIDGING TABLES
CREATE TABLE brt_product_suppliers (
  product_id NUMBER NOT NULL UNIQUE,
  supplier_id NUMBER NOT NULL UNIQUE,
  quantity_on_hand NUMBER NOT NULL,
  estimated_delivery_days NUMBER NOT NULL,
  PRIMARY KEY (product_id, supplier_id),
  FOREIGN KEY (product_id) REFERENCES brt_product(product_id),
  FOREIGN KEY (supplier_id) REFERENCES brt_supplier(supplier_id),
  CONSTRAINT quantity_on_hand_ck CHECK (quantity_on_hand>=0),
  CONSTRAINT estimated_delivery_days_ck CHECK (estimated_delivery_days>=0)
);

CREATE TABLE brt_product_order (
  order_id NUMBER NOT NULL,
  product_id NUMBER NOT NULL,
  product_amount NUMBER(10) NOT NULL, --greater than 0 
  CONSTRAINT order_product_pk PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES brt_order(order_id),
  FOREIGN KEY (product_id) REFERENCES brt_product(product_id),
  CONSTRAINT product_amount_CHK1 CHECK (product_amount > 0)
);

CREATE TABLE brt_customer_review (
  review_id NUMBER PRIMARY KEY,
  product_id NUMBER NOT NULL UNIQUE,
  rating NUMBER NOT NULL,
  comments CLOB,
  weight_kg NUMBER(12,2),
  is_tax_exempt NUMBER(1) NOT NULL,
  review_date DATE NOT NULL,
  price NUMBER(12,2),
  FOREIGN KEY (product_id) REFERENCES brt_product(product_id),
  CONSTRAINT rating_ck CHECK (rating BETWEEN 1 AND 5),
  CONSTRAINT price CHECK (price>0),
  CONSTRAINT weight_kg CHECK (weight_kg>0),
  CONSTRAINT is_tax_exempt CHECK (is_tax_exempt IN (0,1))
);

spool off 