WITH t AS
(SELECT pizzeria.name AS pizzeria_name, gender
FROM person
INNER JOIN person_order AS po ON person.id = po.person_id
INNER JOIN menu ON menu.id = po.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

(SELECT t.pizzeria_name FROM t
WHERE gender = 'female' 
EXCEPT 
SELECT t.pizzeria_name FROM t
WHERE gender = 'male')
UNION 
(SELECT t.pizzeria_name FROM t
WHERE gender = 'male' 
EXCEPT 
SELECT t.pizzeria_name FROM t
WHERE gender = 'female')
ORDER BY pizzeria_name;

