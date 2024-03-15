(SELECT pz.name AS name, COUNT(visit_date)AS count, 'visit' AS action_type FROM person_visits
INNER JOIN pizzeria AS pz ON pz.id = pizzeria_id
GROUP BY(name)
ORDER BY 2 DESC LIMIT 3)
UNION ALL
(SELECT pz.name AS name, COUNT(order_date) AS count, 'order' AS action_type FROM person_order
INNER JOIN menu AS m ON  m.id = menu_id
INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
GROUP BY(name)
ORDER BY 2 DESC LIMIT 3)
ORDER BY action_type ASC, count DESC;
