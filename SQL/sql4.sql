CREATE DATABASE school ;
 
 USE school;
 
 CREATE TABLE student(
 roll_no INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(10)
 );
 
 
 
 
 CREATE TABLE dept(
 id INT PRIMARY KEY,
 name VARCHAR(50)
 );
 
   
   
   INSERT INTO dept 
   VALUES(101,"Science"),
         (102,"Arts"),
         (103,"Commerce");
 
 UPDATE dept
 SET id=100
 WHERE id=101 ;
 
 SELECT *FROM dept;
 
 
 
 
 

 
 CREATE TABLE teacher(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 FOREIGN KEY(dept_id) REFERENCES dept(id)
 ON UPDATE CASCADE
 ON DELETE CASCADE
 
 );
 
  INSERT INTO teacher
  VALUES (10,"Bob",102),
         (11,"Alice",101),
         (12,"Casey",103),
         (14,"Satyam",101);
 
 
 SELECT *FROM teacher;
 
 
 
 
 
 
 
INSERT INTO student 
   (roll_no,name,marks,grade,city)
   VALUES (1,"Anil",78,"C","Pune"),
          (2,"Bhumika",93,"A","Mumbai"),
          (3,"satyam",98,"o","Mumbai");
          
  INSERT INTO student VALUES(4,"Sipun",100,"O","Delhi");
  INSERT INTO student VALUES(5,"Ram",99,"O","Delhi");
  
  
  
  
  
  
	SELECT city,COUNT(name)
	FROM student
	GROUP BY city
	HAVING MAX(marks) >90;
    
    
 SET SQL_SAFE_UPDATES=0;
 
UPDATE student
SET grade="A"
WHERE  grade="c" ; 

SELECT *FROM student;

ALTER TABLE student
ADD COLUMN age INT NOT  NULL DEFAULT 18;

ALTER TABLE student
DROP COLUMN age;
 
 
ALTER TABLE children
RENAME TO student;


ALTER TABLE student
CHANGE COLUMN roll_no id ;



ALTER TABLE student
 CHANGE name full_name VARCHAR(10);

DELETE FROM student
WHERE marks<95;

SET SQL_SAFE_UPDATES = 1;
  
  
  SELECT *FROM student;
  
ALTER TABLE student
DROP COLUMN grade;


#sql subquery
--Eg:-1

#1st step:-
SELECT AVG(marks)
FROM student;

#2nd step:-
SELECT name,marks
FROM student
WHERE marks > 93.6 ; 

#Combined step

SELECT name,marks
FROM student
WHERE marks > 
(SELECT AVG(marks)FROM student);



--Eg:-2

--1st step

SELECT roll_no
FROM student
WHERE roll_no % 2=0;


--2nd step

SELECT name
FROM student 
WHERE roll_no IN(2,4);


--combined step

SELECT name,roll_no
FROM student 
WHERE roll_no IN
(
    SELECT roll_no
	FROM student
	WHERE roll_no % 2=0
    );
    
    --Eg:-3
    
    --1st step
    SELECT *
    FROM student
    WHERE city="Delhi";
    
    --2nd step
    SELECT MAX(marks)
    FROM student
    WHERE city="Delhi";
    
    --combined step 
    
	SELECT MAX(marks)
    FROM(SELECT *
    FROM student
    WHERE city="Delhi") AS temp;
 
--Simplified version

SELECT MAX(marks)
FROM student
WHERE city="Delhi";

SELECT(SELECT MAX(marks) FROM student),name
FROM student;

CREATE VIEW v1 AS 
SELECT roll_no,name
FROM student;

SELECT *FROM v1;

