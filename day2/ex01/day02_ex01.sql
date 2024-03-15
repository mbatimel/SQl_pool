SELECT missing_date::date FROM generate_series
( '2022-01-01'::timestamp 
        , '2022-01-10'::timestamp
        , '1 day'::interval) AS missing_date
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) vd
ON visit_date = missing_date
WHERE visit_date is NULL;