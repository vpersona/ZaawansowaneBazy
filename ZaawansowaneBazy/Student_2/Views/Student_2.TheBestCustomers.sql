
create view [Student_2].TheBestCustomers
as select top 100
c.CustomerID, c.FirstName, c.LastName, sum (s.TotalDue) as MoneySum
from [233792].Customer as c inner join  SalesLT.SalesOrderHeader as s
on c.CustomerID = s.CustomerID
group by c.CustomerID, c.FirstName, c.LastName
order by MoneySum desc