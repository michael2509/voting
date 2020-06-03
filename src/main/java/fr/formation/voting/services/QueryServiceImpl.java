package fr.formation.voting.services;

import java.time.LocalDate;
import java.util.List;

import fr.formation.voting.entities.Elector;
import fr.formation.voting.entities.Person;
import fr.formation.voting.entities.Vote;
import fr.formation.voting.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.formation.voting.entities.Address;

@Service
public class QueryServiceImpl implements QueryService {
    // Inject required repositories
    @Autowired
    private AddressJpaRepository addresses;
    @Autowired
    private ElectorJpaRepository electorRepo;
    @Autowired
    private PersonJpaRepository personRepo;
    @Autowired
    private TownJpaRepository townRepo;
    @Autowired
    private VoteJpaRepository voteRepo;

    @Override
    public QueryResult execute() {
        // Elector request 1
        // int identifier = 1;
        // Elector result = electorRepo.findByIdentifier(identifier);

        // Elector request 2
        /*LocalDate startDate = LocalDate.of(1990, 01, 01);
        LocalDate endDate = LocalDate.of(2001, 01, 01);
        List<Elector> result = electorRepo.findByBirthdateBetweenOrderByPersonLastname(startDate, endDate);*/

        // Elector request 3
        /*LocalDate beforeDate = LocalDate.of(1990, 01, 01);
        String zipCode = "75001";
        List<Elector> result = electorRepo.findByBirthdateBeforeAndBirthTownZipCodeNotOrderByPersonLastnameDesc(beforeDate, zipCode);*/

        // Person request 1
        /*String endLastName = "n";
        List<Person> result = personRepo.findByLastnameEndingWithOrderByFirstnamesDesc(endLastName);*/

        // Vote request 1
        int stationIdentifier = 1;
        LocalDate pollingDate = LocalDate.of(2017, 05, 14);
        List<Vote> result = voteRepo.findByPollingStationIdentifierAndPollPollingDateOrderByVotingTime(stationIdentifier, pollingDate);

        return new QueryResult(result);
    }
}
