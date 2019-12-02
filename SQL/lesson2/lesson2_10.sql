SELECT SUM(price), purchased_at, character_name FROM purchases
GROUP BY purchased_at, character_name
HAVING SUM(price) > 3000;
