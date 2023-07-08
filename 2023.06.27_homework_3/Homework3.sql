-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
-- Выведите 5 максимальных заработных плат (saraly)
-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
-- Найдите количество специальностей
-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 


CREATE DATABASE IF NOT EXISTS Homework3;
USE Homework3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(20),
lastname VARCHAR(20),
post VARCHAR(20),
seniority INT,
salary INT,
age INT
);
INSERT staff(firstname,lastname,post,seniority,salary,age)
VALUES
("Вася","Петров", "Начальник", "40", "100000","60"),
("Петр","Власов", "Начальник", "8", "70000","30"),
("Катя","Катина", "Инженер", "2", "70000","25"),
("Саша","Сасин", "Инженер", "12", "50000","35"),
("Иван","Иванов", "Рабочий", "40", "30000","59"),
("Петр","Петров", "Рабочий", "20", "25000","40"),
("Сидр","Сидоров", "Рабочий", "10", "20000","35"),
("Антон","Антонов", "Рабочий", "8", "19000","28"),
("Юрий","Юрков", "Рабочий", "5", "15000","25"),
("Максим","Максимов", "Рабочий", "2", "11000","22"),
("Юрий","Галкин", "Рабочий", "3", "12000","24"),
("Людмила","Маркина", "Уборщик", "10", "10000","49");

SELECT * FROM staff
ORDER BY salary DESC;

SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC LIMIT 5;

SELECT
	post,
    SUM(salary) AS `SUM`
FROM staff
GROUP BY post;



SELECT 
post,
COUNT(post) AS Total
FROM staff
WHERE post = "Рабочий" AND age > 23 AND age < 50;

SELECT
COUNT(DISTINCT post)
FROM staff;

SELECT
post
FROM staff
GROUP BY post
HAVING AVG(age)<=30;


