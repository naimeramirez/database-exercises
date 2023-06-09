USE employees;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (SELECT hire_date
                    FROM employees
                    WHERE employees.emp_no = 101010)

SELECT title, COUNT(title)
FROM titles
WHERE titles.emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod')
GROUP BY title;

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01')
    AND gender = 'F';


SELECT MAX(s.salary)
FROM salaries s;

SELECT *
FROM salaries s
ORDER BY salary DESC
LIMIT 10;

SELECT *
FROM employees e
WHERE  e.emp_no =
(SELECT s.emp_no
FROM salaries s
ORDER BY salary DESC
LIMIT 1);
