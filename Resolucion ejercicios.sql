-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
USE sakila;
SELECT 
DISTINCT (title)
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT *
FROM film
WHERE rating = 'PG-13';

-- 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title,description
FROM film
WHERE description IN ('Amazing');


-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT
title
FROM  film 
WHERE length> '120';


-- 5. Recupera los nombres de todos los actores.
SELECT
first_name
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT
first_name,last_name
FROM actor
WHERE last_name= 'Gibson';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;


-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT 
title
FROM film 
WHERE rating NOT IN ('R', ' PG-13');

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT  film_id AS film,
category_id AS category,
COUNT (DISTINCT category_id) AS Num_peliculas
FROM film
GROUP BY  film_id;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT 
customer.customer_id AS ID_cliente,
customer.first_name AS Nombre, 
customer.last_name AS Apellido,
COUNT(rental.rental_id) AS Total_peliculas_ALquiladas 
FROM customer
JOIN  rental 
ON customer.customer_id= rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY Total_peliculas_ALquiladas  DESC;


-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT 
    category.name AS Nombre_Categoria,
    COUNT(rental.rental_id) AS Total_Alquiladas
FROM 
    rental 
JOIN 
    inventory 
ON 
    rental.inventory_id = inventory.inventory_id
JOIN 
    film 
ON 
    inventory.film_id = film.film_id
JOIN 
    film_category 
ON 
    film.film_id = film_category.film_id
JOIN 
    category
ON 
    film_category.category_id = category.category_id
GROUP BY 
    category.name
ORDER BY 
    Total_Alquiladas DESC;


-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
USE sakila;

SELECT AVG(length) AS Duracion_Promedio, rating AS Clasificacion
FROM film
GROUP BY rating
ORDER BY Duracion_Promedio DESC;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
USE sakila;

SELECT 
    
actor.first_name AS Nombre, 
actor.last_name AS Apellido,
film.title AS Titulo

FROM actor

JOIN film_actor
ON actor.actor_id = film_actor.actor_id

JOIN film

ON film_actor.film_id = film.film_id

WHERE
film.title = 'Indian Love';



-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT
title,
description
FROM film 
WHERE description LIKE '%dog%' OR description LIKE '%cat%';



-- 15. Encuentr a el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT 
title,
release_year
FROM film
WHERE release_year BETWEEN '2005' AND '2010';


-- 16. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT
film.title AS titulo,
category.name AS categoria
FROM film
INNER JOIN film_category
ON film.film_id= film_category.film_id 
LEFT JOIN category
ON film_category.category_id= category.category_id
WHERE category.name = 'Family';

-- 17. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla

SELECT
title AS Titulo,
rating AS Rating, 
length AS duracion
FROM Film
WHERE rating= 'R'and length > 120;


-- BONUS 

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT
actor.first_name AS Nombre_Actor, 
actor.last_name AS Apellido_Actor,
COUNT( film_actor.film_id) AS Num_Peliculas
FROM actor
JOIN film_actor
ON  actor.actor_id= film_actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT( film_actor.film_id) > 10;

-- 19. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.


-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días 
-- y luego selecciona las películas correspondientes.
-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
-- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
-- 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
-- 25. Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores 
-- y el número de películas en las que han actuado juntos.






