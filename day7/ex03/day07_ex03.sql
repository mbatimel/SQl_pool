WITH  v AS (SELECT pz.name AS name, COUNT(visit_date)AS count FROM person_visits
INNER JOIN pizzeria AS pz ON pz.id = pizzeria_id
GROUP BY(name)
), o AS
(SELECT pz.name AS name, COUNT(order_date) AS count FROM person_order
INNER JOIN menu AS m ON  m.id = menu_id
INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
GROUP BY(name)
)
SELECT o.name,v.count+o.count FROM v
INNER JOIN o ON o.name = v.name
ORDER BY o.count DESC;
