INSERT INTO person_visits
VALUES (
    (SELECT MAX(person_visits.id) + 1  FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
),
(
    (SELECT MAX(person_visits.id) + 2  FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
)