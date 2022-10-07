

use hr;

select * from employees;

-- вывести имя и фамилию сотрудника и имя/фамилию его/ее менеджераa

select 
	-- t1. employee_id,
	t1.first_name as employee_name,
	t1.last_name as employee_last_name,   
    -- t1.manager_id,
    -- t2.employee_id,
	t2.first_name as manager_name,
    t2.last_name as manager_last_name
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id;


-- t1 - источник данных о сотруднике
-- t2 - источник данных о менеджере

-- Вывести имена и фамилии тех сотрудников, которые зарабатывают больше своего менеджера

select 
	-- t1. employee_id,
	t1.first_name as employee_name,
	t1.last_name as employee_last_name,   
    -- t1.manager_id,
    -- t2.employee_id,
	t2.first_name as manager_name,
    t2.last_name as manager_last_name
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
where t1.salary > t2.salary;

-- 1) Найти имя и фамилию сотрудников с самой большой и самой маленькой зарплатами

-- найти самую большую зарплату

select 
	max(salary) as max_salary
from employees;

-- найти самую маленькую зарплату

select 
	min(salary) as min_salary
from employees;

-- сотрудник с самой большой зарплатой

select 
	first_name,
    last_name,
    salary as max_salary
from employees
where salary = (
	select 
		max(salary) as max_salary
	from employees
);

-- сотрудник с самой маленькой зарплатой

select 
	first_name,
    last_name,
    salary as min_salary
from employees
where salary = (
	select 
		min(salary) as min_salary
	from employees
);


select 
	first_name,
    last_name
    salary
from employees
where salary = (
	select 
		max(salary) as max_salary
	from employees
) or salary = (
	select 
		min(salary) as min_salary
	from employees
);