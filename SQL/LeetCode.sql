1.--------------Combine two tables--------------

SELECT firstname,lastname,city,state
FROM Person p
LEFT JOIN Address a
ON p.personId=a.personId;


2.---------Employees Earning more than their managers--

SELECT a.name AS Employee
FROM Employee  a
 JOIN Employee  b
ON a.managerId=b.id
WHERE a.salary>b.salary;

3.-------------Report All the duplicate Emais----

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(id) > 1;

4.-----Customer Who never Ordered-----

SELECT c.name AS Customers
FROM Customers c
WHERE c.name NOT IN (

SELECT a.name
FROM Customers a
INNER JOIN Orders b
ON a.id=b.customerId)
;

5.---------Delete Duplicate Emails----

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;

6.---------Rising Temp.-----

SELECT a.id AS Id
FROM Weather a
JOIN Weather b
ON DATEDIFF(a.recordDate,b.recorddate)=1
WHERE a.temperature > b.temperature ;

7.------Game Play Analysis----

SELECT player_id,MIN(event_date) AS first_login
FROM activity
GROUP BY player_id;

8.--------Employee Bonus-----

SELECT e.name,b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId 
WHERE b.bonus < 1000 OR b.bonus IS NULL;

9.---------Find Customer Referee---

SELECT name
FROM customer 
WHERE referee_id !=2 OR referee_id IS NULL;

10.-------Customer Placing Largest No of orders-----

SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

11.--------Big Countries------

SELECT name,population,area
FROM world
WHERE area >= 3000000 OR population >= 25000000;

12.-----Classes With Atleast 5 students-------

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >=5 ;

13.---Sales Person------

SELECT salesperson.name
FROM Salesperson 
WHERE sales_id NOT IN(
SELECT o.sales_id
FROM company c 
 JOIN orders o
ON c.com_id = o.com_id AND name = "RED");

14.--------Triangle Judgement-------

SELECT x,y,z,
CASE 
WHEN x+y>z AND y+z>x AND z+x>y
THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle;

15.------Biggest Single Number----

SELECT MAX(num) AS num
FROM (

SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num)=1 ) AS temp;

16.-------Not Boring Movies----

SELECT *
FROM cinema
WHERE id % 2 =1 AND description !="boring"
ORDER BY rating DESC;

17.--------Swap Sex of Employees----

UPDATE salary
SET sex= CASE 
         WHEN sex='m' THEN 'f'
         WHEN sex='f' THEN 'm'
         END;

18.---------Actors and Directors Who Cooperated At Least Three Times----

SELECT actor_id , director_id
FROM ActorDirector
GROUP BY actor_id , director_id
HAVING COUNT(*) >=3;

19.--------Product Analysis---

SELECT product_name,year,price 
FROM sales s
LEFT JOIN product p
ON s.product_id=p.product_id;

20.------Project Employees----

SELECT project_id,ROUND(AVG(experience_years),2) AS average_years
FROM project p
INNER JOIN employee e
ON p.employee_id=e.employee_id
GROUP BY project_id;

21.-----Sales Analysis----

SELECT p.product_id,product_name
FROM product p 
INNER JOIN sales s
ON p.product_id= s.product_id 
GROUP BY s.product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';

22.--------Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively.
 
SELECT activity_date as day , COUNT(DISTINCT(user_id as active_user))
FROM activity
WHERE activity_date BETWEEN '2019-06-27' AND '2019-07-27'
GROUP BY activity_date ;

23.---------Write a solution to find all the authors that viewed at least one of their own articles.

SELECT DISTINCT(author_id) AS id
FROM views
WHERE author_id = viewer_id
ORDER BY author_id ASC;


24.---------Second Highest Salary

 SELECT
 (
SELECT DISTINCT(salary) 
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1 )
AS SecondHighestSalary ;

25.--------------Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N=N-1;
  RETURN (
      # Write your MySQL query statement below.
   
    SELECT DISTINCT(salary) 
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET N 
  );
END

 
--syntax:-

CREATE FUNCTION function_name(parameter datatype)
RETURNS return_datatype
BEGIN

    -- statements

    RETURN (
        SELECT ...
    );

END

26.----------Rank Scores---------

SELECT score ,
DENSE_RANK() OVER(ORDER BY score DESC) as 'rank'
FROM Scores 
ORDER BY score DESC;

27.---------- Consecutive Numbers----------

SELECT DISTINCT num AS ConsecutiveNums
FROM
(
SELECT 
LAG(id) OVER(ORDER BY id) AS previous_id,
id,
LEAD(id) OVER (ORDER BY id) AS next_id,
LAG(num) OVER(ORDER BY id) AS previous_num,
num,
LEAD(num) OVER (ORDER BY id) AS next_num 
FROM logs
 ) subquery
WHERE num = previous_name
AND num = next_num
AND next_id - id = 1
AND id - previous_id = 1 ;


28.---------Replace Employee ID With The Unique Identifier-----

SELECT e2.unique_id,name
FROM Employees e1
LEFT JOIN EmployeeUNI e2
ON e1.id=e2.id ;

29.--------Recyclable and Low Fat Products-----

SELECT product_id
FROM products
WHERE low_fats = 'Y' 
 AND recyclable ='Y' ;

30.----------Customer Who Visited but Did Not Make Any Transactions-----

SELECT v.customer_id ,COUNT(customer_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY customer_id;

31.------------Average Time of Process per Machine---

 
SELECT a.machine_id , ROUND(AVG(b.timestamp-a.timestamp) , 3) AS processing_time
FROM activity a
JOIN activity b
ON a.machine_id = b.machine_id
AND a.process_id = b.process_id
WHERE a.activity_type = "start" AND b. activity_type ="end"
GROUP BY machine_id ;

32.-------------Students and Examinations-----------

SELECT st.student_id , st.student_name ,su.subject_name,COUNT(e.student_id) AS attended_exams
FROM students st
CROSS JOIN subjects su
LEFT JOIN examinations e
ON st.student_id = e.student_id AND su.subject_name = e.subject_name
GROUP BY st.student_id , st.student_name , su.subject_name
ORDER BY st.student_id , st.student_name , su.subject_name ;

33.------------Confirmation Rate----------

SELECT s.user_id , ROUND(AVG(IF(c.action='confirmed' , 1 ,0)),2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id 
GROUP BY c.user_id ;

34.----------- Average Selling Price----------

SELECT p.product_id, ROUND(SUM(units * price) / SUM(units),2) AS average_price
FROM prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id 
WHERE u.purchase_date BETWEEN start_date and end_date
GROUP BY product_id;


35.----------Percentage of Users Attended a Contest-------

SELECT contest_id , ROUND
(
    COUNT(contest_id) / (SELECT COUNT(*) FROM users ) * 100 , 2
) AS percentage
FROM users u
LEFT JOIN register r
ON u.user_id = r.user_id
GROUP BY contest_id 
ORDER BY percentage DESC , contest_id ASC;  







