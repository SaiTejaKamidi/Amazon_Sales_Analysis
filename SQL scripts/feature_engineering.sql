-- Feature Engineering 

USE amazon;
-- add timeofday column
ALTER TABLE amazon.amazondata 
ADD timeofday varchar(20);

-- SAFE UPDATE ERROR 
SET SQL_SAFE_UPDATES = 0; -- FOR DISABLING
-- SET SQL_SAFE_UPDATES = 1; -- FOR ENABLE

-- Update timeofday column
UPDATE amazon.amazondata
SET timeofday = CASE
    WHEN TIME(Time) BETWEEN '05:00:00' AND '11:59:59' THEN 'morning'
    WHEN TIME(Time) BETWEEN '12:00:00' AND '17:59:59' THEN 'afternoon'
    WHEN TIME(Time) BETWEEN '18:00:00' AND '21:59:59' THEN 'evening'
    ELSE 'night'
END
WHERE timeofday IS NULL;

-- add dayname column
ALTER TABLE amazon.amazondata 
ADD dayname varchar(20);

-- upadte values in dayname column
UPDATE amazon.amazondata
SET dayname = DAYNAME(Date)
WHERE dayname IS NULL;


-- Add monthname column 
ALTER TABLE amazondata 
ADD COLUMN monthname varchar(20);

-- update values in monthname column
UPDATE amazondata
SET monthname = monthname(Date)
WHERE monthname IS NULL;

-- verifying results
SELECT * FROM amazon.amazondata;