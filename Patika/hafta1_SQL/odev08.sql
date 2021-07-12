
-- NOT: Soru 3 ve 4'te gösterilen "-->" yorumları işlem sonucu return edilen
--      çıktıları (UPDATE veya DELETE edilmiş verileri) temsil etmektedir.

---------------------------------------------------------------------------------------

-- 1. test veritabanınızda employee isimli sütun bilgileri id(INTEGER),
--    name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo
--    oluşturalım.
 
CREATE TABLE employee(
	id INTEGER,
	name VARCHAR(50),
	birthday DATE,
	email VARCHAR(100)
);


---------------------------------------------------------------------------------------

-- 2. Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak
--    50 adet veri ekleyelim.

-- Bu soru için https://www.mockaroo.com/ adresi kullanılmıştır. İlgili 
-- sütun adları ve sütun adlarına göre veriler seçilmiş, tablo adı employee
-- olarak girilmiş ve veri sayısı 50 olarak seçilmiştir. Oluşan sql kodu 
-- kopyalanıp arayüz üzerine yapıştırılmış ve çalıştırılmıştır.


---------------------------------------------------------------------------------------

-- 3. Sütunların her birine göre diğer sütunları güncelleyecek 5 adet
--    UPDATE işlemi yapalım.

UPDATE employee
SET name = 'Ayşe Yılmaz',
	birthday = '1999-01-01',
	email = 'ayseyilmaz@gmail.com'
WHERE id = 10
RETURNING * ;
--> 10	"Ayşe Yılmaz"	"1999-01-01"	"ayseyilmaz@gmail.com"


UPDATE employee
SET id = 25,
	birthday = '1995-02-28',
	email = 'refbedd@gmail.com'
WHERE name = 'Raf Beddoe'
RETURNING * ;
--> 25	"Raf Beddoe"	"1995-02-28"	"refbedd@gmail.com"


UPDATE employee
SET id = 0,
	name = 'xxx',
	email = 'xxx@gmail.com'
WHERE birthday IN ('2000-01-11', '1998-08-05')
RETURNING * ;
-->0	"xxx"	"1998-08-05"	"xxx@gmail.com"
-->0	"xxx"	"2000-01-11"	"xxx@gmail.com"


UPDATE employee
SET id = 0,
	name = 'xxx',
	birthday = '1900-10-30'
WHERE email LIKE '%.uk'
RETURNING * ;
-->0	"xxx"	"1900-10-30"	"knendick11@guardian.co.uk"
-->0	"xxx"	"1900-10-30"	"lvizard14@cam.ac.uk"


UPDATE employee
SET id = 95,
	name = 'birthday&email'
WHERE birthday IN ('1999-06-14', '2000-05-17', '1997-12-06') AND email LIKE '%.com'
RETURNING * ;
-->95	"birthday&email"	"1999-06-14"	"lstebles4@theatlantic.com"
-->95	"birthday&email"	"2000-05-17"	"drhoddie6@mac.com"
-->95	"birthday&email"	"1997-12-06"	"scaserih@zdnet.com"


---------------------------------------------------------------------------------------

-- 4. Sütunların her birine göre ilgili satırı silecek 5 adet DELETE
--    işlemi yapalım.


DELETE FROM employee
WHERE id = 15
RETURNING * ;
-->15	"Leontyne Gleeton"	"1996-11-09"	"lgleetone@tumblr.com"


DELETE FROM employee
WHERE name LIKE 'Ga%'
RETURNING * ;
-->12	"Gard Meek"	"1998-12-31"	"gmeekb@time.com"
-->13	"Gabbi Meynell"	"1999-10-01"	"gmeynellc@wikimedia.org"


DELETE FROM employee
WHERE birthday = '1995-11-10'
RETURNING * ;
-->4	"Roobbie Cannam"	"1995-11-10"	"rcannam3@blogtalkradio.com"


DELETE FROM employee
WHERE email LIKE '%@_____'
RETURNING * ;
-->42	"Quinn Gout"	"2000-04-07"	"qgout15@ow.ly"


DELETE FROM employee
WHERE email LIKE '%.com' AND name ILIKE '%a%a%'
RETURNING * ;
-->11	"Tiphani Hilliam"	"1995-11-20"	"thilliama@dedecms.com"
-->20	"Alika Matiashvili"	"2000-01-09"	"amatiashvilij@bizjournals.com"
-->23	"Anneliese Campbell"	"1999-04-10"	"acampbellm@angelfire.com"
-->25	"Fania Jestico"	"1996-04-03"	"fjesticoo@shareasale.com"
-->27	"Edvard Quarrington"	"1998-05-31"	"equarringtonq@wix.com"
-->47	"Bernadette Alflat"	"1995-09-25"	"balflat1a@zimbio.com"
-->50	"Junina McAlinden"	"1998-12-23"	"jmcalinden1d@feedburner.com"
-->10	"Ayşe Yılmaz"	"1999-01-01"	"ayseyilmaz@gmail.com"
-->95	"birthday&email"	"1999-06-14"	"lstebles4@theatlantic.com"
-->95	"birthday&email"	"2000-05-17"	"drhoddie6@mac.com"
-->95	"birthday&email"	"1997-12-06"	"scaserih@zdnet.com"

