create procedure [233792].AddCustomer
	@Title nvarchar(8) = null,
	@FirstName dbo.Name,
	@MiddleName dbo.Name = null,
	@LastName A2_ścibiór.LastName,
	@Suffix nvarchar(10) = null ,
	@CompanyName nvarchar(128) = null,
	@SalesPerson nvarchar(256) = null,
	@EmailAddress nvarchar(50) = null,
	@Phone dbo.Phone = null,
	@PasswordHash varchar(128),
	@PasswordSalt varchar(10)

as begin
set nocount on
begin try
	begin transaction
	insert into [233792].Customer( Title, FirstName, MiddleName, LastName, Suffix, CompanyName, SalesPerson, EmailAddress, Phone, PasswordHash, PasswordSalt, rowguid, ModifiedDate)
	values(@Title, @FirstName, @MiddleName, @LastName, @Suffix, @CompanyName, @SalesPerson, @EmailAddress, @Phone, @PasswordHash, @PasswordSalt, NEWID(), GETDATE())

	commit transaction
end try
begin catch
	if @@TRANCOUNT>0
	rollback transaction
	throw
end catch
end