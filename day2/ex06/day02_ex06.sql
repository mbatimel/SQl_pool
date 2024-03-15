SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order AS po
INNER JOIN menu ON menu.id = po.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person.id = po.person_id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;