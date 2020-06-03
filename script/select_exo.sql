USE voting;


-- -----------------------------------------------------
-- 1. Return the number of candidates
-- -----------------------------------------------------
select count(c.id) from candidates c;


-- -----------------------------------------------------
-- 2. Return the candidates with only their id and lastname
-- -----------------------------------------------------
select c.id, p.lastname from candidates c
    inner join persons p on c.person_id = p.id;


-- -----------------------------------------------------
-- 3. Return the polling stations with their id, station identifier, road and town name
-- -----------------------------------------------------
select p.id, p.station_identifier, a.road, t.town_name from polling_stations p
    inner join addresses a on p.address_id = a.id
        inner join towns t on a.town_id = t.id;


-- -----------------------------------------------------
-- 4. Return the youngest elector
-- -----------------------------------------------------
select * from electors e1
    where e1.birthdate = (select MAX(e.birthdate) from electors e2);


-- -----------------------------------------------------
-- 5. Return the electors born in a specifc year
-- -----------------------------------------------------
select * from electors e
    where YEAR(e.birthdate) = "1995"


-- -----------------------------------------------------
-- 6. Return the electors living at the same address
-- -----------------------------------------------------
select e1.*
from electors e1
inner join electors e2
on e1.home_address_id = e2.home_address_id and e1.id <> e2.id
group by e1.id;


-- -----------------------------------------------------
--  7. Return list of electors (lastname, national identifier, polling station identifier, voting time) who voted for a given candidate at a given poll
-- -----------------------------------------------------
select p.lastname, e.national_identifier, ps.station_identifier, v.voting_time
from electors e
inner join persons p on e.person_id = p.id
inner join polling_stations ps on e.polling_station_id = ps.id
inner join votes v on e.id = v.elector_id
WHERE e.id IN (
    SELECT elector_id
    FROM votes
    WHERE (candidate_id = 3 and poll_id = 1)
)


-- -----------------------------------------------------
-- 8. Return the number of electors by home address (road, zip code, town name, number of electors)
-- -----------------------------------------------------
select a.road, t.zip_code, t.town_name, e.home_address_id, count(*) as number_of_electors
from electors e
inner join addresses a on e.home_address_id = a.id
inner join towns t on a.town_id = t.id
group by e.home_address_id