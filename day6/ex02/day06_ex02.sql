SELECT p.name, m.pizza_name AS pizza_name, price, 
ROUND(m.price - (m.price * discount / 100)) AS discount_price,pz.name AS pizzeria_name FROM person_discounts
JOIN person AS p ON p.id = person_id
JOIN pizzeria AS pz ON pz.id = pizzeria_id
JOIN menu AS m ON m.pizzeria_id = pz.id
ORDER BY p.name, pizza_name