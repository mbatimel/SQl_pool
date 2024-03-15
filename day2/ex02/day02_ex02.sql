SELECT CASE WHEN p.name IS NULL THEN '-' ELSE  p.name END AS person_name,
       CASE WHEN pv.visit_date IS NULL THEN NULL ELSE pv.visit_date END AS visit_date,
       CASE WHEN pi.name IS NULL THEN '-' ELSE  pi.name END AS pizzeria_name
       from person p
RIGHT JOIN person_visits pv ON p.id = pv.person_id
RIGHT JOIN pizzeria pi ON pv.pizzeria_id = pi.id
ORDER BY  person_name, visit_date, pizzeria_name