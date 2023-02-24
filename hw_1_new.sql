--Таблица employees
--
-- 1. Создать таблицу employees
--     - id. serial,  primary key,
--     - employee_name. Varchar(50), not null
-- 2. Наполнить таблицу employee 70 строками.

create table employees(
id serial primary key,
employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Reggie Batey'),
('Clara Poore'),
('Tammy Galindo'),
('Rickey Jones'),
('Jill Anspach'),
('Lacy Racicot'),
('David Macias'),
('Jessica Manns'),
('Amber Holcomb'),
('Betty Wells'),
('Miguel Fletcher'),
('Joseph Hodges'),
('Ida Bohannon'),
('Cindy Merrifield'),
('Mary Dowell'),
('Marie Thomas'),
('Donald Fierro'),
('Anna Wick'),
('Robert Harian'),
('Michael Mark'),
('Lucius Patterson'),
('Lorna Rose'),
('Karen Santiago'),
('Peggy Beachler'),
('Chester Baird'),
('Ronda Colley'),
('Robert Chapman'),
('Sandra Hibbard'),
('Steven Pagano'),
('Ramona Russell'),
('Ryan Morgan'),
('Shannon Daugherty'),
('Charlene Little'),
('Steve Lewandowski'),
('Donnie Shoemaker'),
('Veronica Treto'),
('Jonathon Belanger'),
('William Hughes'),
('Courtney Alston'),
('Isaac Walters'),
('Leon Ashcraft'),
('Daniel Patterson'),
('Randall Phillips'),
('James Williams'),
('Nancy Searles'),
('Edward Hilliard'),
('Joel Vandevelde'),
('Nancy Bravo'),
('Jesse Clark'),
('Gregory Magelssen'),
('Ella Cortez'),
('Michael Diaz'),
('Robert Walsh'),
('Valorie Seibert'),
('Yoshiko Miller'),
('Timothy Johnson'),
('Lita Webb'),
('Lindsay Barrera'),
('Jacqulyn Matthews'),
('Lee Rehart'),
('Fred Spencer'),
('Melinda Webster'),
('Shawn Pretti'),
('Betty Schaefer'),
('Barbara Teets'),
('Patricia Tomas'),
('Mattie Kelley'),
('Mary Yates'),
('Andrea Croes'),
('Amanda Riley');

select * from employees;

--Таблица salary
--
-- 1. Создать таблицу salary
--    - id. Serial  primary key,
--    - monthly_salary. Int, not null
-- 2. Наполнить таблицу salary 15 строками:
--    - 1000
--    - 1100
--	  - 1200
--    - 1300
--    - 1400
--    - 1500
--    - 1600
--    - 1700
--    - 1800
--    - 1900
--    - 2000
--    - 2100
--    - 2200
--    - 2300
--    - 2400
--    - 2500

create table salary(
	id serial primary key,
	monthly_salary int not null);

select * from salary;

insert into salary (monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);
	  
select * from salary;

--Таблица employee_salary
--
-- 1. Создать таблицу employee_salary
--    - id. Serial  primary key,
--    - employee_id. Int, not null, unique
--    - salary_id. Int, not null
-- 2. Наполнить таблицу employee_salary 40 строками:
--    - в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary(
id serial primary key,
employee_id int unique not null,
salary_id int not null
);

insert into employee_salary (employee_id, salary_id)
values (1, 1),
	   (77, 3),
	   (78, 8),
	   (4, 9),
	   (58, 13),
	   (52, 5),
	   (5, 7),
	   (79, 10),
	   (7, 4),
	   (8, 7),
	   (9, 1),
	   (10, 11),
	   (11, 11),
	   (12, 6),
	   (13, 12),
	   (14, 6),
	   (64, 4),
	   (15, 1),
	   (80, 2),
	   (17, 8),
	   (76, 10),
	   (19, 2),
	   (20, 4),
	   (61, 13),
	   (21, 5),
	   (22, 7),
	   (75, 10),
	   (24, 4),
	   (25, 7),
	   (26, 1),
	   (27, 11),
	   (66, 11),
	   (74, 6),
	   (60, 12),
	   (72, 6),
	   (68, 4),
	   (29, 1),
	   (30, 2),
	   (71, 8),
	   (73, 10);
	  

select * from employee_salary
order by salary_id;

--Таблица roles

-- 1. Создать таблицу roles
--    - id. Serial  primary key,
--    - role_name. int, not null, unique
-- 2. Поменять тип столба role_name с int на varchar(30)
-- 3. Наполнить таблицу roles 20 строками

create table roles(
id serial primary key,
role_name int not null unique
);

alter table roles
alter column role_name type varchar(30);

insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles;

--Таблица roles_employee
--
-- 1. Создать таблицу roles_employee
--    - id. Serial  primary key,
--    - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--    - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- 2. Наполнить таблицу roles_employee 40 строками

create table roles_employee(
id serial primary key,
employee_id int not null unique,
foreign key (employee_id) references employees(id),
role_id int not null,
foreign key (role_id) references roles(id)
);

insert into roles_employee (employee_id, role_id)
values (1, 1),
	   (2, 3),
	   (3, 8),
	   (4, 9),
	   (31, 13),
	   (32, 5),
	   (5, 7),
	   (6, 10),
	   (7, 4),
	   (8, 7),
	   (9, 1),
	   (10, 11),
	   (11, 11),
	   (12, 6),
	   (13, 12),
	   (14, 6),
	   (33, 4),
	   (15, 1),
	   (16, 2),
	   (17, 8),
	   (18, 10),
	   (19, 2),
	   (20, 4),
	   (34, 13),
	   (21, 5),
	   (22, 7),
	   (23, 10),
	   (24, 4),
	   (25, 7),
	   (26, 1),
	   (27, 11),
	   (35, 11),
	   (40, 6),
	   (36, 12),
	   (28, 6),
	   (37, 4),
	   (29, 1),
	   (30, 2),
	   (38, 8),
	   (39, 10);
	  
	  select * from roles_employee;
