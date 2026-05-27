create database college;

use college;

CREATE TABLE student(
id INT PRIMARY KEY,
name CHAR(50),
age INT NOT NULL
);

INSERT INTO student (id,name,age)
 VALUES (1,"satyam",20),
         (2,"sipun",21),
         (3,"Rishi",22) ;
		
		INSERT INTO student VALUES(4,"Ram",30);
        INSERT INTO student VALUES(5,"Sam",40);
SELECT * FROM student;