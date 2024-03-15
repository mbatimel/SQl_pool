
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmitriy', pprice NUMERIC DEFAULT 500, pdate DATE  DEFAULT '2022-01-08') 
RETURNS TABLE (pizzeria_name VARCHAR) AS $$
BEGIN
RETURN QUERY
    SELECT DISTINCT pizzeria.name FROM pizzeria 
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order AS po ON menu.id = menu_id 
    JOIN person ON person.id = po.person_id
    JOIN person_visits AS pv ON pv.person_id = person.id 
    AND pv.pizzeria_id = pizzeria.id
    WHERE person.name = pperson AND price < pprice 
    AND order_date = pdate AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800)
UNION ALL
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');