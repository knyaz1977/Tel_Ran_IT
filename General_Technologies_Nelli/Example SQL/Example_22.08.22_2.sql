/*
) 1. Создать таблицу students с полями
name (не null)
lastname (не null)
avg_mark (от 0 до 5)
gender char(1) (или “M” или “F”)
 */
 drop table students;
 
 create table students(
	name varchar(128) NOT NULL,
	lastname varchar(128) NOT NULL,
	avg_mark CHAR(5) check (avg_mark BETWEEN '0' AND '5'),
    gender CHAR(1) check (gender in ('f', 'm'))
);
show tables;
select * from students;

/* 2) Добавить 5 записей студентов
Олег Петров 4.3 M
Семен Степанов 3.1 M 
Ольга Семенова 4.7 F 
Игорь Романов 3.1 M 
Ирина Иванова 2.2 F */

insert into students  values('Олег', 'Петров', 4.3, 'M'),
							('Семен', 'Степанов', 3.1, 'M'),
                            ('Ольга', 'Семенова', 4.7, 'F'),
                            ('Игорь', 'Романов', 3.1, 'M'),
                            ('Ирина', 'Иванова', 2.2, 'F');

/*3) Добавить поле id integer primary key auto_increment*/
alter table students 
add id integer primary key auto_increment;

/*4) Переименовать поле name на firstname */
alter table students 
change name firstname varchar(128) NOT NULL;


/* 5) Выборки

- найти учеников, у которых оценка больше 4
- найти учеников, у которых не входит в диапазон от 3 до 4
- найти учеников, у которых имя начинается на И
- найти учеников, у которых оценка 2.2 или 3.1 или 4.7 */
select 
	*
from students
where avg_mark > 4;

select 
	*
from students
where avg_mark not between 3 and 4;

select 
	*
from students
where firstname like 'И%';

select 
	*
from students
where avg_mark in (2.2, 3.1, 4.7);

-- 6) Найти набор уникальных оценок
select
	firstname,
    avg_mark
from students
order by avg_mark;

-- 7) Поменяйте у Олега Петрова фамилию на Сидоров

set sql_safe_updates = 0;

select * from students;

update students
set lastname = 'Сидоров'
where firstname = 'Олег'
and lastname = 'Петров';


-- Домашнее задание
-- 8) Увеличить всем учащимся оценку в 10 раз

update students
set avg_mark= avg_mark*10;

-- select id,
-- 		avg_mark * 10 AS avg_mark_10
-- from students;  

-- 9) Для всех учеников, у которых оценка не больше 31 увеличить на 10

update students
set avg_mark= avg_mark*10
where avg_mark < 31;

