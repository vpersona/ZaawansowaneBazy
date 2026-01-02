create procedure [233792].ReturnCustomer
	@FirstName dbo.Name = null,
	@LastName A2_ścibiór.LastName = null,
	@CustomerId int = null,
	@EmailAddress nvarchar(50) = null

as 
begin
set nocount on;
	select FirstName, LastName, CustomerId, EmailAddress
	from [233792].Customer
	where (	@FirstName is null or Firstname=@FirstName) and
	(@LastName is null or LastName = @LastName) and
	(@CustomerId is null or @CustomerId = CustomerID) and 
	(@EmailAddress is null or @EmailAddress = EmailAddress)
	

end