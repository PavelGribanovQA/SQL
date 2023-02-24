
 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;
           
-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

SELECT monthly_salary, salary.id, employee_salary.employee_id
FROM salary
left join employee_salary on employee_salary.salary_id = salary.id
WHERE employee_salary.employee_id > 70 or employee_salary.salary_id IS NULL;

-----
от кати
select employee_name, monthly_salary from employees e 
right join employee_salary es on e.id = es.employee_id
right join salary s on es.salary_id = s.id
where employee_name is null;




SELECT monthly_salary, salary.id, employee_salary.employee_id
FROM salary
FULL OUTER JOIN employee_salary ON employee_salary.salary_id = salary.id
WHERE employee_salary.salary_id IS NULL
    OR salary.id IS NULL
or employee_salary.employee_id > 70;
----

SELECT monthly_salary
from salary
left join employee_salary on employee_salary.salary_id = salary.id
WHERE employee_salary.salary_id IS NULL;

------------- нужно ли OR???
SELECT monthly_salary, salary.id, employee_salary.employee_id
FROM employees
right join employee_salary on employees.id = employee_salary.employee_id
right join salary on employee_salary.salary_id = salary.id
where employees.id is null or employee_salary.salary_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary, salary.id, employee_salary.employee_id
FROM employees
right join employee_salary on employees.id = employee_salary.employee_id
right join salary on employee_salary.salary_id = salary.id
where ( employees.id is null or employee_salary.salary_id is null ) and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, employee_salary.employee_id
from employees
left join employee_salary on employees.id = employee_salary.employee_id
where employee_salary.employee_id is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer%';
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name 
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Automation%';
-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Senior%';
-- 15. Вывести зарплаты Java разработчиков
select distinct monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
right join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer%';
-- 16. Вывести зарплаты Python разработчиков
select distinct monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
right join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer%';

---
select distinct monthly_salary, role_name
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select distinct employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like 'Junior Python developer';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select distinct employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like 'Middle JavaScript developer';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select distinct employee_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like 'Senior Java developer';

-- 20. Вывести зарплаты Junior QA инженеров
select distinct employee_name, monthly_salary, role_name
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary)
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary) as sum_salary
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) as min_salary
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';
-- 24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) as min_salary
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';
-- 25. Вывести количество QA инженеров
select COUNT(employee_name)
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.
select COUNT(employee_name)
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select COUNT(employee_name)
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) as sum_salary
from salary
join employee_salary on employee_salary.salary_id = salary.id
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
order by monthly_salary;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where monthly_salary between 1700 and 2300
order by monthly_salary;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where monthly_salary < 2300
order by monthly_salary;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join roles_employee on employees.id = roles_employee.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;