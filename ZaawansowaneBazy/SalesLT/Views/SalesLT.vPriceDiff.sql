
create view SalesLT.vPriceDiff
as select p.ProductID, p.Name, p.ListPrice as CurrentPrice, p.StandardCost
from SalesLT.Product p;