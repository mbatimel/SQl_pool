SELECT pizza_name, p1.name AS pizzeria_name_1, 
p2.name AS pizzeria_name_2, t.price 
FROM
(SELECT m1.pizza_name, m1.pizzeria_id AS pizzeria_id1,
m2.pizzeria_id AS pizzeria_id2, m1.price
FROM menu AS m1, menu AS m2
WHERE m1.price = m2.price   AND m1.pizza_name = m2.pizza_name AND m1.id > m2.id) t
INNER JOIN pizzeria AS p1 ON p1.id = t.pizzeria_id1
INNER JOIN pizzeria AS p2 ON p2.id = t.pizzeria_id2
ORDER BY pizza_name