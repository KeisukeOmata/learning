SELECT COUNT(*), purchased_at, character_name FROM purchases
GROUP BY purchased_at, character_name;