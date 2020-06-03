package fr.formation.voting.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.formation.voting.entities.Vote;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface VoteJpaRepository extends JpaRepository<Vote, Long> {
    // Derived queries:
    // 1. find Votes by polling station identifier at a specific polling date
    // order by voting time asc
    // SQL:
    /*select *
    from votes v
    inner join polling_stations ps on v.polling_station_id = ps.id
    inner join polls p on v.poll_id = p.id
    where p.polling_date = "2017-05-14"*/
    // Derived query:
    List<Vote> findByPollingStationIdentifierAndPollPollingDateOrderByVotingTime(int stationIdentifier, LocalDate pollingDate);
}
