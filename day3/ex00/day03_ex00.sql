SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date FROM person_visits
LEFT JOIN person ON person.id =person_visits.person_id
LEFT JOIN pizzeria ON pizzeria.id =person_visits.pizzeria_id
LEFT JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name IN ('Kate') AND menu.price BETWEEN 800 AND 1000
ORDER BY menu.pizza_name, menu.price, pizzeria_name;