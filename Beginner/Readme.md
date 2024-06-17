> # What is SQL ?
Structured Query Language is a language used to interact with database which contains data in structured format in tables.

It is used to :

    * Create Data
    * Retrieve Data
    * Update Data
    * Delete Data
    
> # What is Database ?
Database is a collection of schemas which helps in organising the tables which in turn contains data.

Database management systems allow users to interact with database through SQL.All DBMS have slightly different dialects.
PostgreSQL is closest to Standard SQL.

Different Database Management System examples :

      * MySQL
      * PostgreSQL
      * MariaDM
      * Microsoft SQL Server
      * MongoDB

> # Database Example : GreenCycles
> > GreenCycles online movie rental company has a collection of tables and as a data analyst you need to analyse the data in these table and gain insights to help business make decision and grow business.

Normally to show all the tables in the DATABASE we have a command :

      SHOW TABLES;
            
But in PLSQL it does not work like that so we can use altername method.

       SELECT *
       FROM pg_catalog.pg_tables
       WHERE schemaname NOT IN ('pg_catalog' ,'information_schema');

Following is the output for the same.
<p align="center">
<img width="500" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/637c3ff0-e9dd-4bf5-b7cb-4dc3546dcf7f">
</p>

> #### Selecting all the data in the table actor :
> > SELECT * FROM actor;
> #### Selecting some columns from the table actor :
> > SELECT first_name,last_name FROM actor;
> #### Selecting some rows from the table actor :
> > SELECT * FROM actor LIMIT 10;

### Task Example - 1 :

The Marketing Manager asks you for a list of all customers with first name,last name and customer's email address :
<p align="center">
<img width="417" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/415a1288-94a8-4602-8e6b-a00627b47984">
</p>

### Task Example - 2 :
The marketing manager has asked you to fetch highest amount paid by each customer.

There are two ways to go about this.
1- Simple way would be to use order by on customer column and amount column and fetch the data from payment table.
      
      SELECT * FROM public.payment ORDER BY customer_id,amount DESC
<p align="center">
<img width="451" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/779a7095-4b31-4284-b3f4-7eb9eec681c0">
</p>
2- Use group by (advanced) to fetch maximum amount for each customer.

      SELECT customer_id,MAX(amount) AS max_amount FROM payment GROUP BY customer_id ORDER BY customer_id
<p align="center">
<img width="451" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/f9618296-54ec-4ddc-9f70-66d175ae0f63">
</p>

### Task Example - 3 :

The marketing manager has asked you to order the customer list by last name in 'Z' to 'A' order and in case of same last name order should be based on first name also from 'Z' to 'A'.

<p align="center">
<img width="400" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/73360787-2a26-43dd-bc54-af3c14ac7b3c">
</p>

> #### Removing Duplicates
> > SELECT DISTINCT first_name,last_name FROM actor ORDER BY first_name;

> > SELECT DISTINCT rating from film;

### Task Example - 4 :

The marketing team member asks you about the different prices that have been paid.To make it easier for them order the prices from high to low.

<p align='center'>
   <img width="486" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/2fba7780-32d6-4ee8-926c-92a46e76a419">
</p>

> Limiting the number of rows :
> > Figuring out what are the last 10 rentals ?
<p align ='center'>
   <img width="705" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/9bc57ed7-4f69-492e-9549-0d35f39dffe8">

</p>

> ### Filtering in SQL : Use of WHERE Clause
> > In SQL we can narrow down the number of rows using WHERE clause.

      SELECT * FROM payment WHERE customer_id = 100;
      SELECT first_name,last_name FROM customer WHERE first_name IS NOT NULL;

### Task Example - 5 :

The inventory manager is asking how many rentals have not been returned yet i.e. return date is null.

<p align ='center'>
   <img width="404" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/fca68168-37b4-4cc4-9600-f3590a094084">

</p>

### Task Example - 6 :
The Sales manager asks you for all the payment ids for which the amount is less than 2 dollars.

<p align = 'center'>
   <img width="548" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/a7c9ff37-c98b-410a-a744-70147ca29caa">
</p>

### Task Example - 7 :

How many movies are there that have 'Documentary' in the description?

<p align = 'center'>
<img width="563" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/fdcc472a-7c0d-409b-ad34-441507c823e6">
</p>

### Task Example - 8 :

How many customers are there with first name that is 3 charecters long and last name ending with 'X' or 'Y'?

<p align = 'center'>
   <img width="602" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/12b8edd1-dc46-4058-84d7-efabb34a9792">

</p>

> ### Group By And Having
> > Aggregating data based on certain criteria.

      1- SUM()
      2- AVG()
      3- MAX()
      4- MIN()
      5- COUNT()

We cannot combine non - aggregated column with aggregated column in select statement.When using non-aggregated column along with aggregated column in select statement the non aggregated column should be included in groupby.

      SELECT SUM(amount), ROUND(AVG(amount),2) FROM payment;

<p align = 'center'>
      <img width="464" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/1c1a5bcf-86c8-45da-8c7d-9debb57dcdcb">
</p>

### Task Example - 9 :
Your manager wants to get a better understanding of the films and he wants to know the minimum,maximum,average,sum of replacement cost of the films.

<p align = 'center'>
<img width="573" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/cea2ab68-582a-485d-9422-7bbce0aeb534">
</p>

### Using Group By

      SELECT customer_id,SUM(amount) from payment GROUP BY customer_id

### Task Example - 10 :

Your manager wants to know which of the two employees is responsible for more payments?
Which of the two is responsible for a higher overall payment amount?
How do these amounts change if we dont consider amounts.

<p align = 'center'>
<img width="450" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/e8b3c4ca-03ea-408b-adef-bce962993c6e">
</p>

### Group By Using Multiple Columns

<p align = 'center'><img width="341" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/3212b2d5-398f-43d7-851c-6fcc043361f0">
</p>

### Task Example - 11 :
Which employee has the highest sales amount in a single day?Which employee has the most sales in a single day(not counting the payments with amount = 0)?

<p align = 'center'><img width="398" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/28d7246b-4f11-449b-9657-20b690412e91"></p>

<p align = 'center'><img width="649" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/e1e664bc-35e0-4476-ae33-1b233b7dc310">

</p>

> ### Having Clause
> > Filter groupings by aggregations ex: Having count(*) > 400

### Task Example - 12 :
In April 2020,28,29 and 30 we had high revenues so we want to focus on these days.
Find out what is average payment amount grouped by customer and day - consider only days/customer with more than one payment(per customer per day)
<p align = 'center'><img width="641" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/2654369d-cfc8-4ec0-8904-2617287b7e05">
</p>
