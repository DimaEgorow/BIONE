-- Создание базы данных
CREATE DATABASE sales_db;

-- Подключение к базе данных
\c sales_db;

-- Создание таблицы категорий товаров
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Создание таблицы товаров
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES categories(id),
    price DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы продаж
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    sale_date DATE NOT NULL
);



-- Вставка категорий
INSERT INTO categories (name) VALUES
('Игрушки'),
('Одежда'),
('Книги'),
('Канцтовары'),
('Спортивные товары');

-- Вставка товаров
INSERT INTO products (name, category_id, price) VALUES
('Мягкая игрушка', 1, 15.99),
('Детская футболка', 2, 9.99),
('Сказка на ночь', 3, 5.99),
('Цветные карандаши', 4, 3.49),
('Мяч для игры', 5, 12.99),
('Конструктор', 1, 25.00),
('Детские ботинки', 2, 29.99),
('Книга для рисования', 3, 7.99),
('Рюкзак', 4, 19.99),
('Спортивная бутылка', 5, 8.99);

-- Вставка продаж
INSERT INTO sales (product_id, quantity, sale_date) VALUES
(1, 10, '2023-01-15'),
(2, 5, '2023-01-20'),
(3, 20, '2023-02-10'),
(4, 15, '2023-02-15'),
(5, 8, '2023-03-05'),
(6, 12, '2023-03-10'),
(7, 7, '2023-04-01'),
(8, 10, '2023-04-15'),
(9, 5, '2023-05-20'),
(10, 3, '2023-05-25'),
(1, 8, '2023-06-10'),
(2, 6, '2023-06-15'),
(3, 12, '2023-07-20'),
(4, 9, '2023-07-25'),
(5, 4, '2023-08-10'),
(6, 11, '2023-08-15'),
(7, 5, '2023-09-01'),
(8, 7, '2023-09-10'),
(9, 3, '2023-10-20'),
(10, 2, '2023-10-25');







--Вычислить доход от продаж, сгруппированный по году и кварталу:
-- Выбор года и квартала из даты продажи
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(QUARTER FROM sale_date) AS quarter,
    -- Сумма дохода от продаж
    SUM(quantity * p.price) AS total_income
FROM sales s
JOIN products p ON s.product_id = p.id
-- Фильтрация по дате
WHERE sale_date BETWEEN '2019-01-01' AND '2024-12-31'
GROUP BY year, quarter
ORDER BY year, quarter;


--Наиболее популярные категории за 2023 год:
-- Выбор названия категории и общего объема продаж
SELECT 
    c.name AS category,
    SUM(s.quantity) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.id
JOIN categories c ON p.category_id = c.id
-- Фильтрация по году
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY c.name
ORDER BY total_sales DESC
LIMIT 5;

--Наименее популярные категории за 2023 год:
-- Выбор названия категории и общего объема продаж
SELECT 
    c.name AS category,
    SUM(s.quantity) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.id
JOIN categories c ON p.category_id = c.id
-- Фильтрация по году
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY c.name
ORDER BY total_sales ASC
LIMIT 5;

--Сравнение данных за указанный месяц с данными за аналогичный месяц в предыдущем году:
-- Выбор месяца и года, а также суммы дохода
SELECT 
    EXTRACT(MONTH FROM sale_date) AS month,
    EXTRACT(YEAR FROM sale_date) AS year,
    SUM(quantity * p.price) AS total_income
FROM sales s
JOIN products p ON s.product_id = p.id
-- Фильтрация по месяцу и годам
WHERE EXTRACT(MONTH FROM sale_date) = 1 -- Замените на нужный месяц
AND (EXTRACT(YEAR FROM sale_date) = 2023 OR EXTRACT(YEAR FROM sale_date) = 2022)
GROUP BY month, year
ORDER BY year;


--Расчет накопленной суммы продаж по месяцам указанного года:
-- Выбор месяца и суммы накопленных продаж
SELECT 
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(quantity * p.price) AS cumulative_sales
FROM sales s
JOIN products p ON s.product_id = p.id
-- Фильтрация по году
WHERE EXTRACT(YEAR FROM sale_date) = 2023
GROUP BY month
ORDER BY month;

--Лидеры по объему продаж с добавлением данных о рейтинге:
-- Выбор названия товара, общего объема продаж и ранга
SELECT 
    p.name AS product_name,
    SUM(s.quantity) AS total_sales,
    RANK() OVER (ORDER BY SUM(s.quantity) DESC) AS sales_rank
FROM sales s
JOIN products p ON s.product_id = p.id
GROUP BY p.name
ORDER BY total_sales DESC
LIMIT 10;




