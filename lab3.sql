SELECT name
FROM cities
WHERE name LIKE '%ськ';

SELECT name
FROM cities
WHERE name LIKE '%донец%';

SELECT Concat(name, '(', region, ')') 
FROM cities 
WHERE population > 100000 
ORDER BY population ASC;

SELECT name, 
       region, 
       population, 
       (population / 40000000.0) * 100 AS population_percentage 
FROM cities 
ORDER BY population DESC 
LIMIT 10;

SELECT Concat(name, ' - ', ROUND((population / 40000000.0) * 100, 2), '%') AS city_population_percentage
FROM cities
WHERE (population / 40000000.0) * 100 >= 0.1
ORDER BY (population / 40000000.0) * 100 DESC;
