package fr.formation.voting.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.formation.voting.entities.Person;

import java.util.List;

@Repository
public interface PersonJpaRepository extends JpaRepository<Person, Long> {
    // Derived queries:
    // 1. find Persons by lastname ending with a string order by firstnames desc
    // SQL:
    /*select *
    from persons p
    where p.lastname like '%n'
    order by p.firstnames desc*/
    // Derived query:
    List<Person> findByLastnameEndingWithOrderByFirstnamesDesc(String endLastname);
}
