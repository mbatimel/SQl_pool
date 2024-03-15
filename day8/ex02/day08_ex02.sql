-- Session#1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- start transaction in Session#1
-- Session#2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- start transaction in Session#2

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session#1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --rating update in session 1
-- Session#2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --rating update in session 2, waiting until commit in session 1. ERROR:  could not serialize access due to concurrent update

-- Session#1
COMMIT; -- end of transaction block in Session#1
-- Session#2
COMMIT; -- end of transaction block in Session#2 as ROLLBACK

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- the result is 4
-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- the result is 4