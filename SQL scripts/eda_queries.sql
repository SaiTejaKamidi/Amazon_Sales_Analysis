-- Exploratory Data Analysis (EDA) - Amazon Sales Data

-- 1. Count of distinct cities in the table
SELECT COUNT(DISTINCT City) AS COUNT_OF_CITIES FROM amazondata; --  COUNT_OF_CITIES=3

-- 2. For each branch,what is the corresponding city ?
SELECT DISTINCT Branch, City FROM amazondata ;

-- 3. count of distinct product lines in the dataset
SELECT COUNT(DISTINCT Product_line) AS no_of_product_lines FROM amazondata;

-- 4.  payment method occurs most frequently
SELECT DISTINCT payment_method ,COUNT(payment_method) AS no_of_times FROM amazondata
GROUP BY payment_method
ORDER BY no_of_times DESC
LIMIT 1 ;

-- 5.  Which product line has the highest sales?
SELECT DISTINCT product_line,SUM(quantity) AS no_of_sales FROM amazondata
GROUP BY product_line
ORDER BY no_of_sales DESC
LIMIT 1 ;

-- 6. How much revenue is generated each month?
SELECT DISTINCT monthname, SUM(total) AS revenue 
FROM amazondata
GROUP BY monthname;

-- 7. In which month did the cost of goods sold reach its peak?
SELECT DISTINCT monthname, SUM(cogs) AS total_cogs FROM amazondata
GROUP BY monthname
ORDER BY total_cogs DESC
LIMIT 1 ; -- in january cogs reached its peak

-- 8. Which product line generated the highest revenue?
SELECT DISTINCT product_line, SUM(total) AS revenue 
FROM amazondata
GROUP BY product_line
ORDER BY revenue DESC
LIMIT 1; -- Food and beverages generated the highest revenue


-- 9. In which city was the highest revenue recorded?
SELECT distinct city, SUM(total) AS revenue
FROM amazondata
GROUP BY city
ORDER BY revenue DESC
LIMIT 1; -- Naypyitaw was the highest revenue recorded

-- 10. Which product line incurred the highest Value Added Tax?
SELECT DISTINCT product_line, SUM(VAT) AS total_vat
FROM amazondata
GROUP BY product_line
ORDER BY total_vat DESC
LIMIT 1 ; -- Food and beverages incurred the highest Value Added Tax with a whopping amount of 2673.5640

-- For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
WITH salesdata AS 
    (
	SELECT product_line, SUM(total) AS total_sales
    FROM amazondata
    GROUP BY product_line
    ),
    avg_sales_data AS 
    (
    SELECT  AVG(total_sales) AS avg_sales
    FROM salesdata
    )
    SELECT product_line, total_sales, 
    CASE 
     WHEN total_sales > (SELECT avg_sales FROM avg_sales_data) THEN "GOOD"
     ELSE "BAD"
    END AS performance
    FROM salesdata
    ORDER BY total_sales DESC; -- Health and beauty are underperforming than other product lines
    

-- 11. Identify the branch that exceeded the average number of products sold.
WITH branch_sales AS(
 SELECT branch,SUM(quantity) AS total_quantity
 FROM amazondata 
 GROUP BY branch),
 average_sales AS (
   SELECT AVG(total_quantity) AS avg_quantity FROM branch_sales)
   SELECT branch, total_quantity  FROM branch_sales 
   WHERE total_quantity > (SELECT AVG(total_quantity) FROM branch_sales);
      
-- 12. Which product line is most frequently associated with each gender?
WITH count_gender AS(
                   SELECT product_line, gender, COUNT(gender),
				   ROW_NUMBER() OVER(PARTITION BY gender ORDER BY COUNT(gender) DESC) AS row_num
                   FROM amazondata
                   GROUP BY product_line, gender)
			SELECT * FROM count_gender
            WHERE row_num = 1;

-- 13. Calculate the average rating for each product line.
SELECT product_line, AVG(rating) AS avg_rating
FROM amazondata
GROUP BY product_line
ORDER BY avg_rating DESC;

-- 14. Count the sales occurrences for each time of day on every weekday.
SELECT dayname, timeofday, COUNT(quantity) AS total_sales
FROM amazondata
GROUP BY dayname, timeofday
ORDER BY 
 FIELD(dayname,"monday","tuesday","wednesday","thursday","friday","saturday","sunday"),
 FIELD(timeofday,'morning','afternoon','evening');

-- 15. Identify the customer type contributing the highest revenue.
SELECT customer_type, SUM(cogs) AS highest_revenue
FROM amazondata
GROUP BY customer_type
ORDER BY highest_revenue DESC
LIMIT 1; 

-- 16. Determine the city with the highest VAT percentage.
SELECT city, (SUM(VAT)/SUM(total))*100 AS VAT_perc 
FROM amazondata 
GROUP BY city
Order by VAT_perc DESC;

-- 17. Identify the customer type with the highest VAT payments.
SELECT customer_type, SUM(VAT) AS total_VAT
FROM amazondata
GROUP BY customer_type
ORDER BY total_VAT DESC
LIMIT 1;


-- 18. What is the count of distinct customer types in the dataset?
SELECT COUNT(DISTINCT customer_type) AS no_of_cust_types FROM amazondata;

-- 19. What is the count of distinct payment methods in the dataset?
SELECT COUNT(DISTINCT payment_method) AS no_of_cust_types FROM amazondata;

-- 20. Which customer type occurs most frequently?
SELECT customer_type, COUNT(customer_type)
FROM amazondata 
GROUP BY customer_type; -- Member occurs most frequently

-- 21. Identify the customer type with the highest purchase frequency.
SELECT customer_type, COUNT(invoice_id) AS purchase_freq
FROM amazondata
GROUP BY customer_type
ORDER BY purchase_freq DESC LIMIT 1; -- member has the highest purchase frequency

-- 22. Determine the predominant gender among customers.
SELECT gender, COUNT(gender) AS count_gender
FROM amazondata
GROUP BY gender
ORDER BY count_gender DESC; -- Male is the predominant gender among customers

-- 23. Examine the distribution of genders within each branch.
SELECT branch, gender, COUNT(gender) AS count_gender
FROM amazondata 
GROUP BY branch, gender
ORDER BY branch,gender;

-- 24. Identify the time of day when customers provide the most ratings.
SELECT timeofday, COUNT(timeofday) AS cust_ratings
FROM amazondata
GROUP BY timeofday
ORDER BY cust_ratings DESC; -- In afternoon most of the customers provide their ratings

-- 25. Determine the time of day with the highest customer ratings for each branch.
SELECT branch, timeofday, COUNT(timeofday) AS no_of_ratings
FROM amazondata
GROUP BY branch, timeofday
ORDER BY no_of_ratings DESC
LIMIT 3;

-- 26. Identify the day of the week with the highest average ratings.
SELECT dayname, AVG(rating) AS avg_ratings
FROM amazondata
GROUP BY dayname 
ORDER BY avg_ratings DESC
LIMIT 1 ;

-- 27. Determine the day of the week with the highest average ratings for each branch.
SELECT branch, dayname, AVG(rating) AS avg_rating
FROM amazondata
GROUP BY branch, dayname
ORDER BY avg_rating DESC
LIMIT 3 ;
