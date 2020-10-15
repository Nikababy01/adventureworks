select
 tableWithRanges.range as Range,
count(*) as [Num Orders], sum(tableWithRanges.subtotal) as [Total Value]
from
(
	select case
		when ssoh.SubTotal between 0 and 99 then ' 0-  99'
		when ssoh.SubTotal between 100 and 999 then ' 100- 999'
		when ssoh.SubTotal between 1000 and 9999 then ' 1000- 9999'
		else '10000- '
		end as range,
		ssoh.subtotal
	from Sales.SalesOrderHeader ssoh) tableWithRanges
	group by tableWithRanges.range
	order by tableWithRanges.range
