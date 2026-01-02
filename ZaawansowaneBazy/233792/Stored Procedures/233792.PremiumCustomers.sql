

create procedure [233792].PremiumCustomers
as
begin

	set nocount on;

	declare @Results table(
		CustomerID int,
		FullName nvarchar(101),
		TotalSpent Money,
		CustomerStatus nvarchar(20)
		);

	declare @CurrentCustID int;
	declare @FName nvarchar(50);
	declare @LName nvarchar (50);
	declare @Total money;
	declare @Status nvarchar(20);

	declare CustCursor cursor for 
	select CustomerID, FirstName, LastName from [233792].vCustomersActive;

	open CustCursor;
	fetch next from CustCursor into @CurrentCustID, @FName, @LName;

	while @@FETCH_STATUS=0

	BEGIN

		SELECT @total = ISNULL (SUM(LineTotal),0)
		from [233792].ufn_CustomerOrderDetails(@CurrentCustID);

		if @Total >5000
			set @Status = 'Premium';
			else 
			set @Status = 'Regular';

		insert into @Results (CustomerID, FullName, TotalSpent, CustomerStatus)
		values (@CurrentCustID, @FName + ' '+@LName, @Total, @Status);

		fetch next from CustCursor into @CurrentCustID, @FName, @LName;
	end

	close CustCursor;
	deallocate CustCursor;


	select * from @Results order by TotalSpent desc;

end