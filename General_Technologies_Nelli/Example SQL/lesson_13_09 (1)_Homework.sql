-- ДЗ
-- 7) найдите компетенции, которых нет ни у одного преподавателя

select
	t1.title
from competencies t1
left join teachers2competencies t2
on t1.id = t2.competencies_id
where t2.competencies_id is null;

-- 8) выведите имя студента и имена старост, которые есть на курсах, которые он проходит

-- какие курсы проходит студент
-- кто староста на этих курсах

select
	t1.name as student_name,
    t3.title as course_title,
    t4.name as headman_name
from students t1
inner join students2courses t2
on t1.id = t2.student_id
inner join courses t3
on t2.course_id = t3.id
inner join students t4 
on t3.headman_id = t4.id;



-- Self join
-- Данный вид join позволяет соедить таблицу саму с собой.

use hr;
select * from employees;

-- Вывести имя/фамилию сотрудника и имя/фамилию его/ее менеджера

select
    t1.first_name as employee_name,
    t1.last_name as employee_last_name,
    t2.first_name as manager_name,
    t2.last_name as manager_last_name
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id;

-- t1 - источник данных о сотруднике
-- t2 - источник данных о менеджере

 -- Вывести имена и фамилии тех сотрудников, которые зарабатывают больше своего менеджера
 
 select
	t1.first_name as employee_name,
    t1.last_name as employee_last_name,
    t1.salary as employee_salary,
    t2.first_name as manager_name,
    t2.last_name as manager_last_name,
    t2.salary as manager_salary
 from employees t1
 inner join employees t2
 on t1.manager_id = t2.employee_id
 where t1.salary > t2.salary;
 
 
 

 /*
 АГРЕГАЦИЯ
 1. count() - кол-во строк, которые не null
 2. max() - максимальное значение
 3. min() - минимальное значение
 4. avg() - среднее значение
 5. sum() - сумма значений
 */
 
 -- 1) Найти имя и фамилию сотрудников с самой большой и самой маленькой зарплатами
 
-- найти самую большую зарплату 
select
	max(salary) as max_salary
from employees;

-- найти самую маленькую зарплату
select
	min(salary) as min_salary
from employees;

-- сотрудник с самой большой зп
select
	first_name,
    last_name,
    salary as max_salary
from employees
where salary = (
	select
		max(salary)
	from employees
);
 
-- сотрудник с самой маленькой зп
 
 select
	first_name,
    last_name,
    salary 
from employees
where salary = (select min(salary) from employees);


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
