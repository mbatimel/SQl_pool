-- Session#1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- start transaction in Session#1
-- Session#2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- start transaction in Session#2

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session#2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; --rating update in session 2
COMMIT; -- end of transaction block in Session#2 

-- Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --rating is 3.6
COMMIT; -- end of transaction block in Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --rating is 3.0

-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';