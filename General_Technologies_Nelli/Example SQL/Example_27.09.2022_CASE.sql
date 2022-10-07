-- Найти департаменты, в которых есть работники, зарабатывающие больше 10 000. 
-- В результате выборки формирует два поля: department_id и 1/0 
-- (1-если есть такие работники, 0 - если нет).
use hr;
select * from departments;
select * from employees;
-- -- -- -- -- -- -- -- -- 
SELECT 
	t1.department_id,
    t2.department_name,
	max(
    	case
          when salary >= 10000  then 1
          else 0
     	end	 
	) as max_salary
FROM employees t1
inner join departments t2
on t1.department_id = t2.department_id
group by department_id;
-- -- -- -- -- -- -- -- -- 
select
	t1.department_id,
    t1.department_name,
    t2.salary
from departments t1
inner join employees t2
on t1.department_id = t2.department_id
where t2.salary > 10000;

select
	employee_id,
	salary
from employees
where salary > 10000 ;
