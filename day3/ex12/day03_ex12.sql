INSERT INTO person_order
SELECT 
     MAX(person_order.id) + g, g,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(1, (SELECT COUNT(*) FROM person)) as g CROSS JOIN person_order
GROUP BY g;