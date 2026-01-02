

create function [233792].ufn_CustomerOrderDetails (@CustID int)
returns table
as
return (
	select ProductID, OrderQty, LineTotal
	from SalesLT.SalesOrderDetail od join SalesLT.SalesOrderHeader oh
	on od.SalesOrderID=oh.SalesOrderID
	where oh.CustomerID = @CustID
	)