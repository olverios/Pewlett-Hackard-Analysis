-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (employees.emp_no)employees.emp_no  ,
    employees.first_name,
    employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no, titles.title DESC;
SELECT * FROM retirement_titles;
SELECT DISTINCT ON (employees.emp_no)employees.emp_no  ,
    employees.first_name,
    employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO unique_titles
FROM employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND titles.to_date = ('9999-01-01')
ORDER BY employees.emp_no, titles.title DESC;
SELECT * FROM unique_titles;
SELECT COUNT(unique_titles.title),
unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(unique_titles.title) DESC;
SELECT * FROM retiring_titles;
-- Mentorship
SELECT DISTINCT ON (employees.emp_no)employees.emp_no  ,
    employees.first_name,
    employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentor_elig
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND dept_emp.to_date = ('9999-01-01')
ORDER BY employees.emp_no;
SELECT * FROM mentor_elig;