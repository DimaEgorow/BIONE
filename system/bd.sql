 
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    section INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL
);
INSERT INTO products (section, name, quantity) VALUES
(1, 'Смартфон X', 50),
(1, 'Ноутбук Y', 30),
(2, 'Планшет Z', 20),
(2, 'Наушники A', 100),
(3, 'Клавиатура B', 75),
(3, 'Мышь C', 60);