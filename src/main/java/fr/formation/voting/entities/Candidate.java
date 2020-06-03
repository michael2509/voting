package fr.formation.voting.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "candidates", uniqueConstraints = {
	@UniqueConstraint(name = "candidates_person_id_UQ", columnNames = {
		"person_id" }) }, indexes = {
			@Index(name = "candidates_person_id_IDX", columnList = "person_id") })
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    // One Candidate to One Person
    // Sens inverse: One Person to One Candidate
    // @ManyToOne marche aussi (techniquement) !
    // @OneToOne: vrai "sens" de la relation
    @OneToOne
    @JoinColumn(nullable = false, name = "person_id", foreignKey = @ForeignKey(name = "candidates_person_id_FK"))
    private Person person;

    public Candidate() {
	//
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Person getPerson() {
	return person;
    }

    public void setPerson(Person person) {
	this.person = person;
    }
}
