package fr.formation.voting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fr.formation.voting.services.QueryResult;
import fr.formation.voting.services.QueryService;

@RestController
@RequestMapping("/query")
public class QueryController {

    @Autowired
    private QueryService service;

    @GetMapping("/execute")
    public QueryResult execute() {
	return service.execute();
    }
}
