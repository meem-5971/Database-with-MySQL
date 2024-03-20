use myfirst;
/*Create a table of Employees which has the following fields
    First Name
Last Name
Date of Birth
Department Id
Salary
Create a table of Departments which has the following fields
Department Id
Department Name
Create both of the tables using proper constraints
*/
CREATE TABLE EMPLOYEES
(
FIRST_NAME VARCHAR(10),
LAST_NAME VARCHAR(10),
DOB DATE,
DEPARTMENT_ID CHAR(4),
SALARY INT,
PRIMARY KEY(DEPARTMENT_ID,FIRST_NAME)
);

CREATE TABLE DEPARTMENT
(
DEPARTMENT_NAME VARCHAR(6),
DEPARTMENT_ID CHAR(4),
FOREIGN KEY (DEPARTMENT_ID) REFERENCES EMPLOYEES(DEPARTMENT_ID)
);

USE DUMMYDB;
#Write SQL Query to get the second max salary
 SELECT DISTINCT SALARY
 FROM EMPLOYEES
 WHERE SALARY = (
				SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE SALARY < (SELECT MAX(SALARY)
								FROM EMPLOYEES
                                )
				);
                
#Write SQL Query to show  the department names and the average salary of the departments
SELECT DEPARTMENT_NAME, AVG(SALARY)
FROM DEPARTMENTS d
JOIN EMPLOYEES e
ON d.DEPARTMENT_ID=e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME;

#Show the names of the employees who get less salary than Steven
SELECT *
FROM EMPLOYEES e
JOIN EMPLOYEES  s ON s.FIRST_NAME = 'Steven'
WHERE e.SALARY < s.SALARY;

#Count the number of employees of each job type
SELECT job_ID, COUNT(*) AS employee_count
FROM EMPLOYEES
GROUP BY job_ID;

#Show the names of Departments which doesn’t have any employees
SELECT DEPARTMENTS.DEPARTMENT_NAME
FROM DEPARTMENTS
LEFT JOIN EMPLOYEES
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
WHERE EMPLOYEES.DEPARTMENT_ID IS NULL;
