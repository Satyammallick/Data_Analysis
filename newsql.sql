create database college;

use college;

DROP TABLE student;

CREATE TABLE student(
stud_id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(stud_id,name)
VALUES 
(101,"Adam"),
(102,"Bob"),
(103,"Casey");

SELECT * FROM student;



CREATE TABLE course(
stud_id INT PRIMARY KEY,
course_name VARCHAR(50)
);


INSERT INTO course
(stud_id,course_name)
VALUES 
(102,"English"),
(105,"Math"),
(103,"science"),
(107,"Bio");

SELECT *FROM course;

SELECT *
FROM student as a
INNER JOIN course as b
ON a.stud_id=b.stud_id;



SELECT *
FROM student as a
LEFT JOIN course as b
ON a.stud_id=b.stud_id;


SELECT *
FROM student as a
RIGHT JOIN course as b
ON a.stud_id=b.stud_id;


SELECT *
FROM student as a
LEFT JOIN course as b
ON a.stud_id=b.stud_id
UNION
SELECT *
FROM student as a
RIGHT JOIN course as b
ON a.stud_id=b.stud_id;


SELECT *
FROM student as a
LEFT JOIN course as b
ON a.stud_id=b.stud_id
WHERE b.stud_id IS NULL;

SELECT *
FROM student as a
RIGHT JOIN course as b
ON a.stud_id=b.stud_id
WHERE a.stud_id IS NULL;


SELECT *
FROM student as a
JOIN student as b
ON a.stud_id=b.stud_id;