SELECT SUM(price), purchased_at, character_name FROM purchases
WHERE category = "食費"
GROUP BY purchased_at, character_name;