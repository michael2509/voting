/*
	SELECT [projection] FROM [tables] ([as] alias) WHERE [conditions] ORDER BY [criteria] ASC(DESC)
*/
select * from addresses order by road desc; -- * => all columns from all rows (no conditions), order by default to "ASC"
select * from addresses a; -- a => alias of table addresses, convention = first letter(s) of table
select * from addresses a where a.id = 298; -- a.town_id = 1 => a condition to match
select a.road from addresses a where a.id = 298; -- a.road => a projection of road on addresses
select count(*) from addresses a; -- count => function returning number of rows from table matching the conditions (if any)
select count(a.id) from addresses a; -- same as previous, "might" be faster
select * from addresses a where a.road like '1%'; -- addresses with road starting with "1" then any value or none
select * from addresses a where a.road like '_3%'; -- addresses with road starting with any value then a "3" then any value or none
select * from addresses a where a.road like '__ RUE%'; -- negates previous condition

-- MySQL 8 Operators and Functions: https://dev.mysql.com/doc/refman/8.0/en/func-op-summary-ref.html
/*
	Inner joins between tables where joined values must match (jointure interne)
*/
select * from addresses a inner join towns t on a.town_id = t.id;
select a.road, t.zip_code, t.town_name from addresses a inner join towns t on a.town_id = t.id; -- same as previous using aliases to reduce the columns
-- "self" inner join, town names with same zip code
-- col1 = column alias
select t1.town_name as col1 from 
	towns t1 inner join towns t2 
		on t1.zip_code = t2.zip_code -- join on other column than the join column
		and t1.id <> t2.id order by col1 desc;
