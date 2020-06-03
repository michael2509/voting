DELIMITER |
CREATE PROCEDURE `generate_votes`(IN p_round INT)
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE poll_id INT DEFAULT (SELECT p.id FROM `polls` p WHERE p.round = p_round);
    DECLARE current_elector_id, current_voting_office_id, current_candidate_id INT;
    DECLARE electors_cursor CURSOR FOR SELECT id, voting_office_id FROM `electors`;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    START TRANSACTION; 

    OPEN electors_cursor;
    
	read_electors: LOOP

		FETCH electors_cursor INTO current_elector_id, current_voting_office_id;
        
        IF finished = 1 THEN 
            LEAVE read_electors;
        END IF;

        SET current_candidate_id = (SELECT c.id FROM `candidates` c ORDER BY RAND() LIMIT 1);

        INSERT INTO `votes` (`elector_id`, `voting_office_id`, `candidate_id`, `poll_id`) VALUES (current_elector_id, current_voting_office_id, current_candidate_id, poll_id);
        
	END LOOP read_electors;
    
    CLOSE electors_cursor;
    
    COMMIT;

END |
