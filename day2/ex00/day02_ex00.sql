SELECT name, rating FROM pizzeria
WHERE NOT EXISTS(
SELECT 1 FROM person_visits
WHERE pizzeria.id = person_visits.pizzeria_id);

SELECT name, rating FROM pizzeria p
LEFT JOIN person_visits pv ON p.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;