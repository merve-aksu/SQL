1. film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

      SELECT COUNT (*) FROM film
      WHERE length > (SELECT AVG(length)FROM film );

2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

      SELECT COUNT (*) FROM film
      WHERE rental_rate = (SELECT MAX (rental_rate)FROM film);

3. film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.

      SELECT * FROM film
      WHERE rental_rate = (SELECT MIN(rental_rate)FROM film) AND replacement_cost= (SELECT MIN(replacement_cost)FROM film);

4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.


      SELECT DISTINCT first_name,last_name FROM customer
      INNER JOIN payment ON customer.customer_id = payment.customer_id 
      WHERE payment.customer_id = ANY (SELECT customer_id FROM payment 
      GROUP BY customer_id HAVING COUNT(customer_id) > 1 ORDER BY COUNT(customer_id) DESC LIMIT 5);
