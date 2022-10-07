


-- ДЗ
-- 1) Найти сотрудников, у которых зарплата меньше средней
-- 2) Найти количество сотрудников в каждом департаменте
-- 3) Найти количество сотрудников у каждого менеджера

use hr;

-- 1) Найти сотрудников, у которых зарплата меньше средней
 
select
	first_name,
	last_name,
	salary
from employees
where salary < (select avg(salary) from employees);

-- 2) Найти количество сотрудников в каждом департаменте

select
	department_id,
	count(employee_id)
from employees
where department_id is not null
group by department_id;

-- 3) Найти количество сотрудников у каждого менеджера

select
	manager_id,
	count(employee_id)
from employees
where manager_id is not null
group by manager_id;
