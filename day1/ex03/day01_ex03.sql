SELECT DISTINCT order_date AS action_date, person_order.person_id 
FROM person_order JOIN person
ON person_order.person_id = person.id
ORDER BY action_date ASC, person_id DESC