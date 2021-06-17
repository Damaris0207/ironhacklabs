# 0.Inspect the database structure and find the best-fitting table to analyse for the next task.
# 1.Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length,
rank() over (order by length) as duration_films_rank
from film
where length is not null and length <> 0;

# 2.Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
select title, length, rating,
rank() over (partition by rating order by length) as duration_films_rank2
from film;

# 3.How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
select c.name, count(f.title)
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
group by c.category_id;

# 4.Which actor has appeared in the most films?
select a.first_name, a.last_name, count(fa.film_id) as number_of_films
from actor a 
join film_actor fa
on a.actor_id = fa.actor_id
group by a.actor_id
order by number_of_films DESC;

# 5.Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(r.customer_id) as number_of_rentals
from customer c 
join rental r
on c.customer_id = r.customer_id
group by c.customer_id
order by number_of_rentals DESC;

# Bonus: Which is the most rented film?
select f.title, count(r.rental_id) as most_rented_film
from film f
join inventory i
on f.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
join customer c
on r.customer_id = c.customer_id
group by f.film_id
order by most_rented_film DESC;



