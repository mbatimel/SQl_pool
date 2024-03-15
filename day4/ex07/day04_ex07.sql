WITH t AS
        (SELECT pizzeria.id FROM pizzeria INNER JOIN menu ON pizzeria.id = pizzeria_id WHERE price < 800 
        AND name != (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats))
INSERT INTO person_visits
VALUES (
    (SELECT MAX(id) FROM person_visits) + 1,
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT MAX(t.id) FROM t),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats; 
