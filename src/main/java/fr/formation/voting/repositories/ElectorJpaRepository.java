package fr.formation.voting.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.formation.voting.entities.Elector;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ElectorJpaRepository extends JpaRepository<Elector, Long> {
    // Derived queries:
    // 1. find Elector by national identifier
    // SQL:
    /* select *
    from electors e
    inner join polling_stations ps on e.polling_station_id = ps.id
    where ps.id = 1 */
    // Derived query:
    Elector findByIdentifier(int identifier);
    // 2. find Electors by birthdate between two dates order by lastname asc
    // SQL:
    /*select *
    from electors e
    inner join persons p on e.person_id = p.id
    where e.birthdate between "1990-01-01" and "2000-12-31"
    order by p.lastname asc;*/
    // Derived query:
    List<Elector> findByBirthdateBetweenOrderByPersonLastname(LocalDate startDate, LocalDate endDate);
    // 3. find Electors by birthdate before a date and birth town not a specific
    // zip code order by lastname desc
    // SQL:
    /*select *
    from electors e
    inner join persons p on e.person_id = p.id
    inner join towns t on e.birth_town_id = t.id
    where (e.birthdate < "1990-01-01" and t.zip_code <> "75001")
    order by p.lastname desc*/
    // Derived query:
    List<Elector> findByBirthdateBeforeAndBirthTownZipCodeNotOrderByPersonLastnameDesc(LocalDate beforeDate, String zipCode);
}
