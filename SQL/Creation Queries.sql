select current_database();

-- /*Creating Table Schema for our CSV data*/
CREATE TABLE sales_data (
    row_id INTEGER,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2)
);

SELECT table_name 
FROM information_schema.tables  --This displays the Created tables in the database
WHERE table_schema = 'public';


--Copy All the CSV Data into our manually made table Schema for better data control 
COPY sales_data
FROM 'D:/Data Analyst Projects/Datasets/Superstore_sales_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';

--Verifying the data Existance 
Select * from sales_data ;

--Validating the count of rows in the dataset 
select count (*) from sales_data;


--Verifying the date format 
select order_date, ship_date 
from sales_data 
limit 5;

--Checking the NULL values in the Dataset ( Very Crucial )
select 
    Count(*) filter (
        Where order_date is NULL) as null_order_date,
    Count(*) filter (Where ship_date is NULL) as null_ship_date,
    Count(*) filter (Where profit is NULL) as null_profit
from sales_data;


