SHOW TRANSACTION ISOLATION LEVEL;

-- Session#1
BEGIN; -- start transaction in Session#1
-- Session#2
BEGIN; -- start transaction in Session#2

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session#1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --rating update in session 1
-- Session#2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --rating update in session 2, waiting until commit in session 1

-- Session#1
COMMIT; -- end of transaction block in Session#1
-- Session#2
COMMIT; -- end of transaction block in Session#2

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- the result is 3.6, session#1 changes were lost
-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- the result is 3.6