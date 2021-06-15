#1.Select all the actors with the first name ‘Scarlett’.
select first_name from actor
where first_name = 'Scarlett'; 

#2.How many films (movies) are available for rent and how many films have been rented?
select count(inventory_id) from inventory; 
select count(rental_id) from rental;

#3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration, min(length) as min_duration from film;

#4.What's the average movie duration expressed in format (hours, minutes)?
select concat(FLOOR(avg(length)/60),'h ',MOD(avg(length),60),'m') as average_duration from film;

#5.How many distinct (different) actors last names are there?
select count(distinct last_name) from actor;

#6.Since how many days has the company been operating (check DATEDIFF() function)?
select datediff("2005-05-24", "2005-07-09");

#7.Show rental info with additional columns month and weekday. Get 20 results.
select *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as month, 
date_format(convert(substring_index(rental_date, ' ', 1), date), '%d') as weekday 
from rental limit 20;

#8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

#9.How many rentals were in the last month of activity?