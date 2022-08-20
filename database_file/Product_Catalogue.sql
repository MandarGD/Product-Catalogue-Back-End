PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
drop table if exists USER;
drop table if exists PRODUCT;
drop table if exists CATEGORY;
drop table if exists PRODUCT_REVIEW;
drop table if exists IN_CATEGORY;
drop table if exists STORE;
drop table if exists AVAILABLE_AT;


CREATE TABLE USER (
    user_id text primary key NOT NULL, --user id as text
    password text NOT NULL-- password
);

CREATE TABLE PRODUCT (
    prod_name text NOT NULL, --name of the product
    brand_name text NOT NULL, --brand of the product
    prod_description text, --description of the product
    uploaded_by text NOT NULL, --user who uploaded product
    primary key(prod_name, brand_name)
);

CREATE TABLE CATEGORY (
    cat_name text primary key NOT NULL, --category name
    cat_description text NOT NULL --category description
);

CREATE TABLE PRODUCT_REVIEW (
    prod_name text NOT NULL, --name of the reviewed product
    brand_name text NOT NULL, --name of the reviewed product's brand
    user_id text NOT NULL, --reviewer's user id
    rating float NOT NULL, --rating out of 10
    rev_description text, --description of the review
    primary key(prod_name, brand_name, user_id)
);

CREATE TABLE IN_CATEGORY (
    prod_name text NOT NULL, --product name in category
    brand_name text NOT NULL, --brand of the product
    cat_name text NOT NULL, --category name
    primary key(prod_name, brand_name, cat_name)
);

CREATE TABLE STORE (
    s_name text NOT NULL, --store name
    s_location text NOT NULL, --store location could be a url as well
    type text NOT NULL, --type of store online vs building
    primary key(s_name, s_location) 
);

CREATE TABLE AVAILABLE_AT (
    s_name text NOT NULL, --store name
    s_location text NOT NULL, --store location
    prod_name text NOT NULL, --product name
    brand_name text NOT NULL, --brand_name
    price float NOT NULL, --price of product at store
    primary key(s_name, s_location, prod_name, brand_name)
);


insert into USER values ("newuser", "password");
insert into USER values ("newuser3", "password");
insert into USER values ("newuser2", "password");

insert into STORE (s_name, s_location, type) values ("Staples", "101 Marketplace Ave", "store");
insert into STORE (s_name, s_location, type) values ("Staples", "2210 Bank St", "store");
insert into STORE (s_name, s_location, type) values ("Walmart", "3651 Strandherd Dr", "store");
insert into STORE (s_name, s_location, type) values ("Walmart", "2210 Bank St", "store");
insert into STORE (s_name, s_location, type) values ("Storemart", "456 longway Dr", "store");
insert into STORE (s_name, s_location, type) values ("Storemart", "storemart.ca", "online");
insert into STORE (s_name, s_location, type) values ("Amazon", "amazon.ca", "online");

insert into CATEGORY (cat_name, cat_description) values ("Writing", "writing utensils");
insert into CATEGORY (cat_name, cat_description) values ("Art", "utensils that can be used for art");
insert into CATEGORY (cat_name, cat_description) values ("Math", "utensils that can be used for mathematics");

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Pencils", "Hilroy", "HB2 pencil pack of 24", "newuser");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Pencils", "Hilroy", "Writing");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Pencils", "Hilroy", "Art");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Staples", "2210 Bank St", "Pencils", "Hilroy", 7.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Pencils", "Hilroy", 5.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Pencils", "Staedtler", "HB2 pencil pack of 15", "newuser3");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Pencils", "Staedtler", "Writing");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Pencils", "Staedtler", "Art");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Staples", "2210 Bank St", "Pencils", "Staedtler", 10.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Pencils", "Staedtler", 11.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Ballpoint Pens (Blue)", "Bicc", "Blue ballpoint pen 5 pack", "newuser2");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Ballpoint pens", "Bicc", "Writing");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Walmart", "2210 Bank St", "Ballpoint Pens (Blue)", "Bicc", 6.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Staples", "2210 Bank St", "Ballpoint Pens (Blue)", "Bicc", 8.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Ballpoint Pens (Black)", "Bicc", "Black ballpoint pen 10 pack", "newuser2");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Ballpoint pens (Black)", "Bicc", "Writing");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Walmart", "2210 Bank St", "Ballpoint Pens (Black)", "Bicc", 8.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Staples", "2210 Bank St", "Ballpoint Pens (Black)", "Bicc", 10.99);

--art

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Watercolour set", "ARTEZA", "water colour set ", "newuser");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Watercolour set", "ARTEZA", "Art");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Storemart", "456 longway Dr", "Watercolour set", "ARTEZA", 15.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Watercolour set", "ARTEZA", 11.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Watercolour set", "Schmincke Horadam", "water colour set ", "newuser");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Watercolour set", "Schmincke Horadam", "Art");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Storemart", "storemart.ca", "Watercolour set", "Schmincke Horadam", 25.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Watercolour set", "Schmincke Horadam", 23.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Paint Brush", "Paintbrand", "set of paintbrushed", "newuser3");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Paint Brush", "Paintbrand", "Art");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Storemart", "storemart.ca", "Paint Brush", "Paintbrand", 5.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Paint Brush", "Paintbrand", 3.99);

insert into PRODUCT (prod_name,brand_name,prod_description,uploaded_by) values ("Ruler", "Staedtler", "water colour set ", "newuser");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Ruler", "Staedtler", "Art");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Ruler", "Staedtler", "Math");
insert into IN_CATEGORY (prod_name, brand_name, cat_name) values ("Ruler", "Staedtler", "Writing");
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Storemart", "storemart.ca", "Ruler", "Staedtler", 12.99);
insert into AVAILABLE_AT (s_name, s_location, prod_name, brand_name, price) values("Amazon", "amazon.ca", "Ruler", "Staedtler", 6.99);


COMMIT;
