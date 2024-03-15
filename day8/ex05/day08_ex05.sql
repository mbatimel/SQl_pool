-- Session#1
BEGIN ISOLATION LEVEL READ COMMITTED; -- start transaction in Session#1
-- Session#2
BEGIN ISOLATION LEVEL READ COMMITTED; -- start transaction in Session#2

-- Session#1
SELECT SUM(rating) FROM pizzeria;
-- Session#2
SELECT SUM(rating) FROM pizzeria;

-- Session#2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; --rating update in session 2
COMMIT; -- end of transaction block in Session#2 

-- Session#1
SELECT SUM(rating) FROM pizzeria;
COMMIT; -- end of transaction block in Session#1
SELECT SUM(rating) FROM pizzeria;

-- Session#2
SELECT SUM(rating) FROM pizzeria;