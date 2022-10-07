use lesson;

drop table if exists people;
create table people (
id  integer primary key auto_increment,
firstname varchar(128),
lastname varchar(128)
);

insert into people (firstname, lastname) values ('Anton', 'Golubev'),
												('Victoria', 'Petrova'),
												('Olga', 'Ivanova');
select 
*
from people;
-- очищает данные таблицы
delete from people;

-- Приводит таблицу к изначальному состоянию (сбрасывает)
TRUNCATE PEOPLE;