SELECT *
FROM cities
ORDER BY population ASC
LIMIT 10
OFFSET 10;

SELECT *
FROM cities
ORDER BY name DESC
LIMIT 30;

SELECT *
FROM cities
ORDER BY region ASC, population DESC;

SELECT DISTINCT region
FROM cities;

SELECT *
FROM cities
ORDER BY region DESC, name DESC;