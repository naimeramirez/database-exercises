# join example database
CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
                                             ('bob', 'bob@example.com', 1),
                                             ('joe', 'joe@example.com', 2),
                                             ('sally', 'sally@example.com', 3),
                                             ('adam', 'adam@example.com', 3),
                                             ('jane', 'jane@example.com', null),
                                             ('scott', 'mike@example.com', null);

SELECT * FROM roles;

SELECT * FROM users;

INSERT INTO users (name, email, role_id)
VALUES ('john', 'john@example.com', 1),
       ('sam', 'sam@example.com', 2),
       ('rick', 'rick@example.com', 3),
       ('scott', 'cali@example.com', NULL);

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles
ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

SELECT COUNT(role_id) AS role_count, roles.name AS role_name
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id GROUP BY role_id



# associative table joins

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
GROUP BY d.dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'F'
GROUP BY d.dept_name;

SELECT COUNT(t.title) AS Total, t.title
FROM employees as e
         JOIN current_dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN titles as t
              ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
  AND d.dept_name = 'Customer Service'
GROUP BY t.title
ORDER BY Total DESC;

SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager, s.salary
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN salaries as s
              ON s.emp_no = e.emp_no

WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name;
