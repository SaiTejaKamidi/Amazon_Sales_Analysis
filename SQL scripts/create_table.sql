-- Create Database
CREATE database amazon;
USE amazon;

-- Create Table
CREATE TABLE amazondata(invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
                        branch VARCHAR(5) NOT NULL,
                        city VARCHAR(30) NOT NULL, 
                        customer_type VARCHAR(30)NOT NULL,
                        gender VARCHAR(10)NOT NULL,
                        product_line VARCHAR(100)NOT NULL,
                        unit_price DECIMAL(10,2) NOT NULL,
                        quantity INT NOT NULL,
                        VAT FLOAT NOT NULL,
                        total DECIMAL(10,2) NOT NULL,
                        date DATE, 
                        time TIME,
                        payment_method VARCHAR(100) NOT NULL,
                        cogs DECIMAL(10,2) NOT NULL,
                        gross_margin_percentage FLOAT NOT NULL,
                        gross_income DECIMAL(10,2) NOT NULL,
                        rating FLOAT NOT NULL);

-- Check if table is created
SELECT * FROM amazon.amazondata;