# sql-sales-analysis
SQL-проект анализа базы данных DVD Rental: отчёты по продажам, выручке, клиентам и жанрам с использованием JOIN, CTE и оконных функций.
# SQL Sales Analysis (DVD Rental)

Аналитический проект на SQL на основе учебной базы данных **DVD Rental** (PostgreSQL).  
Проект демонстрирует навыки работы с SQL: JOIN, подзапросы, агрегатные функции, CTE и оконные функции.  
Основная цель — показать подход к решению бизнес-задач средствами SQL.

---

## 📂 Структура проекта
- `01_basic_queries.sql` — простые запросы (выборки, фильтрация, сортировка).
- `02_aggregations.sql` — агрегаты (суммы, средние, группировки).
- `03_joins_subqueries.sql` — объединения таблиц и подзапросы.
- `04_cte_window.sql` — CTE и оконные функции.
- `05_final_report.sql` — итоговый отчёт для бизнеса (выручка, ТОП-ы, новые клиенты).

---

## 🗄️ Используемая база
DVD Rental — пример реляционной базы данных для PostgreSQL.  
Содержит таблицы:
- **film, category, film_category** — фильмы и жанры,
- **customer, address, city** — клиенты,
- **rental, payment** — аренды и платежи,
- **staff, store** — сотрудники и магазины.

[Скачать базу dvdrental](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)

---

## 📊 Примеры запросов

**Пример 1. ТОП-5 клиентов по сумме арендованных фильмов**
```sql
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;
