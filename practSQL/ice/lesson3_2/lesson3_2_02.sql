SELECT AVG(age) FROM users;

SELECT * FROM users
WHERE age < 20 AND gender = 0;

SELECT users.age, COUNT(users.age) FROM users
GROUP BY users.age;