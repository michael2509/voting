package fr.formation.voting.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "votes", uniqueConstraints = {
	@UniqueConstraint(name = "votes_elector_id_poll_id_UQ", columnNames = {
		"elector_id", "poll_id" }) }, indexes = {
			@Index(name = "votes_elector_id_IDX", columnList = "elector_id"),
			@Index(name = "votes_poll_id_IDX", columnList = "poll_id"),
			@Index(name = "votes_candidate_id_IDX", columnList = "candidate_id"),
			@Index(name = "votes_polling_station_id_IDX", columnList = "polling_station_id") })
public class Vote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @ManyToOne
    @JoinColumn(nullable = false, name = "elector_id", foreignKey = @ForeignKey(name = "votes_elector_id_FK"))
    private Elector elector;

    @ManyToOne
    @JoinColumn(nullable = false, name = "poll_id", foreignKey = @ForeignKey(name = "votes_poll_id_FK"))
    private Poll poll;

    @ManyToOne
    @JoinColumn(nullable = false, name = "candidate_id", foreignKey = @ForeignKey(name = "votes_candidate_id_FK"))
    private Candidate candidate;

    @ManyToOne
    @JoinColumn(nullable = false, name = "polling_station_id", foreignKey = @ForeignKey(name = "votes_polling_station_id_FK"))
    private PollingStation pollingStation;

    @Column(name = "voting_time", nullable = false)
    private LocalDateTime votingTime;

    public Vote() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Elector getElector() {
	return elector;
    }

    public void setElector(Elector elector) {
	this.elector = elector;
    }

    public Poll getPoll() {
	return poll;
    }

    public void setPoll(Poll poll) {
	this.poll = poll;
    }

    public Candidate getCandidate() {
	return candidate;
    }

    public void setCandidate(Candidate candidate) {
	this.candidate = candidate;
    }

    public PollingStation getPollingStation() {
	return pollingStation;
    }

    public void setPollingStation(PollingStation pollingStation) {
	this.pollingStation = pollingStation;
    }

    public LocalDateTime getVotingTime() {
	return votingTime;
    }

    public void setVotingTime(LocalDateTime votingTime) {
	this.votingTime = votingTime;
    }
}
