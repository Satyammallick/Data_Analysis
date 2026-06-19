
create database college;

USE college;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

SELECT *FROM student;

INSERT INTO student
(id,name)
VALUES
(100,"SATYAM"),
(101,"SIPUN");

INSERT INTO student VALUES(102,"LEO");
