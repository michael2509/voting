package fr.formation.voting.entities;

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

@Entity
@Table(name = "polling_stations", indexes = {
	@Index(name = "polling_stations_address_id_IDX", columnList = "address_id") })
public class PollingStation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @ManyToOne
    @JoinColumn(nullable = false, name = "address_id", foreignKey = @ForeignKey(name = "polling_stations_address_id_FK"))
    private Address address;

    @Column(name = "station_identifier", columnDefinition = "SMALLINT UNSIGNED", nullable = false)
    private int identifier;

    public PollingStation() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Address getAddress() {
	return address;
    }

    public void setAddress(Address address) {
	this.address = address;
    }

    public int getIdentifier() {
	return identifier;
    }

    public void setIdentifier(int identifier) {
	this.identifier = identifier;
    }
}
