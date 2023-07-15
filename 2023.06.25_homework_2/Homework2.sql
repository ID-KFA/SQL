-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE DATABASE IF NOT EXISTS Homework2;
USE Homework2;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);
INSERT sales(order_date, count_product)
VALUES
("2022-01-01","156"),
("2022-01-02","180"),
("2022-01-03","21"),
("2022-01-04","124"),
("2022-01-05","341");


SELECT id AS `id заказа`,
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product > 100 AND  count_product < 300 THEN "Средний заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Не определен"
END AS "Тип заказа"

FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10),
amount DECIMAL(5,2),
order_status VARCHAR(10)
);

INSERT orders (employee_id,amount,order_status)
VALUES
("e03","15.00","OPEN"),
("e01","25.50","OPEN"),
("e05","100.70","CLOSED"),
("e02","22.18","OPEN"),
("e04","9.50","CANCELLED");

SELECT id AS `id заказа`,
CASE
	WHEN order_status = "OPEN" THEN "Order is open state"
    WHEN order_status = "CLOSED" THEN "Order is closed"
    WHEN order_status = "CANCELLED" THEN "Order is cancelled"
    ELSE "Не определен"
END AS "full_order_status"

FROM orders;
