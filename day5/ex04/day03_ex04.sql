SET enable_seqscan = off;
CREATE INDEX idx_menu_uniqu
ON menu (pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name FROM menu
WHERE pizzeria_id = 1 OR pizza_name = 'pepperoni pizza'


