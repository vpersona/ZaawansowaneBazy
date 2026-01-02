create view [233792].vCustomersActive as 
select distinct
	c.CustomerID,
	c.FirstName,
	c.LastName,
	c.EmailAddress
	from [233792].Customer c
	join SalesLT.SalesOrderHeader oh on c.CustomerID=oh.CustomerID
	where oh.OrderDate >=DateADD(day, -365, getdate());