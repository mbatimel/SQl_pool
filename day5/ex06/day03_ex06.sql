-- CREATE UNIQUE INDEX используется, 
-- когда мы хотим гарантировать, 
-- что столбец хранит только уникальные значения. 
-- Если мы определяем УНИКАЛЬНЫЙ ИНДЕКС для 
-- конкретного столбца, то этот столбец не может 
-- иметь одно и то же значение в нескольких строках.
-- грубоговоря мы упростили обход по дереву через этот инднкс

CREATE UNIQUE INDEX idx_1 ON
    pizzeria (rating);

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;