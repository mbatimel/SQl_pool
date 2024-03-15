insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH t AS (
    SELECT
        balance.user_id,
        currency.id,
        currency.name AS name,
        balance.money AS money,
        (SELECT currency.rate_to_usd FROM currency
                                     WHERE currency.id = balance.currency_id
                                     AND currency.updated < balance.updated
                                     ORDER BY rate_to_usd LIMIT 1) AS min,
        (SELECT currency.rate_to_usd FROM currency
                                     WHERE currency.id = balance.currency_id
                                     AND currency.updated > balance.updated
                                     ORDER BY rate_to_usd LIMIT 1) AS max
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
    GROUP BY
            balance.money,
            currency.name,
            currency.id,
            balance.updated,
            balance.currency_id,
            balance.user_id
    ORDER BY min DESC, max
), answer AS (
    SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    t.name AS currency_name,
    t.money * COALESCE(t.min, t.max) AS currency_in_usd
FROM t
LEFT JOIN "user" AS u ON t.user_id = u.id
ORDER BY name DESC, lastname, currency_name
)
SELECT * FROM answer