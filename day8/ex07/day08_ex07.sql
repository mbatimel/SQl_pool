-- Session#1
BEGIN ISOLATION LEVEL READ COMMITTED; -- start transaction in Session#1
-- Session#2
BEGIN ISOLATION LEVEL READ COMMITTED; -- start transaction in Session#2

-- Session#1
UPDATE pizzeria SET rating = 2 WHERE id = 1;
-- Session#2
UPDATE pizzeria SET rating = 3 WHERE id = 2;

-- Session#1
UPDATE pizzeria SET rating = 4 WHERE id = 2;
-- Session#2
UPDATE pizzeria SET rating = 5 WHERE id = 1;

-- Session#1
COMMIT; -- end of transaction block in Session#1

-- Session#2
COMMIT; -- end of transaction block in Session#2