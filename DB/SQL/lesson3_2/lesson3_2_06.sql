SELECT item_id, COUNT(*) FROM sales_records
GROUP BY item_id
ORDER BY COUNT(*) DESC
LIMIT 5;