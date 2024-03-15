SELECT po.person_id - ps.person_id 
FROM person_order po JOIN person_visits ps
ON ps.visit_date = '2022-01-07'
WHERE po.order_date = '2022-01-07'