-------------------------ODEV------------------
------------------(SQL SELCET DISTINCT)--------

--==> Farklı değerleri döndürmek için kullanılır..
select CategoryID from Products 

--==> Tekrar eden ürünü görmek istemiyoruz..
select distinct CategoryID from Products 

--==> Farklı Products'ların sayısını listelemek istiyoruz..
select count(distinct CategoryID) from Products

------------------(SQL NOT operatörleri)----------
SELECT * FROM Customers WHERE NOT Country='Germany' --Ülkesi Almanya olmadığı müşteriler

------------------(SQL INSERT INTO)--------
--==>INSERT INTO ifadesini iki şekilde yazmak mümkündür;
--İlk yol, hem sütun adlarını hem de eklenecek değerleri belirtir:
Insert into Customers(CustomerID,City,Country,ContactName,CompanyName,ContactTitle,PostalCode,Address,Fax,Phone,Region)
Values ('ASDC','Tekirdag','Turkey','Busra Nur Cansızoğlu','BNC','Şehir Plancısı',8500,'ŞEYHSİNAN MAH.',3251254,5462513652,'Laara')

Select * From Customers where City='Tekirdag'

----------------------(SQL UPDATE)-----------
--==>UPDATE deyimi, bir tablodaki mevcut kayıtları değiştirmek için kullanılır.
--!!!UPDATE ifadesindeki WHERE yan tümcesine dikkat edin. WHERE yan tümcesi hangi kayıtların güncellenmesi gerektiğini belirtir. 
--WHERE yan tümcesini atlarsanız, tablodaki tüm kayıtlar güncellenecektir!
UPdate Customers Set City='Samsun',Address='TOKYAY MAH.' where CustomerID='ASDF';
Select * From Customers where Country='Turkey'

----------------------(SQL DELETE)-----------
Delete From Customers where CustomerID='ASDC'
Select * From Customers where Country='Turkey'

----------------------(SQL SELECT TOP)-----------
--==>döndürülecek kayıtların sayısını belirtmek için kullanılır.
--!!!Tüm veritabanı sistemleri SELECT TOP yan tümcesini desteklemez. 
--!!!MySQL, sınırlı sayıda kayıt seçmek için LIMIT yan tümcesini desteklerken, Oracle ROWNUM kullanır.
Select Top 3 * from Customers --"Müşteriler" tablosundaki ilk üç kaydı seçer..
--Select * from Customers --92
SELECT TOP 50 PERCENT * FROM Customers --46--"Müşteriler" tablosundaki kayıtların ilk% 50'sini seçer..
SELECT TOP 3 * FROM Customers where Country='Germany' --ülkenin "Almanya" olduğu (SQL Server/MS Access için) "Müşteriler" tablosundan ilk üç kaydı seçer:

----------------------{SQL MIN() and MAX()}-----------
--==> MIN () işlevi, seçilen sütunun en küçük değerini döndürür.
--==> MAX () işlevi, seçilen sütunun en büyük değerini döndürür.
Select MIN(UnitPrice) As SmallesPrice from Products --en ucuz ürünün fiyatını bulur..
Select MAX(UnitPrice) As LargestPrice from Products --en pahalı ürünün fiyatını bulur..

----------------------{SQL COUNT(), AVG() and SUM()}-----------
--==> COUNT () işlevi, belirli bir ölçütle eşleşen satırların sayısını döndürür.
Select count(ProductID) From Products --ürün sayısını bulur..!!! NULL DEĞERLER SAYILMAZ !!!
--==> AVG () işlevi, sayısal bir sütunun ortalama değerini döndürür.
Select AVG(UnitPrice)From Products --tüm ürünlerin ortalama fiyatını bulur..!!! NULL DEĞERLER SAYILMAZ !!!
--==> SUM () işlevi, bir sayısal sütunun toplam toplamını döndürür
select Sum (Quantity)from [Order Details] --"Sipariş Ayrıntıları" tablosundaki "Miktar" alanlarının toplamını bulur..

----------------------{SQL LIKE Operatörü}-----------
--==> bir sütundaki belirli bir modeli aramak için bir WHERE yan tümcesinde kullanılır.
--==> Genellikle LIKE işleci ile birlikte kullanılan iki joker karakter vardır,
------==> %  Yüzde işareti sıfır, bir veya birden çok karakteri temsil eder..
------==> _  Alt çizgi tek bir karakteri temsil eder..
--!!! Not: MS Access, yüzde işareti (%) yerine yıldız işareti (*) 
--!!!      ve alt çizgi (_) yerine soru işareti (?) Kullanır.
--!!! Yüzde işareti ve alt çizgi de kombinasyonlarda kullanılabilir!

SELECT * FROM Products WHERE ProductName LIKE 'a%' 
-->  "a" ile başlayan ÜRÜNAdı olan tüm Ürünleri seçer.
SELECT * FROM Products WHERE ProductName LIKE '%a'
-->  "a" ile biten ürünAdı olan tüm ürünleri seçer.
SELECT * FROM Products WHERE ProductName LIKE '%or%'
-->  herhangi bir konumda bulunan "veya" ÜrünAdı olan tüm ürünleri seçer..
SELECT * FROM Products WHERE ProductName LIKE '_r%'
-->   ikinci konumda "r" ye sahip bir ÜrünAdı olan tüm Ürünleri seçer..
SELECT * FROM Products WHERE ProductName LIKE 'a__%'
-->  "a" ile başlayan ve en az 3 karakter uzunluğunda olan ÜrünAdına sahip tüm ürünleri seçer
SELECT * FROM Products WHERE ProductName LIKE 'a%n'
-->   "a" ile başlayan ve "o" ile biten ürün adı olan tüm ürünleri seçer..
SELECT * FROM Products WHERE ProductName Not LIKE 'a%' 
-->  "a" ile başlamayan ÜRÜNAdı olan tüm Ürünleri seçer.

----------------------{SQL Wildcards}-----------
--==> Bir dizedeki bir veya daha fazla karakteri değiştirmek için bir joker karakter kullanılır.
--==> Joker karakterler, SQL LIKE işleci ile kullanılır..
--==> % , _ , [] , -  gibi... tüm joker karakterler kombinasyon şeklindede kullanılabilir..
SELECT * FROM Customers WHERE City LIKE 'ber%' --"ber" ile başlayan Şehri...
SELECT * FROM Customers WHERE City LIKE '%es%' --"es" kalıbını içeren bir Şehir..
SELECT * FROM Customers WHERE City LIKE '_ondon' --herhangi bir karakterle başlayan ve ardından "ondon" ile başlayan bir Şehri..
SELECT * FROM Customers WHERE City LIKE 'L_n_on' --"L" ile başlayan, ardından herhangi bir karakter, ardından "n", ardından 
--herhangi bir karakter ve ardından "on" ile başlayan bir Şehre sahip tüm müşterileri
SELECT * FROM Customers WHERE City LIKE '[bsp]%' --"b", "s" veya "p" ile başlayan Şehri olan tüm müşterileri seçer.
SELECT * FROM Customers WHERE City LIKE '[a-c]%' --"a", "b" veya "c" ile başlayan Şehri olan tüm müşterileri seçer.
SELECT * FROM Customers WHERE City LIKE '[!bsp]%' --Şehri "b", "s" veya "p" ile BAŞLAMAYAN tüm müşterileri seçer:
--VEYA;
SELECT * FROM Customers WHERE City NOT LIKE '[bsp]%'

----------------------{SQL IN Operatörü}-----------
--==> IN operatörü, bir WHERE yan tümcesinde birden çok değer belirtmenize izin verir.
--==> IN operatörü, birden çok OR koşulu için bir kısaltmadır.
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK') 
--> "Almanya", "Fransa" veya "İngiltere" de bulunan tüm müşterileri seçer
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK')
--> "Almanya", "Fransa" veya "İngiltere" konumunda OLMAYAN tüm müşterileri seçer
SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers)
--> tedarikçilerle aynı ülkelerden olan tüm müşterileri seçer

----------------------{SQL BETWEEN Operatörü}-----------
--==> belirli bir aralıktaki değerleri seçer. Değerler sayılar, metin veya tarihler olabilir.
--==> BETWEEN operatörü kapsayıcıdır: başlangıç ​​ve bitiş değerleri dahildir.
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20
--> fiyatı 10 ile 20 ARASINDA olan tüm ürünleri seçer
SELECT * FROM Products WHERE UnitPrice NOT BETWEEN 10 AND 20
--> fiyatı 10 ile 20 aralığı dışındaki ürünleri görüntülemek için ARASINDA DEĞİ
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3)
-->fiyatı 10 ile 20 ARASINDA olan tüm ürünleri seçer. Ayrıca; Kategori Kimliği 1,2 veya 3 olan ürünleri göstermez
SELECT * FROM Products WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName
-->Carnarvon Tigers ve Mozzarella di Giovanni ARASINDA ÜrünAdı olan tüm ürünleri seçer.
SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName
--> Carnarvon Tigers ve Mozzarella di Giovanni ARASINDA OLMAYAN bir ÜrünAdı olan tüm ürünleri seçer.
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'
--> '01 -Temmuz-1996 've '31 -Temmuz-1996' arasında bir OrderDate olan tüm siparişleri seçer

----------------------{SQL UNION Operatörü}-----------
--==> iki veya daha fazla SELECT deyiminin sonuç kümesini birleştirmek için kullanılır.
---------> UNION içindeki her SELECT ifadesi aynı sayıda sütuna sahip olmalıdır
---------> Sütunlar da benzer veri türlerine sahip olmalıdır
---------> Her SELECT ifadesindeki sütunlar da aynı sırada olmalıdır
SELECT City FROM Customers  --hem "Müşteriler" hem de "Tedarikçiler" 
UNION                       --tablosundaki şehirleri
SELECT City FROM Suppliers  --(yalnızca farklı değerler) döndürür..
ORDER BY City;-----------Aynı değerleri seçmek için UNION ALL kullanın!






