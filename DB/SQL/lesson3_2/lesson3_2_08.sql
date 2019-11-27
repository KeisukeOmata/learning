SELECT purchased_at, SUM(price) AS "売上額" FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY purchased_at;