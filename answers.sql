SELECT population FROM world
  WHERE name = 'Germany'
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
SELECT name, population
  FROM world
  WHERE population BETWEEN 1000000 AND 1250000
SELECT name FROM world
  WHERE name LIKE '%a' OR name LIKE '%l'
SELECT name, area, population
  FROM world
  WHERE area > 50000 AND population < 10000000
SELECT name, population/area
  FROM world
  WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
SELECT name, continent, population FROM world
SELECT name
  FROM world
 WHERE population >= 200000000
SELECT name, gdp/population FROM world
 WHERE population >= 200000000;
SELECT name, population/1000000 AS population_in_millions
FROM world WHERE continent LIKE 'South America';
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');
SELECT name FROM world WHERE name LIKE '%United%';
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000;
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000;
SELECT name, ROUND(population/1000000, 2), ROUND( gdp/1000000000, 2) FROM world
WHERE continent LIKE  'South America';
SELECT name, ROUND(gdp/population/1000)*1000 FROM world WHERE gdp >= 1000000000000;
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;
SELECT name
FROM world
WHERE name NOT LIKE '% %'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
SELECT name
  FROM world
 WHERE name LIKE 'U%'
SELECT population
  FROM world
  WHERE name = 'United Kingdom'
SELECT name, population
    FROM world
   WHERE continent IN ('Europe', 'Asia')
SELECT name FROM world
    WHERE name IN ('Cuba', 'Togo');
SELECT yr, subject, winner
      FROM nobel
     WHERE yr = 1950;
SELECT winner
       FROM nobel
      WHERE yr = 1962
        AND subject = 'Literature'
SELECT yr, subject
        FROM nobel
        WHERE winner LIKE 'Albert Einstein'
SELECT winner
        FROM nobel
        WHERE yr >= 2000 AND subject = 'Peace'
SELECT yr, subject, winner
        FROM nobel
        WHERE subject LIKE 'Literature' AND yr >= 1980 AND yr <= 1989;
SELECT * FROM nobel
         WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');
SELECT winner FROM nobel
         WHERE winner LIKE 'John%';
SELECT yr, subject, winner FROM nobel
         WHERE (subject LIKE 'Physics' AND yr = 1980) XOR (subject LIKE 'Chemistry' AND yr =  1984);
SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
SELECT yr, subject, winner FROM nobel
WHERE (subject LIKE 'Medicine' AND yr < 1910) XOR (subject LIKE 'Literature' AND yr >= 2004);
SELECT * FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG';
SELECT * FROM nobel WHERE winner LIKE 'EUGENE O\'NEILL'
SELECT winner, yr, subject FROM nobel WHERE
winner LIKE 'Sir%' ORDER BY yr DESC ;
SELECT winner, subject FROM nobel WHERE yr = 1984
ORDER BY
CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END, subject, winner; 
