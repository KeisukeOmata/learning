SELECT items.id, items.name, COUNT(*) FROM items
JOIN sales_records
ON items.id = sales_records.item_id
GROUP BY items.id, items.name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- sales_recordsにitemsを紐付けることで、売れた数分のレコードに価格カラムが追加されるのでSUMするだけでOK
SELECT SUM(items.price) AS "総売上", SUM(items.price - items.cost) AS "総利益" FROM sales_records            
JOIN items            
ON sales_records.item_id = items.id;         