use lesson;

/* 1) Создать таблицу students с полями

name (не null)

lastname (не null)

avg_mark (от 0 до 5)

gender char(1) (или “M” или “F”) */

drop table if exists students;
create table students (
	id integer primary key auto_increment,
	name varchar(128) not null,
    lastname varchar(128) not null,
    avg_mark numeric(2, 1) check (avg_mark between 0 and 5),
    gender char(1) check (gender in('M', 'F'))
);

select 
	name as fisrtname,
    avg_mark as mark,
    id as student_id
from students
order by mark;

/* 2) Добавить 5 записей студентов

Олег Петров 4.3 M

Семен Степанов 3.1 M 

Ольга Семенова 4.7 F 

Игорь Романов 3.1 M 

Ирина Иванова 2.2 F */

insert into students (name, lastname, avg_mark, gender) values ('Олег', 'Петров', 4.3, 'M'),
																('Семен', 'Степанов', 3.1, 'M'),
                                                                ('Ольга', 'Семенова', 4.7, 'F'),
                                                                ('Игорь', 'Романов', 3.1, 'M'),
                                                                ('Ирина', 'Иванова', 2.2, 'F');
                                                                
-- 3) Добавить поле id integer primary key auto_increment

alter table students
add column id integer primary key auto_increment;

-- 4) Переименовать поле name на firstname

alter table students
change name firstname varchar(128);

/* 5) Выборки

- найти учеников, у которых оценка больше 4
- найти учеников, у которых не входит в диапазон от 3 до 4
- найти учеников, у которых имя начинается на И
- найти учеников, у которых оценка 2.2 или 3.1 или 4.7 */



