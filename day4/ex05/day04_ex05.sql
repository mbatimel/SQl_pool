CREATE VIEW v_price_with_discount AS
SELECT person.name, pizza_name, price, ROUND(price - price * 0.1, 0) AS discount_price
FROM person_order
INNER JOIN person ON person_id = person.id
INNER JOIN menu ON menu.id = menu_id
ORDER BY person.name, pizza_name