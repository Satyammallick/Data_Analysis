CREATE DATABASE google;

use google;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
salary INT
);

INSERT INTO employee 
VALUES (1,"Adam",25000),
	   (2,"Bob",30000),
       (3,"Casey",40000);
       
       SELECT *FROM employee;