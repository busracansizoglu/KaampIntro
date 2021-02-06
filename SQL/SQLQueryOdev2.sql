Select Products.ProductName ÜrünAdı, 
SUM([Order Details].UnitPrice * [Order Details].Quantity)
[Kazanılan Toplam Miktar] 
from Products
Inner Join [Order Details] on [Order Details].ProductID = Products.ProductID 
Inner Join Orders on Orders.OrderID = [Order Details].OrderID 
Group By ProductName