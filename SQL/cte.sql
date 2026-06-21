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
       
       
    
       
