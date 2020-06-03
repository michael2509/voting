package fr.formation.voting.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.formation.voting.entities.Address;

@Repository
public interface AddressJpaRepository extends JpaRepository<Address, Long> {

    // Derived queries:
    // 1. find Addresses by Town's zip code order by road asc
    // SQL: select * from addresses a inner join towns t on a.town_id = t.id
    // where t.zip_code = '91820' order by a.road asc;
    // Derived query:
    // Address.town.zipCode => Object graph
    // findBy = prefix for select
    // Town = town field in class Address, uppercased (camelCase)
    List<Address> findByTownZipCodeOrderByRoad(String zipCode);
}
