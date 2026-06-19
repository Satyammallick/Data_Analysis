CREATE DATABASE apple;

use apple;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
salary INT 
);

INSERT INTO employee
(id,name,salary)
values
(1,"Adam",25000),
(2,"Bob",30000),
(3,"Adam",40000);

SELECT * FROM employee;