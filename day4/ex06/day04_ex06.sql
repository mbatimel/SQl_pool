CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT  pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN person_visits AS pv
ON pv.pizzeria_id = pizzeria.id
INNER JOIN person
ON person.id = pv.person_id
INNER JOIN menu
ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND menu.price < 800;