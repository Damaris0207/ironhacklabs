# 1.In the actor table, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select last_name, count(last_name) as name_count
from actor 
group by last_name
having name_count = 1;

# 2.Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
select last_name, count(last_name) as name_count
from actor 
group by last_name
having name_count > 1;

# 3.Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(staff_id) as employee_rentals from rental
group by staff_id;

# 4.Using the film table, find out how many films were released each year
select release_year, count(title) as films_year_count from film
group by release_year;

# 5.Using the film table, find out for each rating how many films were there.
select rating, count(title) as rating_count from film
group by rating;

# 6.What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length), 2) from film
group by rating;

# 7.Which kind of movies (based on rating) have an average duration of two hours or more?
select rating from film
group by rating
having round(avg(length)) = 120 or round(avg(length)) > 120;
