-- Используя sql workbench, создайте на компьютере базу данных homework.
-- Внутри БД homework создайте таблицу animals (id, title, country)
-- Добавьте несколько строк в таблицу
-- Добавьте поле age (integer) со значением по умолчанию 0
-- Проверьте содержимое таблицы
-- Измените тип поля age на numeric(3, 1). Перед изменением типа необходимо очистить поле
-- Измените тип поля age обратно на integer
-- Переименуйте поле age на animal_age
-- Удалите поле age --


create database homework;
use homework;






CREATE TABLE animals (
	id  integer primary key,
    title VARCHAR(128),
    country varchar(128)
);
    
    
    insert into animals (id, title, country) values (1, 'cat', 'Germany'),
													(2, 'Dog', 'Spain'),
                                                    (3, 'Snake', 'France'),
                                                    (4, 'Mouse', 'Bulgaria');
    
    select * from animals;
    SHOW DATABASES;
    use lesson;
    