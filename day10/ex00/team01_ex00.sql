WITH user_atribut AS(
	SELECT 	us.id,
			 us.name AS name,
			us.lastname AS lastname
    FROM "user" AS us
	ORDER BY name DESC, lastname),
	
 balance_atribut AS(
	SELECT bl.type, SUM(money) AS volume, bl.user_id,bl.currency_id
	FROM balance AS bl
	GROUP BY bl.type,bl.user_id, bl.currency_id
	ORDER BY bl.type),
	
currency_atribut AS(
	SELECT DISTINCT currency_id, COALESCE(c.name,'not defined') AS currency_name, rate_to_usd AS last_rate_to_usd, c.updated
FROM balance
         FULL JOIN currency c ON balance.currency_id = c.id
WHERE c.updated = (SELECT MAX(updated) FROM currency)
ORDER BY rate_to_usd)

SELECT DISTINCT COALESCE (u.name,'not defined') AS name, COALESCE (u.lastname,'not defined') AS lastname,b.type,b.volume,c.currency_name, c.last_rate_to_usd, round(b.volume * c.last_rate_to_usd) AS total_volume_in_usd  FROM balance_atribut AS b
FULL JOIN user_atribut AS u
ON b.user_id = u.id
FULL JOIN currency_atribut AS c 
ON c.currency_id = b.currency_id
ORDER BY name DESC, lastname, b.type;





