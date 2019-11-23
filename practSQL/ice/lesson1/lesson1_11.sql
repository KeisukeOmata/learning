SELECT *
FROM purchases
WHERE category = "食費"
AND character_name = "hoge";

SELECT *
FROM purchases
WHERE category = "食費"
OR character_name = "hoge";