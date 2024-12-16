--list customers who has made a total payment over 185
SELECT first_name, last_name,
(SELECT sum(amount) from payment WHERE customer.customer_id = payment.customer_id) as total_payment
from customer
where  total_payment > 185

--list te customers name and their total payment, but only for those customers who paid morethan the average amount across all customers
SELECT first_name, last_name,
(SELECT round(sum(amount),2) from payment where customer.customer_id = payment.customer_id) as total_payment
from customer
where total_payment > (SELECT avg(amount) from payment)

--display each actors"s fullname along with total number of films they have appearedactor
SELECT concat(first_name, '', last_name) as fullname,
(SELECT count(film_id) FROM film_actor  WHERE actor.actor_id = film_actor.actor_id) as n0_of_films
from actor  