package fr.formation.voting.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "electors", uniqueConstraints = {
	@UniqueConstraint(name = "electors_person_id_UQ", columnNames = {
		"person_id" }) }, indexes = {
			@Index(name = "electors_person_id_IDX", columnList = "person_id"),
			@Index(name = "electors_birth_town_id_IDX", columnList = "birth_town_id"),
			@Index(name = "electors_home_address_id_IDX", columnList = "home_address_id"),
			@Index(name = "electors_polling_station_id_IDX", columnList = "polling_station_id") })
public class Elector {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "birthdate", nullable = false)
    private LocalDate birthdate;

    @Column(name = "national_identifier", columnDefinition = "BIGINT UNSIGNED", nullable = false)
    private int identifier;

    @Column(name = "signing_order", columnDefinition = "SMALLINT UNSIGNED", nullable = false)
    private int signingOrder;

    @OneToOne
    @JoinColumn(nullable = false, name = "person_id", foreignKey = @ForeignKey(name = "electors_person_id_FK"))
    private Person person;

    @ManyToOne
    @JoinColumn(nullable = false, name = "home_address_id", foreignKey = @ForeignKey(name = "electors_home_address_id_FK"))
    private Address homeAddress;

    @ManyToOne
    @JoinColumn(nullable = false, name = "birth_town_id", foreignKey = @ForeignKey(name = "electors_birth_town_id_FK"))
    private Town birthTown;

    @ManyToOne
    @JoinColumn(nullable = false, name = "polling_station_id", foreignKey = @ForeignKey(name = "electors_polling_station_FK"))
    private PollingStation pollingStation;

    public Elector() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public LocalDate getBirthdate() {
	return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
	this.birthdate = birthdate;
    }

    public int getIdentifier() {
	return identifier;
    }

    public void setIdentifier(int identifier) {
	this.identifier = identifier;
    }

    public int getSigningOrder() {
	return signingOrder;
    }

    public void setSigningOrder(int signingOrder) {
	this.signingOrder = signingOrder;
    }

    public Person getPerson() {
	return person;
    }

    public void setPerson(Person person) {
	this.person = person;
    }

    public Address getHomeAddress() {
	return homeAddress;
    }

    public void setHomeAddress(Address homeAddress) {
	this.homeAddress = homeAddress;
    }

    public Town getBirthTown() {
	return birthTown;
    }

    public void setBirthTown(Town birthTown) {
	this.birthTown = birthTown;
    }

    public PollingStation getPollingStation() {
	return pollingStation;
    }

    public void setPollingStation(PollingStation pollingStation) {
	this.pollingStation = pollingStation;
    }
}
