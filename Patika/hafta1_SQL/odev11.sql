-- NOT: Sorgular tek satırlık olduğundan parantez kullanımına ihtiyaç duymadım.
-- Tüm verileri sıralamak için verileri birleştirdikten sonra sıraladım.

---------------------------------------------------------------------------------------

-- 1. actor ve customer tablolarında bulunan first_name sütunları için tüm
--    verileri sıralayalım.

SELECT first_name FROM actor
UNION
SELECT first_name FROM customer
ORDER BY first_name;
--> 647 satır listelendi.

---------------------------------------------------------------------------------------

-- 2. actor ve customer tablolarında bulunan first_name sütunları için kesişen
--    verileri sıralayalım.

SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer
ORDER BY first_name;
--> 72 satır listelendi.

---------------------------------------------------------------------------------------

-- 3. actor ve customer tablolarında bulunan first_name sütunları için ilk
--    tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.

SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer
ORDER BY first_name;
--> 56 satır listelendi.

---------------------------------------------------------------------------------------

-- 4. İlk 3 sorguyu tekrar eden veriler için de yapalım.

SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY first_name;
--> 799 satır listelendi.


SELECT first_name FROM actor
INTERSECT ALL
SELECT first_name FROM customer
ORDER BY first_name;
--> 72 satır listelendi.
-- Burada zaten kesişen satırlar alındığı için çıktıda değişiklik olmamıştır.


SELECT first_name FROM actor
EXCEPT ALL
SELECT first_name FROM customer
ORDER BY first_name;
--> 128 satır listelendi.
