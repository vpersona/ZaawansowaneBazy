create function [Student_2].ufn_PriceCheck (@PriceCheck nvarchar(max))
returns table
as
return
(select json_value(value, '$.ProductID') as ID,
json_value(value, '$.NewPrice') as FuturePrice,
[Student_2].ufn_IsPriceHigherThanCurrent (value) as IsPriceHigher
from openjson(@PriceCheck)
);