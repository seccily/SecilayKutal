-- NOT: "-->" yorumları işlem sonucu return edilen çıktıları temsil etmektedir.

---------------------------------------------------------------------------------------

-- 1. film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu
--    ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT COUNT(*) FROM film
WHERE length >
(
	SELECT AVG(length) FROM film
);
--> 489 

---------------------------------------------------------------------------------------

-- 2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(*) FROM film
WHERE rental_rate =
(
	SELECT MAX(rental_rate) FROM film
);
--> 336

---------------------------------------------------------------------------------------

-- 3. film tablosunda en düşük rental_rate ve en düşük replacement_cost
--    değerlerine sahip filmleri sıralayınız.

SELECT title, rental_rate, replacement_cost FROM film
WHERE rental_rate = 
(
	SELECT MIN(rental_rate) FROM film
)
AND replacement_cost =
(
	SELECT MIN(replacement_cost) FROM film
);
--> 15 satır listelendi.

---------------------------------------------------------------------------------------

-- 4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri
--    (customer) sıralayınız.

SELECT customer.first_name, customer.last_name, COUNT(*) AS shopping_count FROM payment
INNER JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
ORDER BY shopping_count DESC;
--> 599 satır listelendi.