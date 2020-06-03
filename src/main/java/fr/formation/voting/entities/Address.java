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
@Table(name = "addresses", indexes = {
	@Index(name = "addresses_town_id_IDX", columnList = "town_id") })
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "road", nullable = false, length = 100)
    private String road;

    // Many Address to One Town
    // Sens inverse: One Town to Many Address
    @ManyToOne
    @JoinColumn(nullable = false, name = "town_id", foreignKey = @ForeignKey(name = "addresses_town_id_FK"))
    private Town town;

    public Address() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getRoad() {
	return road;
    }

    public void setRoad(String road) {
	this.road = road;
    }

    public Town getTown() {
	return town;
    }

    public void setTown(Town town) {
	this.town = town;
    }
}
