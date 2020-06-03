package fr.formation.voting.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "persons")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "firstnames", nullable = false, length = 255)
    private String firstnames;

    @Column(name = "lastname", nullable = false, length = 100)
    private String lastname;

    @Column(name = "married_name", length = 100)
    private String marriedName;

    public Person() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getFirstnames() {
	return firstnames;
    }

    public void setFirstnames(String firstnames) {
	this.firstnames = firstnames;
    }

    public String getLastname() {
	return lastname;
    }

    public void setLastname(String lastname) {
	this.lastname = lastname;
    }

    public String getMarriedName() {
	return marriedName;
    }

    public void setMarriedName(String marriedName) {
	this.marriedName = marriedName;
    }
}
