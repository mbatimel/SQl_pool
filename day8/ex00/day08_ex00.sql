-- session 1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
-- session 2
select * from pizzeria where name  = 'Pizza Hut';
-- session 1
COMMIT;
-- session 2
select * from pizzeria where name  = 'Pizza Hut';