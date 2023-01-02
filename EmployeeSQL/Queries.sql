--EMPLOYEES WITH THEIR SALARIES
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.SEX,
	SALARIES.SALARY
FROM EMPLOYEES
INNER JOIN SALARIES ON
EMPLOYEES.EMP_NO = SALARIES.EMP_NO;

--EMPLOYEES HIRED IN 1986
SELECT 
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.HIRE_DATE
FROM EMPLOYEES
WHERE CAST (EMPLOYEES.HIRE_DATE AS VARCHAR) LIKE '1986-%-%';

--MANAGERS WITH THEIR DEPARTMENTS
SELECT
	DEPT_MANAGER.EMP_NO,
	DEPARTMENTS.DEPT_NO,
	DEPARTMENTS.DEPT_NAME,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME
FROM DEPT_MANAGER
INNER JOIN DEPARTMENTS ON (DEPT_MANAGER.DEPT_NO = DEPARTMENTS.DEPT_NO)
INNER JOIN EMPLOYEES ON (DEPT_MANAGER.EMP_NO = EMPLOYEES.EMP_NO);

--EMPLOYEES WITH DEPARTMENT NUMBER AND NAME
SELECT
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPT_EMP.DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
INNER JOIN DEPT_EMP ON (EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO)
INNER JOIN DEPARTMENTS ON (DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO);

--EMPLOYEES WITH THE FIRST NAME HERCULES AND LAST NAME STARTING WITH THE LETTER B
SELECT
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules' AND LAST_NAME LIKE 'B%';

--EMPLOYEES IN THE SALES DEPARTMENT WITH EMPLOYEE NUMBER, LAST NAME AND FIRST NAME
SELECT
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPT_EMP.DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
INNER JOIN DEPT_EMP ON (EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO)
INNER JOIN DEPARTMENTS ON (DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO)
WHERE DEPT_NAME = 'Sales';

--EMPLOYEES IN SALES & DEVELOPMENT DEPARTMENT INCLUDING EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND DEPARTMENT NAME
SELECT
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPT_EMP.DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
INNER JOIN DEPT_EMP ON (EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO)
INNER JOIN DEPARTMENTS ON (DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO)
WHERE DEPT_NAME = 'Sales' OR DEPT_NAME = 'Development';

--EMPLOYEES GROUPED BY FREQUENCY OF LAST NAME SORTED IN DESCENDING ORDER
SELECT
	EMPLOYEES.LAST_NAME,
	COUNT(EMPLOYEES.LAST_NAME) AS "LAST NAME COUNT"
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY "LAST NAME COUNT" DESC;