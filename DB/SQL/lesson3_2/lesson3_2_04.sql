SELECT name, price, price - cost FROM items;

SELECT AVG(price - cost) FROM items;

SELECT name, price - cost FROM items
ORDER BY price - cost DESC
LIMIT 5;