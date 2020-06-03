-- 1. Return the number of candidates:
select count(c.id) from candidates c;

-- 2. Return the candidates with only their id and lastname:
select c.id as candidate_id, p.lastname from candidates c inner join persons p on c.person_id = p.id;

-- 3. Return the polling stations with their id, station identifier, road and town name:
select ps.id, ps.station_identifier, a.road, t.town_name 
	from 
		polling_stations ps inner join addresses a on ps.address_id = a.id 
			inner join towns t on a.town_id = t.id;

select * from polling_stations ps, addresses a, towns t where ps.address_id = a.id and a.town_id = t.id;

-- 4. Return the youngest electors:
select * from electors e1 where e1.birthdate = (select max(e2.birthdate) from electors e2); -- subselect
/*
select max(e2.birthdate) from electors e2; -- 1975-12-16
select * from electors e1 where e1.birthdate = '1975-12-16';
*/

-- 5. Return the electors born in a specific year:
select * from electors e where year(e.birthdate) = 1975; -- function year()
-- select * from electors e where e.birthdate like '1975%'; -- No ! Bad !
-- insert into electors (birthdate) values ('1978-11-15'); -- epoch = 01/01/1970 - 2313215465687 (millis since epoch)

-- 6. Return the electors living at the same address:
select e1.id, e1.person_id, e1.home_address_id,
		e2.id, e2.person_id, e2.home_address_id
	FROM electors e1 inner join electors e2 
		on e1.home_address_id = e2.home_address_id 
		and e1.id <> e2.id group by e1.id; -- group by