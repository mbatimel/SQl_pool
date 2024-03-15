SELECT pizzeria.name AS pizzeria_name
FROM person_visits AS pv
INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = pv.person_id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM person_order AS po
INNER JOIN person ON person.id = po.person_id
INNER JOIN menu ON menu.id = po.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey';