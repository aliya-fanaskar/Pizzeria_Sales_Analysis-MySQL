CREATE DATABASE pizzeria;

/* Database Overview: Pizzeria Sales Database
This database represents a full year sales data for a fictional pizzeria 
It contains 4 tables - orders, order_details, pizzas, pizza_types
*/
USE pizzeria;
SHOW TABLES;     -- none yet


-- ===========================================================
/* Table 1 - Orders Table - Stores order-level information such as order date and time.

- import file   : orders.csv (20000+ rows)
- import method : created table schema and then loaded data
*/

CREATE TABLE orders(
	order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY(order_id)
);

LOAD DATA INFILE "path\\orders.csv"     -- enter path of file here
INTO TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 LINES;
-- Note: Manually added double backslashes in file path as MySQL reads single backslash as escape character


-- ===========================================================
/* Table 2 - Order Details Table - Contains item-level details for each order, including pizza ordered and quantity.

- import file   : pizza_types.csv (45000+ rows)
- import method : created table schema and then loaded data
*/

CREATE TABLE order_details(
	order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(order_details_id)
);

LOAD DATA INFILE "path\\orders.csv"     -- enter path of file here
INTO TABLE order_details
FIELDS TERMINATED BY ','
IGNORE 1 LINES;


-- ===========================================================
/* Table 3 - Pizzas Table - Holds information about individual pizzas, including size and price.

- import file   : pizzas.csv (approx 100 rows)
- import method : direct - R-click 'pizzeria', select 'Table Data Import Wizard'
*/


-- ===========================================================
/* Table 4 - Pizza Types Table - Contains pizza names, categories, and ingredients.

- import file   : pizza_types.csv (approx 35 rows)
- import method : direct - R-click 'pizzeria', select 'Table Data Import Wizard'
*/


/* Relationships:
- One order can have multiple order details.
- Each order detail refers to one pizza.
- One pizza comes in multiple sizes and are priced according to the sizes.
- Each pizza belongs to one pizza type.
*/

SHOW TABLES;      -- all 4 tables visible now

/* some more Structural changes made via MySQL Table Editor
--------------------------------------------------------------------------------
1. 'pizza_types' Table
- Set 'pizza_type_id' column as PRIMARY KEY
- column Data Type changed from 'TEXT' to 'CHAR(20)'


--------------------------------------------------------------------------------
2. 'orders' Table
- column 'order_id' already set as PRIMARY KEY and INT data type
- no further changes needed


--------------------------------------------------------------------------------
3. 'pizzas' Table
- Set 'pizza_id' column as PRIMARY KEY
- column Data Type changed from 'TEXT' to 'CHAR(25)'

- Set FOREIGN KEY - 'pizza_type_id' column
- column Data Type changed from 'TEXT' to 'CHAR(20)'
- Referenced with 'pizza_types' Table, 'pizza_type_id' column


--------------------------------------------------------------------------------
4. 'order_details' Table
- column 'order_details_id' already set as PRIMARY KEY and INT data type

- Set FOREIGN KEY - 'order_id' column
- Referenced with 'orders' Table, 'order_id' column

- Set FOREIGN KEY - 'pizza_id' column
- column Data Type changed from 'TEXT' to 'CHAR(20)'
- Referenced with 'pizzas' Table, 'pizza_id' column
*/


-- check tables
desc pizzas;
SELECT * FROM pizzas limit 5;

desc pizza_types;
SELECT * FROM pizza_types limit 5;

DESC orders;
SELECT * FROM orders limit 50;

DESC order_details;
SELECT * FROM order_details limit 50;