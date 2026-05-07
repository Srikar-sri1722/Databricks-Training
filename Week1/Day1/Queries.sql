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

-- 31.select all employees ordered by their salary in ascending order.
select * from employee
order by salary asc;

-- 32.select all employees ordered by their age in descending order.
select * from employee
order by age desc;

-- 33.select all employees ordered by their hire date in ascending order.
select * from employee
order by hire_date asc;

-- 34.select employees ordered by their department and then by their salary.
select * from employee
order by department_id, salary;

-- 35.select departments ordered by the total salary of their employees.
select department_id, sum(salary) as total_salary from employee
group by department_id
order by total_salary desc;

-- 36.select employee names along with their department names.
select e.name as employee_name, d.name as department_name from employee e
join department d
on e.department_id = d.department_id;

-- 37.select project names along with the department names they belong to.
select p.name as project_name, d.name as department_name from project p
join department d
on p.department_id = d.department_id;

-- 38.select employee names and their corresponding project names.
select e.name as employee_name, p.name as project_name from employee e
join project p
on e.department_id = p.department_id;

-- 39.select all employees and their departments, including those without a department.
select e.name as employee_name, d.name as department_name from employee e
left join department d
on e.department_id = d.department_id;

-- 40.select all departments and their employees, including departments without employees.
select d.name as department_name, e.name as employee_name from department d
left join employee e
on d.department_id = e.department_id;

-- 41.select employees who are not assigned to any project.
select * from employee
where department_id not in (
    select department_id
    from project
    where department_id is not null
);

-- 42.select employees and the number of projects their department is working on.
select e.name as employee_name, count(p.project_id) as total_projects from employee e
left join project p
on e.department_id = p.department_id
group by e.emp_id, e.name;

-- 43.select the departments that have no employees.
select * from department
where department_id not in (
    select distinct department_id
    from employee
    where department_id is not null
);

-- 44.select employee names who share the same department with 'john doe'.
select name from employee
where department_id = (
    select department_id
    from employee
    where name = 'John Doe'
)
and name <> 'John Doe';

-- 45.select the department name with the highest average salary.
select d.name, avg(e.salary) as average_salary from employee e
join department d
on e.department_id = d.department_id
group by d.name
order by average_salary desc
limit 1;

-- 46.select the employee with the highest salary.
select * from employee
where salary = (
    select max(salary)
    from employee
);

-- 47.select employees whose salary is above the average salary.
select * from employee
where salary > (
    select avg(salary)
    from employee
);

-- 48.select the second highest salary from the employee table.
select max(salary) as second_highest_salary from employee
where salary < (
    select max(salary)
    from employee
);

-- 49.select the department with the most employees.
select department_id, count(*) as total_employees from employee
group by department_id
order by total_employees desc
limit 1;

-- 50.select employees who earn more than the average salary of their department.
select * from employee e
where salary > (
    select avg(salary)
    from employee
    where department_id = e.department_id
);

-- 51.select the nth highest salary (for example, 3rd highest).
select distinct salary from employee
order by salary desc
limit 1 offset 2;

-- 52.select employees who are older than all employees in the hr department.
select * from employee
where age > all (
    select age
    from employee
    where department_id = (
        select department_id
        from department
        where name = 'HR'
    )
);

-- 53.select departments where the average salary is greater than 55000.
select department_id, avg(salary) as average_salary from employee
group by department_id
having avg(salary) > 55000;

-- 54.select employees who work in a department with at least 2 projects.
select * from employee
where department_id in (
    select department_id
    from project
    group by department_id
    having count(*) >= 2
);

-- 55.select employees who were hired on the same date as 'jane smith'.
select * from employee
where hire_date = (
    select hire_date
    from employee
    where name = 'Jane Smith'
);

-- 56.select the total salary of employees hired in the year 2020.
select sum(salary) as total_salary from employee
where year(hire_date) = 2020;

-- 57.select the average salary of employees in each department, ordered by the average salary in descending order.
select department_id, avg(salary) as average_salary from employee
group by department_id
order by average_salary desc;

-- 58.select departments with more than 1 employee and an average salary greater than 55000.
select department_id, count(*) as total_employees, avg(salary) as average_salary from employee
group by department_id
having count(*) > 1
and avg(salary) > 55000;

-- 59.select employees hired in the last 2 years, ordered by their hire date.
select * from employee
where hire_date >= date_sub(curdate(), interval 2 year)
order by hire_date;

-- 60.select the total number of employees and the average salary for departments with more than 2 employees.
select department_id,count(*) as total_employees,avg(salary) as average_salary from employee
group by department_id
having count(*) > 2;

-- 61.select the name and salary of employees whose salary is above the average salary of their department.
select name, salary from employee e
where salary > (
    select avg(salary)
    from employee
    where department_id = e.department_id
);

-- 62.select the names of employees who are hired on the same date as the oldest employee in the company.
select name from employee
where hire_date = (
    select hire_date
    from employee
    order by age desc
    limit 1
);

-- 63.select the department names along with the total number of projects they are working on, ordered by the number of projects.
select d.name as department_name,count(p.project_id) as total_projectsfrom department d
left join project p
on d.department_id = p.department_id
group by d.name
order by total_projects desc;

-- 64.select the employee name with the highest salary in each department.
select e.name, e.department_id, e.salary from employee e
where salary = (
    select max(salary)
    from employee
    where department_id = e.department_id
);

-- 65.select the names and salaries of employees who are older than the average age of employees in their department.
select name, salary from employee e
where age > (
    select avg(age)
    from employee
    where department_id = e.department_id
);
