package fr.formation.voting.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.formation.voting.entities.Town;

/**
 * Extends the JpaRepository in order to specify the type of entity to manage
 * with this custom interface.
 * <p>
 * Permits to declare additional methods to query Towns. We can query by derived
 * queries and JPQL (Java Persistance Query Language).
 * <p>
 * JPQL is an abstraction of SQL, so that we can write query compatible with any
 * supported data base.
 */
@Repository
public interface TownJpaRepository extends JpaRepository<Town, Long> {
    // Derived queries:

    // 1. find Towns by zip code order by town name
    // SQL: select * from towns t where t.zip_code = '91100' order by
    // t.town_name;
    // Derived query:
    List<Town> findByZipCodeOrderByName(String zipCode);

    // 2. find Towns with name containing a string and order by name desc
    // SQL: select * from towns t where t.town_name like '%OU%' order by
    // t.town_name desc;
    // Derived query:
    List<Town> findByNameContainingOrderByNameDesc(String value);
}
