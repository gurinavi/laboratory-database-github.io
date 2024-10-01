SELECT name, population
FROM cities
WHERE population>1000000;

SELECT name, population, region
FROM cities
WHERE region = 'E' OR region = 'W'
ORDER BY population ASC;

SELECT *
FROM cities
WHERE region IN('S','C','N') AND population>50000

SELECT *
FROM cities
WHERE region IN('E','W','N') AND (population>150000 AND population<350000)
ORDER BY name ASC
LIMIT 20;

SELECT *
FROM cities
WHERE NOT region='E' AND NOT region='W'
ORDER BY population ASC
LIMIT 10 OFFSET 10;
