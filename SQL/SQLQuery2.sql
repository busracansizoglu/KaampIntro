----------------------SELECT--

--Select * from Customers
--Select CompanyName ,ContactName ,City  from Customers
Select CompanyName SirketAdi,ContactName Adi,City Sehir from Customers -- fake TABLO oluşturuyor , ŞirketAdi,Adi,Sehir olarak tabloyu getir..

----------------------FİLTRELEME--

Select * from Customers where City ='London' -- şehri londan olanları getir demek..
--case insensitive -- SQL büyük küçük harf duyarsız
Select * from Products where CategoryID=1 -- Category Id si 1 olanları getir demek..

Select * from Products where CategoryID=1 or CategoryID=3 -- hem 1 hem 3 olanlar gelicek..// ya da
Select * from Products where CategoryID=1 and UnitPrice>=10 -- VE ikiside gelicek..

----------------------SIRALAMA---
select * from Products order by ProductName -- Ürün ismine göre sırala..
select * from Products order by CategoryID, ProductName -- CatagoryId sıralanır CategoryId aynı olanlar isme göre sıralanır..
select * from Products order by UnitPrice asc --ascending//ARTAN
select UnitPrice,ProductName from Products order by UnitPrice desc --descending//AZALAN
select UnitPrice Urunfiyati,ProductName UrunAdi,CategoryID KategoriId from Products where CategoryID=1 order by UnitPrice desc --CategoryId si 1 olan fiyatı azalan olarak getir..

--------------------- ADET BULMA----
Select count(*) from Products --bütün PRODUCT tablosundaki ürün sayısı..Tek kolan /tek satır gelmesi lazım..
--Select count(*)ProductName from Products --GEÇERSİZ--
Select count(*) adet from Products Where CategoryID=2 -- Product dosyasındaki CatagoryId si 2 olanların sayısını ver.. adet yazısı sütuna isim verir..
--sELECT * from Products group by CategoryID --> ÇALIŞMAZ// Select edilen şey YALNIZCA group by da yazılan alan olabilir!!! // ve kümülatif datalar olabilir Count(*) gibi.. 
sELECT CategoryID from Products group by CategoryID --Bütün Dataları bana tekrar etmeyecek şekilde listele demek
sELECT CategoryID,count(*) adet from Products group by CategoryID ---Her CategoryId deki eleman sayılarını listeledi..

------ürün sayısı 10dan az olanları listele ??--
sELECT CategoryID,count(*) adet from Products group by CategoryID having count(*)<10
------Datayı filtrelemek istersek???------
sELECT CategoryID, count(*) adet from Products where UnitPrice>20 group by CategoryID having count(*)<10

-----------------------JOINS-----
select Products.ProductID,Products.ProductName,Products.UnitPrice,Categories.CategoryName-- Kullanıcaya göstermek istediğimiz kısım
from Products inner join Categories --Product ile categories', birlikte getirmek istedik..
on Products.CategoryID=Categories.CategoryID    --//on---> durumunda şartında demek //
--Product tablosundaki CategoryID ile == Categories tablosundaki CategoryID eşitse onları yan yana getir..
where Products.UnitPrice>10
---DTO / Data Transformation Object--==> C# da burdaki Joinin karşılığı

-----------------------JOINS(İNNER JOİN / LEFT JOİN / RİGHT jOİN(left join yazımın tam tersi))-----
--==> Sadece 2 tabloda eşleşen datayı bize getiren JOİN türü..==> İnner Join
Select * from Products p inner Join [Order Details] od 
on p.ProductID = od.ProductID --2155
--==> Solda olup sağda olmayanlarıda getir??
Select * from Products p left Join [Order Details] od 
on p.ProductID = od.ProductID --2155 // aynı veri sayısı olması ==> Ürünlerde olup sipariş detayı olmayan ürün yok demek
--==>Başka bir versiyon;
Select * from Customers c inner join Orders o 
on c.CustomerID =o.CustomerID --830 veri
--==> Solda olup sağda olmayanlarıda getir??
Select * from Customers c left join Orders o 
on c.CustomerID =o.CustomerID --832 veri // Müşterilerde olup Siparişlerde olmayanları getirdi.. 
--==> Yönetim; "sisteme kayıt olmuş fakat sipariş almamış kişileri getir" der. Kampanya vs.
Select * from Customers c left join Orders o 
on c.CustomerID =o.CustomerID 
where o.CustomerID is null --sağda olmayanlar (is null) olarak geçer..
--==> İkiden Fazla Tabloyu JOİN etmek istersek??
Select * from Products p inner Join [Order Details] od 
on p.ProductID = od.ProductID
inner join Orders o
on o.OrderID = od.OrderID --2155

<<<<<<< HEAD
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

Select Top 3 * from Customers
=======
-------------------------ODEV(SQL)--------

>>>>>>> c86fd119c26f61ac6b3553f35f8769cd9edbfe87






