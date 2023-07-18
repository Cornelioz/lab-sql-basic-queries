#1. Show all tables.
    USE sakila;
    SHOW TABLES;
    
#2. Retrieve all the data from the tables `actor`, `film` and `customer`.
    SELECT *
    FROM sakila.actor;
    
    SELECT *
    FROM sakila.film;
    
    SELECT *
    FROM sakila.customer;
    
#3. Retrieve the following columns from their respective tables:
	# 3.1 Titles of all films from the film table
	# 3.2. List of languages used in films, with the column aliased as language from the language table
	# 3.3 List of first names of all employees from the staff table 

SELECT film.title
FROM sakila.film;

SELECT DISTINCT language.name AS Language
FROM sakila.language;

SELECT staff.first_name
FROM sakila.staff;

#4. Retrieve unique release years.

SELECT DISTINCT film.release_year
FROM sakila.film;

#5. Counting records for database insights:

# 5.1 Determine the number of stores that the company has.    
SELECT COUNT(DISTINCT store.store_id)
FROM sakila.store;

# 5.2 Determine the number of employees that the company has.
SELECT COUNT(DISTINCT staff.staff_id)
FROM sakila.staff;

# 5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(DISTINCT film.film_id)
FROM sakila.film;

SELECT COUNT(DISTINCT inventory.film_id)
FROM sakila.inventory
INNER JOIN sakila.rental
ON sakila.inventory.inventory_id = sakila.rental.inventory_id;

# 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT actor.last_name)
FROM sakila.actor;

#6. Retrieve the 10 longest films.
SELECT film.title, length
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

#7.  Use filtering techniques in order to:
	# 7.1 Retrieve all actors with the first name "SCARLETT".

SELECT actor.first_name, actor.last_name
FROM sakila.actor
WHERE actor.first_name = "Scarlett";


#7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
# *Hint: use `LIKE` operator. [More information here.](https://www.w3schools.com/sql/sql_like.asp)*

SELECT film.title, film.length
FROM sakila.film
WHERE title LIKE "%ARMAGEDDON%" AND length > 100;

# 7.3 Determine the number of films that include Behind the Scenes content */
    
SELECT COUNT(film.title)
FROM sakila.film
WHERE film.special_features LIKE "%Behind the Scenes%"