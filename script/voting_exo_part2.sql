use voting;


-- -----------------------------------------------------
-- ELECTOR
-- -----------------------------------------------------

-- 1. find Elector by national identifier
select *
from electors e
inner join polling_stations ps on e.polling_station_id = ps.id
where ps.id = 1

-- 2. find Electors by birthdate between two dates order by lastname asc
select *
from electors e
inner join persons p on e.person_id = p.id
where e.birthdate between "1990-01-01" and "2000-12-31"
order by p.lastname asc;

-- 3. find Electors by birthdate before a date and birth town not a specific zip code order by lastname desc
select *
from electors e
inner join persons p on e.person_id = p.id
inner join towns t on e.birth_town_id = t.id
where (e.birthdate < "1990-01-01" and t.zip_code <> "75001")
order by p.lastname desc


-- -----------------------------------------------------
-- PERSON
-- -----------------------------------------------------
-- 1. find Persons by lastname ending with a string order by firstnames desc
select *
from persons p
where p.lastname like '%n'
order by p.firstnames desc


-- -----------------------------------------------------
-- TOWN
-- -----------------------------------------------------
-- 1. find Towns by zip code order by town name
select * from towns t where t.zip_code = '91100' order by t.town_name;

-- 2. find Towns with name containing a string and order by name desc
select * from towns t where t.town_name like '%OU%' order by


-- -----------------------------------------------------
-- VOTES
-- -----------------------------------------------------
-- 1. find Votes by polling station identifier at a specific polling date
select *
from votes v
inner join polling_stations ps on v.polling_station_id = ps.id
inner join polls p on v.poll_id = p.id
where p.polling_date = "2017-05-14"