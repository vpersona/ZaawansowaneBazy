create function [233792].CustomerExists
(
@FirstName dbo.Name,
@LastName A2_ścibiór.LastName,
@Phone dbo.Phone ,
@EmailAddress nvarchar (50)
)
returns bit
as 
begin

	declare @exists bit;
	if EXISTS (
	select 1
	from [233792].Customer
	where FirstName = @FirstName
		and LastName = @LastName
		and Phone = @Phone
		and EmailAddress = @EmailAddress
		)
		set @exists = 1 --istnieje
	else
		set @exists = 0 -- nie ma
	return @exists

end