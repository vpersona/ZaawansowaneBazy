-- Funkcja skalarna
--Scenariusz:
-- Lekarz podczas wizyty wpisuje wage i wzrost pacjenta, na podstawie których wyliczane jest bmi
-- Uzasadnienie:
-- Jeśli standard medyczny obliczania bmi kiedykolwiek się zmieni, to kod poprawimy tylko w 1 miejscu

create function dbo.ufn_BMI
(
@Waga Decimal(5,2),
@Wzrost Decimal(5,2)
)

returns decimal(5,2)
as begin
	declare @BMI decimal(5,2)
	Declare @WzrostM decimal(5,2)

	set @WzrostM = @Wzrost /100.0
	if @WzrostM>0
	set @BMI = @Waga/(@WzrostM * @WzrostM)
	else
	set @BMI = 0 
	return @BMI
end