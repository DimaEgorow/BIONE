import psycopg2
import tkinter as tk
from tkinter import messagebox

# Подключение к базе данных
conn = psycopg2.connect(
    dbname="warehouse2",
    user="postgres",
    password="1234",
    host="127.0.0.1"
)
cursor = conn.cursor()

# Функция для получения общего количества товаров в секциях
def get_total_quantity(start_section, end_section):
    cursor.execute("SELECT SUM(quantity) FROM products WHERE section BETWEEN %s AND %s", (start_section, end_section))
    total = cursor.fetchone()[0]
    return total if total is not None else 0

# Функция для обновления количества товаров в секции
def update_quantity(section, product_name, new_quantity):
    cursor.execute("UPDATE products SET quantity = %s WHERE section = %s AND name = %s", (new_quantity, section, product_name))
    conn.commit()

# Функция для получения списка товаров в секции
def get_products_in_section(section):
    cursor.execute("SELECT name, quantity FROM products WHERE section = %s", (section,))
    return cursor.fetchall()

# Интерфейс
def show_products():
    section = int(section_entry.get())
    products = get_products_in_section(section)
    product_list.delete(0, tk.END)
    for product in products:
        product_list.insert(tk.END, f"{product[0]}: {product[1]}")

def show_total_quantity():
    start_section = start_section_entry.get()
    end_section = end_section_entry.get()

    # Проверка на пустые значения
    if not start_section or not end_section:
        messagebox.showerror("Ошибка", "Пожалуйста, введите начальную и конечную секцию.")
        return

    try:
        start_section = int(start_section)
        end_section = int(end_section)
    except ValueError:
        messagebox.showerror("Ошибка", "Пожалуйста, введите корректные числовые значения для секций.")
        return

    total = get_total_quantity(start_section, end_section)
    messagebox.showinfo("Общее количество товаров", f"Общее количество товаров в секциях {start_section} - {end_section}: {total}")
def update_product():
    section = int(section_entry.get())
    product_name = product_name_entry.get()
    new_quantity = int(new_quantity_entry.get())
    update_quantity(section, product_name, new_quantity)
    messagebox.showinfo("Обновление", "Количество товара обновлено.")

# Создание интерфейса
root = tk.Tk()
root.title("Система анализа складских помещений")

# Поля для ввода
tk.Label(root, text="Секция:").grid(row=0, column=0)
section_entry = tk.Entry(root)
section_entry.grid(row=0, column=1)

tk.Label(root, text="Имя товара:").grid(row=1, column=0)
product_name_entry = tk.Entry(root)
product_name_entry.grid(row=1, column=1)

tk.Label(root, text="Новое количество:").grid(row=2, column=0)
new_quantity_entry = tk.Entry(root)
new_quantity_entry.grid(row=2, column=1)

tk.Label(root, text="Начальная секция:").grid(row=3, column=0)
start_section_entry = tk.Entry(root)
start_section_entry.grid(row=3, column=1)

tk.Label(root, text="Конечная секция:").grid(row=4, column=0)
end_section_entry = tk.Entry(root)
end_section_entry.grid(row=4, column=1)

# Кнопки
tk.Button(root, text="Показать товары", command=show_products).grid(row=5, column=0, columnspan=2)
tk.Button(root, text="Общее количество", command=show_total_quantity).grid(row=6, column=0, columnspan=2)
tk.Button(root, text="Обновить товар", command=update_product).grid(row=7, column=0, columnspan=2)

# Список товаров
product_list = tk.Listbox(root)
product_list.grid(row=8, column=0, columnspan=2)

root.mainloop()

# Закрытие соединения с базой данных
cursor.close()
conn.close()