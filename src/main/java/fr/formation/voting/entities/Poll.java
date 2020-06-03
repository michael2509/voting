package fr.formation.voting.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "polls", uniqueConstraints = {
	@UniqueConstraint(name = "polls_polling_date_UQ", columnNames = {
		"polling_date" }) })
public class Poll {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "description", nullable = false, length = 100)
    private String description;

    @Column(name = "polling_date", nullable = false)
    private LocalDate pollingDate;

    @Column(name = "round_number", columnDefinition = "SMALLINT UNSIGNED", nullable = false)
    private int roundNumber;

    public Poll() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public LocalDate getPollingDate() {
	return pollingDate;
    }

    public void setPollingDate(LocalDate pollingDate) {
	this.pollingDate = pollingDate;
    }

    public int getRoundNumber() {
	return roundNumber;
    }

    public void setRoundNumber(int roundNumber) {
	this.roundNumber = roundNumber;
    }
}
