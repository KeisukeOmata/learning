SELECT users.id, users.name, COUNT(*) AS "購入数" FROM sales_records
JOIN users
ON sales_records.user_id = users.id
GROUP BY users.id, users.name
-- HAVING は GROUP BYのあと
HAVING COUNT(*) >= 10;


SELECT users.id, users.name FROM sales_records            
JOIN users            
ON sales_records.user_id = users.id
-- WHERE は GROUP BYの前      
WHERE sales_records.item_id = (            
  SELECT id            
  FROM items            
  WHERE name = "サンダル"            
)            
-- グループ化しないとusers.idとusers.nameはそれぞれ重複する
GROUP BY users.id, users.name;