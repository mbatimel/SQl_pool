SELECT person.name FROM person
INNER JOIN person_order AS po ON po.person_id = person.id
INNER JOIN menu ON menu.id = po.menu_id
WHERE gender = 'male' AND (address = 'Moscow' OR address = 'Samara')
      AND (pizza_name LIKE 'pepperoni%' OR pizza_name LIKE 'mushroom%')
ORDER BY person.name DESC;