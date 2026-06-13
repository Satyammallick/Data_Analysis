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
       
        
        #GROUP_BY
        
       SELECT dept,AVG(salary) 
       FROM employee
       GROUP BY dept; 
       
       
       
       
       
       SELECT *,
       AVG(salary) OVER(PARTITION BY dept) AS dept_avg_sal
       FROM employee;
       
       
       
       
       
       #WINDOW_FUNCTIONS
       
       SELECT id,dept,salary,
       AVG(salary) OVER(PARTITION BY dept) AS dept_avg_sal 
       FROM employee;
       