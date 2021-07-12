-- 1. country tablosunda bulunan country sütunundaki ülke isimlerinden
--'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.

SELECT country FROM country
WHERE country LIKE 'A%a'; -- veya WHERE country ~~ 'A%a';

---------------------------------------------------------------------------------------

-- 2. country tablosunda bulunan country sütunundaki ülke isimlerinden
-- en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları
-- sıralayınız.

-- Burada 5 tane _ karakteri ve 1 tane n karakteri kullandığımızda 
-- kelimenin uzunluğu 6 oluyor. % ise 6dan fazla veya 6ya eşit olmasını
-- sağlıyor.
SELECT country from country
WHERE country LIKE '_____%n'; -- veya WHERE country ~~ '_____%n';

---------------------------------------------------------------------------------------

-- 3. film tablosunda bulunan title sütunundaki film isimlerinden en
-- az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren
-- film isimlerini sıralayınız.

SELECT title from film
WHERE title ILIKE '%t%t%t%t%'; -- veya WHERE title ~~* '%t%t%t%t%';

---------------------------------------------------------------------------------------

-- 4. film tablosunda bulunan tüm sütunlardaki verilerden title 'C'
-- karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve
-- rental_rate 2.99 olan verileri sıralayınız.

SELECT * FROM film
WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99; 
-- veya WHERE title ~~ 'C%' AND length > 90 AND rental_rate = 2.99;
