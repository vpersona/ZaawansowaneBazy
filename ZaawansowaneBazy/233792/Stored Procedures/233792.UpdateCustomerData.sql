create   procedure [233792].UpdateCustomerData
	(
	@CustomerId int,
	@Title nvarchar(8) = null,
	@FirstName dbo.Name =null,
	@MiddleName dbo.Name = null,
	@LastName A2_ścibiór.LastName = null,
	@CompanyName nvarchar(128) = null,
	@SalesPerson nvarchar(256) = null,
	@EmailAddress nvarchar(50) = null,
	@Phone dbo.Phone = null
	)

as
begin 
	set nocount on;
		begin try
			begin transaction
				update [233792].Customer
				set
				Title = isnull(@Title, Title),
				FirstName=isnull(@FirstName, FirstName),
				LastName = isnull(@LastName, LastName),
				MiddleName = isnull (@MiddleName, MiddleName),
				SalesPerson = isnull(@SalesPerson, SalesPerson),
				CompanyName = isnull (@CompanyName, CompanyName),
				EmailAddress = isnull(@EmailAddress, EmailAddress),
				Phone = isnull(@Phone, Phone),
				ModifiedDate = getdate()
				where CustomerID = @CustomerId

			if @@ROWCOUNT = 0
			begin
				;throw 50005, 'Rekord nie istnieje', 1;
			end

		commit transaction
end try
begin catch
	if @@TRANCOUNT>0
	rollback transaction;
	;throw;

end catch

end