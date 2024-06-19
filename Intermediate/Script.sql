-- Text Functions

SELECT 
UPPER(email) AS email_upper
,LOWER(email) AS email_lower
,LENGTH(email) AS email_length
FROM CUSTOMER
WHERE LENGTH(email) < 30;

-- Extracting Part of String
SELECT 
LEFT(email,LENGTH(first_name)),RIGHT(email,5)
,LEFT(RIGHT(email,4),1)
FROM customer;

-- Concatenating Strings
SELECT 
LEFT(first_name,1) || '.'|| LEFT(last_name,1)
FROM customer;

-- Annonymising the emails
SELECT email,LEFT(email,1) || '***' || RIGHT(email,19) AS email_masked from customer;

--Search for one specific string
SELECT LEFT(email,POSITION('@' IN email)-1) from customer;

SELECT LEFT(email,POSITION('.' in email)-1) || ' ' || last_name as FULL_NAME from customer;

--Substring to extract text from string
-- Substring(string from start [for length])
SELECT SUBSTRING(email from POSITION('@' in email)) from customer;

-- Anonymised form of email
select left(email,1) || '***' || SUBSTRING(email from position('.' in email)  for 2) || '***'
|| SUBSTRING(email from POSITION('@' in email))from customer; 

select '***' || RIGHT(left(email,position('.' in email)),2) 
|| '***' || RIGHT(left(email,position('@' in email)),2) 
|| SUBSTRING(email from POSITION('@' in email)+1) from customer ;

--- Working with Timestamps
-- Date datatype 2022-11-28
-- Time '01:02:03.678'
-- Timestamp 2022-11-28 01:02:03.678
-- Intervals 3 days
SELECT EXTRACT('DAY' from rental_date),COUNT(*) FROM rental
GROUP BY EXTRACT('DAY' from rental_date)
ORDER BY COUNT(*) DESC;

SELECT EXTRACT('MONTH' FROM payment_date),SUM(amount) from payment
GROUP BY EXTRACT('MONTH' FROM payment_date)
ORDER BY SUM(amount) DESC;

SELECT EXTRACT('DOW' FROM payment_date),SUM(amount) from payment
GROUP BY EXTRACT('DOW' FROM payment_date)
ORDER BY SUM(amount) DESC;

SELECT EXTRACT('WEEK' FROM payment_date),customer_id,SUM(amount) from payment
GROUP BY EXTRACT('WEEK' FROM payment_date),customer_id
ORDER BY SUM(amount) DESC;

--- Extracting from timestamp/date/num in specific format
--To_CHAR 
SELECT * ,EXTRACT('MONTH' from payment_date),TO_CHAR(payment_date,'DY MON YYYY') FROM payment;

--- Timestamps and Interval
SELECT CURRENT_DATE;

SELECT CURRENT_TIMESTAMP;

SELECT EXTRACT('DAY' FROM return_date - rental_date) FROM rental;

SELECT EXTRACT('DAY' FROM return_date - rental_date)*24 + EXTRACT('HOUR' FROM return_date - rental_date) || ' hours' FROM rental;

SELECT customer_id , AVG(return_date - rental_date) AS return_duration FROM rental GROUP BY customer_id ORDER BY AVG(return_date - rental_date) DESC; 