SELECT items.gender, SUM(items.price) AS "売上額" FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.gender;


SELECT items.id, items.name, items.price * COUNT(*) AS "売上額" FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
ORDER BY items.price * COUNT(*) DESC
LIMIT 5;


SELECT items.id, items.name, items.price * COUNT(*) AS "売上額" FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
-- HAVING は GROUP BYのあと
HAVING items.price * COUNT(*) > (
  SELECT items.price * COUNT(*) FROM sales_records
  JOIN items
  ON sales_records.item_id = items.id
  WHERE items.name = "グレーパーカー"
);