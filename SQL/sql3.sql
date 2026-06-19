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
       
       
       
       
    ************#WINDOW_FUNCTIONS---Over (Partition by)
       
       SELECT id,dept,salary,
       AVG(salary) OVER() AS company_avg_sal,
       AVG(salary) OVER(PARTITION BY dept) AS dept_avg_sal 
       FROM employee;
       
        SELECT id,dept,salary,
       SUM(salary) OVER() AS total_payout,
       SUM(salary) OVER(PARTITION BY dept) AS dept_payout
       FROM employee;
       
       
       SELECT dept,id
       FROM employee
       GROUP BY dept;
       
       
       
          SELECT id,dept,salary,
		COUNT(dept) OVER(PARTITION BY dept) AS dept_emp_count
        FROM employee;
        
        
        **********#Over (Partition by Order By)
        
        
          SELECT id,dept,salary,
          SUM(salary) OVER() AS total_payout,
          SUM(salary) OVER(PARTITION BY dept) AS total_dept_payout,
       SUM(salary) OVER(PARTITION BY dept ORDER BY salary DESC) AS rolling_dept_payout,
		SUM(salary) OVER(PARTITION BY dept ORDER BY salary) AS rolling_dept_payout1
       FROM employee;
        
        
        SELECT id,dept,salary,
        MIN(salary) OVER() AS min_sal,
        MIN(salary) OVER(PARTITION BY dept) AS dept_min_sal,
        MIN(salary) OVER(PARTITION BY dept ORDER BY salary DESC) as rolling_min

        FROM employee;
        
        
       
       SELECT *,
               MIN(salary) OVER(PARTITION BY dept ORDER BY salary ) as rolling_min1
               FROM employee;
       
       
       
       ***********#Rank() OVER()
       
       
       
	
       