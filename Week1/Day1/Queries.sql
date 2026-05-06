-- 1.select all columns from the employee table.
select * from employee;

-- 2.select only the name and salary columns from the employee table.
select name, salary from employee;

-- 3.select employees who are older than 30.
select * from employee 
where age > 30;

-- 4.select the names of all departments.
select name from department;

-- 5.select employees who work in the it department.
select * from employee
where department_id = (select department_id from department where name = 'IT'
);

-- 6.select employees whose names start with 'j'.
select * from employee 
where name like 'J%';

-- 7.select employees whose names end with 'e'.
select * from employee 
where name like '%e';

-- 8.select employees whose names contain 'a'.
select * from employee 
where name like '%a%';

-- 9.select employees whose names are exactly 9 characters long.
select * from employee 
where length(name) = 9;

-- 10.select employees whose names have 'o' as the second character.
select * from employee
where name like '_o%';

-- 11.select employees hired in the year 2020.
select * from employee
where year(hire_date) = 2020;

-- 12.select employees hired in january of any year.
select * from employee
where month(hire_date) = 1;

-- 13.select employees hired before 2019.
select * from employee
where year(hire_date) < 2019;

-- 14.select employees hired on or after march 1, 2021.
select * from employee
where hire_date >= '2021-03-01';

-- 15.select employees hired in the last 2 years.
select * from employee
where hire_date >= date_sub(curdate(), interval 2 year);

-- 16.select the total salary of all employees.
select sum(salary) as total_salary from employee;

-- 17.select the average salary of employees.
select avg(salary) as average_salary from employee;

-- 18.select the minimum salary in the employee table.
select min(salary) as minimum_salary from employee;

-- 19.select the number of employees in each department.
select department_id, count(*) as total_employees from employee
group by department_id;

-- 20.select the average salary of employees in each department.
select department_id, avg(salary) as average_salary from employee
group by department_id;

-- 21.select the total salary for each department.
select department_id, sum(salary) as total_salary from employee
group by department_id;

-- 22.select the average age of employees in each department.
select department_id, avg(age) as average_age from employee
group by department_id;

-- 23.select the number of employees hired in each year.
select year(hire_date) as hire_year, count(*) as total_employees from employee
group by year(hire_date);

-- 24.select the highest salary in each department.
select department_id, max(salary) as highest_salary from employee
group by department_id;

-- 25.select the department with the highest average salary.
select department_id, avg(salary) as average_salary from employee
group by department_id
order by average_salary desc
limit 1;

-- 26.select departments with more than 2 employees.
select department_id, count(*) as total_employees from employee
group by department_id
having count(*) > 2;

-- 27.select departments with an average salary greater than 55000.
select department_id, avg(salary) as average_salary from employee
group by department_id
having avg(salary) > 55000;

-- 28.select years with more than 1 employee hired.
select year(hire_date) as hire_year, count(*) as total_employees from employee
group by year(hire_date)
having count(*) > 1;

-- 29.select departments with a total salary expense less than 100000.
select department_id, sum(salary) as total_salaryfrom employee
group by department_id
having sum(salary) < 100000;

-- 30.select departments with the maximum salary above 75000.
select department_id, max(salary) as maximum_salary from employee
group by department_id
having max(salary) > 75000;
