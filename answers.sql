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
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
SELECT name FROM world WHERE gdp/population >  (SELECT gdp/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland');
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100 ) , '%') AS percentage FROM world WHERE continent = 'Europe';
SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world  WHERE continent = 'Europe' AND gdp >0)
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);
SELECT name, continent, population FROM world WHERE continent IN (SELECT continent FROM world  x WHERE 25000000 >= (SELECT MAX(population) FROM world y WHERE x.continent = y.continent));
SELECT name, continent FROM world x
  WHERE population > ALL(SELECT 3*population FROM world y WHERE x.continent = y.continent AND x.name <> y.name)
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
SELECT SUM(population)
   FROM world
SELECT DISTINCT continent FROM world
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
SELECT COUNT(name) FROM world WHERE area >= 1000000
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
SELECT continent, count(name) FROM world GROUP BY continent
SELECT continent, COUNT (name) FROM world WHERE population >= 10000000 GROUP BY continent
SELECT continent FROM world x WHERE (SELECT SUM(population) FROM world y WHERE  x.continent = y.continent) >= 100000000 GROUP BY continent
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
SELECT COUNT(name) FROM bbc WHERE population < 150000
SELECT SUM(population) FROM bbc WHERE region = 'Europe'
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'
SELECT id,stadium,team1,team2
    FROM game WHERE id = 1012
SELECT player, teamid, stadium, mdate
      FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'
SELECT team1, team2, player FROM game JOIN goal ON (id = matchid) WHERE player LIKE 'Mario%'
SELECT player, teamid, coach,gtime
  FROM goal JOIN eteam ON (teamid = eteam.id)
 WHERE gtime<=10
SELECT mdate, teamname FROM game JOIN eteam ON  team1 = eteam.id WHERE coach =  'Fernando Santos'
SELECT player FROM game JOIN goal ON id = goal.matchid WHERE stadium =  'National Stadium, Warsaw'
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';
SELECT teamname, COUNT(teamid)
      FROM eteam JOIN goal ON id=teamid
     GROUP BY teamname
SELECT stadium, COUNT(teamid) FROM game JOIN goal ON id= goal.matchid
     GROUP BY stadium
SELECT matchid , mdate,  COUNT(teamid)
       FROM game JOIN goal ON matchid = id
      WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id WHERE teamid= 'GER'
      GROUP BY matchid, mdate
SELECT DISTINCT mdate, team1,
      SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
      FROM game JOIN goal ON matchid = id
      GROUP BY mdate,team1,team2
      ORDER BY mdate;
game  JOIN goal ON (id=matchid)
matchid, teamid, player, gtime, id, teamname, coach
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid
 SELECT DISTINCT player, teamid
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'National Stadium, Warsaw'
AND (team1 = 'POL' OR team2 = 'POL')
  AND teamid != 'POL'
SELECT DISTINCT player, teamid, gtime
    FROM game JOIN goal ON matchid = id
   WHERE stadium = 'Stadion Miejski (Wroclaw)'
     AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
SELECT id, title
      FROM movie
      WHERE yr=1962
SELECT yr FROM movie WHERE title =  'Citizen Kane'
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr
SELECT id FROM actor WHERE name =  'Glenn Close'
SELECT id FROM movie WHERE title = 'Casablanca'
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = 11768
SELECT name FROM actor JOIN casting ON id = actorid JOIN movie on casting.movieid = movie.id WHERE title = 'Alien'
SELECT title FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = actorid WHERE name =   'Harrison Ford'
SELECT title FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = actorid WHERE name =   'Harrison Ford' AND ord != 1
SELECT title, name FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = actorid WHERE ord = 1 AND yr = 1962
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
SELECT DISTINCT  title, name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE movieid IN (
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')
) AND ord =1
SELECT name FROM actor JOIN casting ON actor.id = actorid WHERE ord =1
GROUP BY name
HAVING COUNT(*) >= 15
SELECT title, COUNT(actorid) FROM movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title
SELECT DISTINCT name FROM actor JOIN casting ON actorid = id JOIN movie ON movieid = movie.id WHERE movieid IN
(SELECT movieid FROM actor JOIN casting ON id = actorid WHERE name =  'Art Garfunkel') AND name != 'Art Garfunkel'
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget
SELECT *
   FROM actor JOIN casting ON actor.id = actorid
   JOIN movie ON movie.id = movieid
SELECT name, COUNT(movieid)
     FROM casting JOIN actor ON actorid=actor.id
    WHERE name LIKE 'John %'
    GROUP BY name ORDER BY 2 DESC
SELECT name
      FROM movie JOIN casting ON movie.id = movieid
      JOIN actor ON actor.id = actorid
    WHERE ord = 1 AND director = 351
SELECT name FROM teacher WHERE dept IS NULL
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
SELECT teacher.name, dept.name
            FROM teacher LEFT JOIN dept
            ON (teacher.dept=dept.id)
SELECT teacher.name, dept.name
            FROM teacher RIGHT JOIN dep
            ON (teacher.dept=dept.id)
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT join dept ON teacher.dept = dept.id
SELECT COUNT(name), COUNT(mobile) FROM teacher
SELECT dept.name, COUNT(teacher.id) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name
SELECT teacher.name,
CASE WHEN dept IN (1,2)
THEN 'Sci'
ELSE 'Art'
END
FROM teacher
SELECT teacher.name,
CASE WHEN dept IN (1,2)
THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None'
END
 FROM teacher
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
 
