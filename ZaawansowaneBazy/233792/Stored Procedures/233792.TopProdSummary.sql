
create   procedure [233792].TopProdSummary
	@Summary [233792].SummaryTbType readonly
as
begin

	set nocount on
		select 
			ProductID, Name as ProductName, (ListPrice - (ListPrice*0.02)) as ModifiedPrice
			from #TopProducts
end