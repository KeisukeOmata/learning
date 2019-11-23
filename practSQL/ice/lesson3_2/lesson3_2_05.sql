SELECT name, price - cost FROM items
WHERE price - cost > (
  SELECT price - cost FROM items
  WHERE name = "グレーパーカー"
)
AND price <= 7000;