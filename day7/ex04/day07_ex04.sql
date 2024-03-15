SELECT pz.name AS name, COUNT(visit_date)AS count FROM person_visits
INNER JOIN pizzeria AS pz ON pz.id = pizzeria_id
GROUP BY(name)
HAVING COUNT (visit_date) > 3;