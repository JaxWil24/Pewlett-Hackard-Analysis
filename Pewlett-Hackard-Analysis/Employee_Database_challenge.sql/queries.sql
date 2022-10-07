--Deliverable 1: The Number of Retiring Employees by Title
SELECT
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
into retirement_titles
from employees as e
inner join titles as ti
on ti.emp_no = e.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

select * from titles
select * from employees

--Unique Titles
select distinct on (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
into unique_titles
from retirement_titles as rt
where rt.to_date = ('9999-01-01')
order by rt.emp_no, rt.to_date DESC;

--Count Retiring Titles
select count (ut.title),
ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by ut.count DESC;

-- Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;