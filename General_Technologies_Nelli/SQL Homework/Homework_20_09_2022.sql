use hr;

-- ДЗ (БД HR)
-- Найти департаменты, в которых больше 10 сотрудников
-- Выведите название департаментов с кол-вом сотрудников выше среднего
-- Найти департамент с наибольшим кол-вом сотрудников

select * from departments;
select * from employees;

-- Найти департаменты, в которых больше 10 сотрудников
-- 1 Вариант 
select
	t1.department_name,
	t1.department_id,
    t2.count_employee
from departments t1
right join (select
	department_id,
	count(*) as count_employee    
from employees    
group by department_id
having count(*) > 10
)t2
on t1.department_id = t2.department_id;

-- 2 ВариантalterSELECT t1.department_name, count(employee_id) AS employee_count
SELECT 
	t1.department_name, 
    count(employee_id) AS employee_count
FROM departments t1
JOIN employees t2
ON t1.department_id = t2.department_id
GROUP BY t1.department_id
HAVING employee_count > 10;

 

-- Выведите название департаментов с кол-вом сотрудников выше среднего
-- Рабочий вариант 
select
	department_name,
    department_id
    
from departments t1
where department_id in (
	select
		department_id
	from employees
    group by department_id
    having count(*) > (
		select
			avg(cnt) as avg_cnt
		from (
			select
				department_id,
                count(*) as cnt
			from employees
            group by department_id
            having department_id is not null
		) t2
	)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
select
	t1.department_name
	-- t1.department_id,
--     count_employee
from departments t1
right join (select
	department_id,
	count(*) as count_employee
    -- avg(count_employee) as avg_count_employee
from employees    
group by department_id
having count_employee > (
	select
	avg(count_employee) as avg_cnt
	from (
			select
			department_id,
			count(*) as count_employee
			-- avg(count_employee) as avg_count_employee
		from employees    
		group by department_id
	) 
)
)t2
on t1.department_id = t2.department_id;
-- where count(*) > avg(count_employee);
-- -- -- -- -- -- -- -- -- -- -- -- -- 
select
	avg(count_employee) as avg_cnt
from (
		select
		department_id,
		count(*) as count_employee
		-- avg(count_employee) as avg_count_employee
	from employees    
	group by department_id
) t2;

select
	department_id,
	count(*) as count_employee,
    avg(count_employee)
from employees t2   
group by department_id;
-- having count(*);

-- Найти департамент с наибольшим кол-вом сотрудников
-- МОЙ ВАРИАНТ 
select
	t1.department_name,
	t1.department_id,
    count_employee
from departments t1
right join (select
	department_id,
	count(*) as count_employee    
from employees    
group by department_id
)t2
on t1.department_id = t2.department_id
order by count_employee desc
limit 1;

-- ВАРИАНТ НЕЛЛИ
select
	department_name
from departments
where department_id in (
	select
		department_id
	from employees
	group by department_id
	having count(*) = (
		select
			max(cnt) as max
		from (
			select
				department_id,
				count(*) as cnt
			from employees
			group by department_id
		) t1
	)
);


