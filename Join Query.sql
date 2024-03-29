use dummydb;

#joining table without join query
SELECT EMPLOYEES.FIRST_NAME,DEPARTMENTS.DEPARTMENT_NAME,EMPLOYEES.DEPARTMENT_ID
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

#JOINING TABLE WITH JOIN QUERY (THE COMPLEXITY IS LESS)
SELECT EMPLOYEES.FIRST_NAME,DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

#SHORTCUT JOIN QUERY(NOT RECOMMENDED)
SELECT EMPLOYEES.FIRST_NAME,DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID);

#LEFT,RIGHT.CROSS.INNER 
SELECT EMPLOYEES.FIRST_NAME,DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
 LEFT JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID; -- KEYWORD IN FRONT OF JOIN
 
 #SELF JOIN QUERY
 SELECT *
FROM EMPLOYEES AS E
JOIN EMPLOYEES AS M ON E.EMPLOYEE_ID=M.EMPLOYEE_ID;

-- -- PRACTICE -- --
#PRINT EMPLOYEE NAME AND THEIR MANAGER NAME
SELECT m.FIRST_NAME,e.FIRST_NAME
FROM EMPLOYEES AS e
JOIN EMPLOYEES AS m
ON e.EMPLOYEE_ID=m.MANAGER_ID;

#THOSE DEPARTMENTS WHICH DO NOT HAVE ANY EMPLOYEE
SELECT DEPARTMENTS.DEPARTMENT_NAME
FROM DEPARTMENTS
LEFT JOIN EMPLOYEES
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
WHERE EMPLOYEES.DEPARTMENT_ID IS NULL;

#THOSE EMPLOYEES WHO HAVE LESSES SALARY THEN THEIR DEPARTMENTAL AVERAGE SALARY
SELECT EMPLOYEES.FIRST_NAME,
		EMPLOYEES.SALARY,
        (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID= EMPLOYEES.DEPARTMENT_ID) -EMPLOYEES.SALARY
FROM EMPLOYEES
	JOIN DEPARTMENTS
    ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;
    
#THOSE DEPARTMENTS WHOSE AVG SALARY >800
SELECT DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
HAVING AVG(SALARY)>800;        
