CREATE DATABASE google;

use google;


CREATE TABLE employee(
id INT PRIMARY KEY,
dept VARCHAR(50),
salary INT
);

INSERT INTO employee 
VALUES (1,"Sales",25000),
	   (2,"HR",30000),
       (3,"HR",40000),
       (4,"Sales",15000);
       
       SELECT *FROM employee;
       
        
    **********#GROUP_BY
        
       SELECT dept,AVG(salary) 
       FROM employee
       GROUP BY dept; 
       
       
       
       
       
       SELECT *,
       AVG(salary) OVER() AS avg_sal
       FROM employee;
        
        
        SELECT id,dept,salary,
        MIN(salary) OVER() AS min_sal,
        MAX(salary) OVER() AS max_sal,
        AVG(salary) OVER() AS avg_sal
        FROM employee;
        
        
        
        *******COMMON TABLE EXPRESSIONS (CTE)----------
        
       
       SELECT * FROM employee;
       
       *****WITH_CLAUSE()
       
       WITH average_salary(avg_sal) AS
      ( SELECT ROUND(AVG(salary),0) FROM employee)
      SELECT *
      FROM employee e , average_salary a
      WHERE salary > a.avg_sal ;




    ***********Another Example Of WITH_CLAUSE()----------------
       

CREATE TABLE sales(
	store_id  		INT,
	store_name  	VARCHAR(50),
	product			VARCHAR(50),
	quantity		INT,
	cost			INT
);
INSERT INTO sales VALUES
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);

SELECT * FROM sales;
       
---(Q). Find stores whose sales are more than the average sales across all stores.

#1. Total sales per each store----> total_sales

#2. Find the average sales with respect to all the stores ---> avg_sales

#3. Find the Stores where (total_sales > agv_sales of all stores)


    WITH
    total_sales AS (
    SELECT s.store_id , SUM(s.cost) AS total_sales_per_store
    FROM sales s
    GROUP BY s.store_id ),
    avg_sales AS (
    SELECT AVG(total_sales_per_store)  AS avg_sales_for_each_store
    FROM total_sales )
    
SELECT * 
FROM total_sales t
JOIN avg_sales a
ON t.total_sales_per_store > a.avg_sales_for_each_store;
       
    
       
