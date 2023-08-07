-- Q1
/*Retrieve all employee who lives in cairo and were born in the 90's 
*/
SELECT concat(FName, " ", LName) AS Employee_name, concat(day, "-",month, "-", year) 
AS Birth_date, concat(street, ",", postalcode, ",",city) AS Address
FROM   employee
WHERE  city LIKE '%Cairo%'  AND  year LIKE '199%'  -- in the 90's 
ORDER BY Employee_name;



-- Q2
/*Retrieve bill number, product id, Product_name, order date, quantity, and the total 
price that occurred after the start of 2022
*/
SELECT   bill_id, product.prod_id AS Product_id, prod_name AS Product_name,bill_date AS Order_date, quantity,
         ((quantity * price)-discount) AS Total_price
FROM    bill_out  INNER JOIN bill_body_out
			   ON bill_id = bill_out_id
               INNER JOIN product
               ON bill_body_out.prod_id = product.prod_id
WHERE    bill_date >= '2022-01-01'  
ORDER BY Total_price DESC;


-- Q3
/*Retrieve all suppliers lives in Giza
*/
SELECT  concat(FName, " ", LName) AS Supplier_name, concat(street, ",", postalcode, ",",city) AS Address
FROM     supplier 
WHERE  city LIKE '%Giza%' 
ORDER BY Supplier_name;




-- Q4
/*Retrieve bill number, product id, order date, Product_name, quantity, and the total 
price of orders exceeds 1000L.E.
*/
SELECT   bill_id, product.prod_id AS Product_id, prod_name AS Product_name,bill_date AS Order_date, quantity,
         ((quantity * price)-discount) AS Total_price
FROM    bill_out  INNER JOIN bill_body_in
			   ON bill_id = bill_in_id
               INNER JOIN product
               ON bill_body_in.prod_id = product.prod_id
WHERE    ((quantity * price)-discount) >= '1000'  
ORDER BY Total_price DESC;


-- Q5
/*Retrieve all customers class A
*/
SELECT   concat(FName, " ", LName) AS Supplier_name,
concat(street, ",", postalcode, ",",city) AS Address,
gender,phone,email
FROM   customer 
WHERE  potential LIKE 'A' 
ORDER BY Supplier_name;

-- Q5
/*Retrieve number of sales for each product 
*/
select prod_id , count(*) as no_of_sales
from bill_body_out
group by prod_id;