WITH t AS
(SELECT pizzeria.name AS pizzeria_name, gender 
FROM pizzeria
INNER JOIN person_visits AS pv ON pizzeria.id = pv.pizzeria_id
INNER JOIN person ON pv.person_id = person.id)
(SELECT t.pizzeria_name FROM t
WHERE gender = 'female' 
EXCEPT ALL
SELECT t.pizzeria_name FROM t
WHERE gender = 'male')
UNION ALL
(SELECT t.pizzeria_name FROM t
WHERE gender = 'male' 
EXCEPT ALL
SELECT t.pizzeria_name FROM t
WHERE gender = 'female')
ORDER BY pizzeria_name;