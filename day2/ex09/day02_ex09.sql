WITH t AS
(SELECT person.name, gender, menu.pizza_name FROM person
INNER JOIN person_order AS po ON po.person_id = person.id
INNER JOIN menu ON po.menu_id = menu.id
WHERE gender = 'female')
SELECT t.name FROM t
WHERE pizza_name = 'pepperoni pizza' 
INTERSECT 
SELECT t.name FROM t
WHERE pizza_name = 'cheese pizza'
ORDER BY name;