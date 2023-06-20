-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
-- Выведите название, производителя и цену для товаров, количество которых превышает 2
-- Выведите весь ассортимент товаров марки “Samsung”Таблица мобильных телефонов

USE homework1;
DROP TABLE IF EXISTS phone;
CREATE TABLE phone
(
id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR (45) NOT NULL,
Manufacturer VARCHAR (45) NOT NULL,
ProductCount VARCHAR (10),
Price VARCHAR (10)
);


INSERT phone (ProductName, Manufacturer, ProductCount, Price)
VALUES
("iPhone X", "Apple", "3", "76000"),
("iPhone 8", "Apple", "2", "51000"),
("Galaxy S9", "Samsung", "2", "56000"),
("Galaxy S8", "Samsung", "1", "41000"),
("Galaxy S8", "Samsung", "1", "41000"),
("P20 Pro", "Huawei", "5", "36000");

SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE Manufacturer = "Samsung";

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE ProductName LIKE "Iphone%";

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE ProductName LIKE "Galaxy%";

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE ProductName RLIKE "[:digit:]";

SELECT ProductName, Manufacturer,ProductCount,Price
FROM phone
WHERE ProductName RLIKE "[8]";
