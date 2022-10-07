show databases;	

use hr;

show tables;

-- 1. Вывести имя и фамилию сотрудника и название его департамента

select * from employees;
select * from departments;

select
	t1.first_name,
    t1.last_name,
    t2.department_name
from employees t1
inner join departments t2
on t1.department_id = t2.department_id;



-- Вывести имя и фамилию сотрудника и название его департамента только тех сотрудников, которые работают в IT, Treasury или IT Support
select
	t1.first_name,
    t1.last_name,
    t2.department_name
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
Where t2.department_name in ('IT', 'Treasury', 'IT Support');

-- 3. Найти департаменты (вывести названия департаментов), в которых никто не работает
select * from employees;
select * from departments;

select
	t1.department_name,
    t2.first_name,
    t2.last_name
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.department_id is null;

-- 4. Выведите названия департаментов и manager_id, в которых менеджеры зарабатывают больше 10000

select
    t1.department_name,
    t2.manager_id,
    t2.salary
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.salary > 10000;
