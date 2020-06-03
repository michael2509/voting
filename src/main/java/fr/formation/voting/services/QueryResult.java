package fr.formation.voting.services;

public class QueryResult {

    private final Object result;

    public QueryResult(Object result) {
	this.result = result;
    }

    public Object getResult() {
	return result;
    }
}
