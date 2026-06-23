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

22.--------
























