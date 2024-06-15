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

> # Database Example
> > Green cycle online movie rental company has a collection of tables and as a data analyst you need to analyse the data in these table and gain insights to help business make decision and grow business.

Normally to show all the tables in the DATABASE we have a command :
SHOW TABLES;

But in PLSQL it does not work like that so we can use altername method.

            SELECT *
            FROM pg_catalog.pg_tables
            WHERE schemaname NOT IN ('pg_catalog' ,'information_schema');

Following is the output for the same.

<img width="417" alt="image" src="https://github.com/ipsita-panda-portfolio/Complete-SQL-With-Projects/assets/172842419/637c3ff0-e9dd-4bf5-b7cb-4dc3546dcf7f">

