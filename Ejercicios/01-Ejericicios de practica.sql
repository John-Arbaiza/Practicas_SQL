-- Ejercicios de sql

-- Ejercio 1
select * from city where population > 12000 and countrycode = 'USA';

-- Ejercicio 2
select * from city;

-- Ejercicio 3
select * from city where id = 1661;

-- Ejercicio 4
select * city where countrycode = 'JPN';

-- Ejercicio 5
select name from city where countrycode = 'JPN';

-- Ejercicio 6
select ciudad, estado from station;

/* 
Ejercicio 7:
selecciona las ciudades (city) únicas de la tabla station donde el valor de id es par.
La condición (id % 2) = 0 verifica si el valor de id es divisible por 2, es decir, si
es un número par. El distinct asegura que solo se muestren ciudades únicas en el resultado.
*/
select distinct city from station where (id%2) = 0;

/* 
Ejercicio 8:
calcula cuántas filas en la tabla station tienen valores duplicados en la columna city.
Resta el número de ciudades distintas (count(distinct city)) del total de filas (count(*)),
lo que da como resultado la cantidad de filas con valores repetidos en esa columna.
*/
select count(*) - count(distinct city) from station; 

-- Ejercicio 10
-- Se realiza una consulta para obtener la ciudad con el nombre más largo y la ciudad con el
-- nombre más corto de la tabla "station"
(select city, length(city) from station order by length(city) desc, city asc limit 1)
union
(select city, length(city) from station order by length(city) asc, city asc limit 1);

-- Ejercicio 11
-- Selecciona las ciudades de la tabla "station"donde el nombre de la ciudad 
-- empieza con las vocales 'a, e, i, o, u'
select distinct city 
from station 
where city like 'a%' or city like 'e%' or city like 'i%' 
or city like 'o%' or city like 'u%';

-- Ejercicio 12
-- Selecciona las ciudades de la tabla "station"donde el nombre de la ciudad 
-- termina con las vocales 'a, e, i, o, u'
select distinct city 
from station 
where city like '%a' or city like '%e' or city like '%i' 
or city like '%o' or city like '%u';

-- Ejercicio 13
-- Selecciona las ciudades de la tabla "station"donde el nombre de la ciudad empieza con
-- una vocal (a, e, i, o, u) Y además el nombre de la ciudad termina con una vocal (a, e, i, o, u)
select distinct city from station where (city like 'a%' or city like 'e%' or city like 'i%' 
or city like 'o%' or city like 'u%' ) and (city like '%a' or city like '%e' or city like '%i' 
or city like '%o' or city like '%u');

/*
Dada una tabla de candidatos y sus habilidades, se le asigna la tarea de encontrar a los candidatos
más adecuados para un puesto vacante de Data Science. Quieres encontrar candidatos que dominen
Python, Tableau y PostgreSQL.

Escribe una consulta para listar los candidatos que poseen todas las habilidades requeridas para el
trabajo. Ordene la salida por ID de candidato en orden ascendente.
*/

SELECT candidate_id
FROM candidates
WHERE skill ILIKE '%Python%'
   OR skill ILIKE '%Tableau%'
   OR skill ILIKE '%PostgreSQL%'
   GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;
