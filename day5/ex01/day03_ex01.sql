EXPLAIN ANALYZE
SELECT m.pizza_name, p.name FROM menu AS m
JOIN pizzeria AS p
ON p.id = m.pizzeria_id