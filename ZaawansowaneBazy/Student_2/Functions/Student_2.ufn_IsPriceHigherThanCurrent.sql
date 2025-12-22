create function [Student_2].ufn_IsPriceHigherThanCurrent (@higherlower NVARCHAR(max))
returns bit
as
begin
declare @pID int;
declare @pNewPrice DECIMAL(18,2);
DECLARE @pCurrentPrice DECIMAL(18,2);
DECLARE @result BIT;

select @pID = ProductID, @pNewPrice = NewPrice
from OPENJSON(@higherlower) with (ProductID INT, NewPrice Decimal(18,2));

select @pCurrentPrice = ListPrice from SalesLT.Product where ProductID = @pID;

if @pNewPrice >@pCurrentPrice
set @result = 1;
else set @result = 0;
return @result;
end