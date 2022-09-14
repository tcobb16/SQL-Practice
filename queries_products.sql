-- Comments in SQL Start with dash-dash --

-- 1. add chair product
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, 'true');
-- INSERT 0 1

-- 2. Add stool product
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, 'false');
-- INSERT 0 1

-- 3. Add table product
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, 'false');
-- INSERT 0 1

-- 4. Display columns and rows of table
products_db=# SELECT * FROM products;
-- id | name  | price | can_be_returned 
----+-------+-------+-----------------
--  1 | chair |    44 | t
--  2 | stool | 25.99 | f
--  3 | table |   124 | f
--(3 rows)

--5. Display only the names of products
products_db=# SELECT name FROM products;
-- name  
-------
-- chair
-- stool
-- table
--(3 rows)

--6. Display names and prices
products_db=# SELECT name,price  FROM products;
-- name  | price 
-------+-------
-- chair |    44
-- stool | 25.99
-- table |   124
--(3 rows)

--7. Add new product of my choice
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('futon', 250.00, 'false');
--INSERT 0 1

--8. Display only products that can be returned
products_db=# SELECT * FROM products WHERE can_be_returned = 'true';
-- id | name  | price | can_be_returned 
----+-------+-------+-----------------
--  1 | chair |    44 | t
--(1 row)

-- 9. Show products that are less than $44
products_db=# SELECT * FROM products WHERE price < 44.00;
-- id | name  | price | can_be_returned 
----+-------+-------+-----------------
--  2 | stool | 25.99 | f
--(1 row)

-- 10. Show products between 22.50 and 99.99
products_db=# SELECT * FROM products WHERE price > 22.50 AND price < 99.99;
-- id | name  | price | can_be_returned 
----+-------+-------+-----------------
--  1 | chair |    44 | t
--  2 | stool | 25.99 | f
--(2 rows)

--11. Decrease all prices by 20
products_db=# UPDATE products SET price = price - 20;
--UPDATE 4

--12. Remove all products that are less than 25
products_db=# DELETE FROM products WHERE price < 25;
--DELETE 2

--13. Increase all prices by 20
products_db=# UPDATE products SET price = price + 20;
--UPDATE 2

--14. Make all products returnable
products_db=# UPDATE products SET can_be_returned = 't';
--UPDATE 2

