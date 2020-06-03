DELIMITER |
CREATE PROCEDURE `generate_electors`(IN number_of_electors INT)
BEGIN
	
    DECLARE electors_counter INT DEFAULT 1;
    DECLARE elector_firstname VARCHAR(45) DEFAULT "Jean";
    DECLARE elector_lastname VARCHAR(45) DEFAULT "Neymar";
    DECLARE identity_id, birth_place_id, elector_national_id, list_id, home_address_id, voting_office_id INT DEFAULT 0;
    DECLARE insurance_number VARCHAR(255) DEFAULT "UUID";
    DECLARE birth_date DATE DEFAULT "2000-01-01";

    WHILE (electors_counter <= number_of_electors) DO

        -- -----------------------------------------------------
        -- GET RANDOM FIRSTNAME AND LASTNAME
        -- -----------------------------------------------------
        SET elector_firstname = (SELECT n.firstname FROM `names` n ORDER BY RAND() LIMIT 1);
        SET elector_lastname = (SELECT n.lastname FROM `names` n ORDER BY RAND() LIMIT 1);
        SET insurance_number = UUID();

        -- -----------------------------------------------------
        -- Insert Identities
        -- -----------------------------------------------------
        INSERT INTO `identities` (`firstname`, `lastname`, `insurance_number`) VALUES (elector_firstname, elector_lastname, insurance_number);

        -- -----------------------------------------------------
        -- Insert Electors
        -- -----------------------------------------------------
        SET identity_id = (SELECT i.id FROM `identities` i WHERE i.insurance_number = insurance_number);

        SET birth_date =  DATE(NOW()) + INTERVAL -80 YEAR + INTERVAL RAND() * 62 * 365.25 DAY;

        SET birth_place_id = (SELECT c.id FROM `cities` c where c.city = "Alfortville");

        SET elector_national_id = elector_national_id + 1;
        SET list_id = list_id + 1;

        SET home_address_id = get_random_address_id();
        
        SET voting_office_id = 1;

        INSERT INTO `electors` (`identity_id`, `birth_date`, `birth_place_id`, `elector_national_id`, `list_id`, `home_address_id`, `voting_office_id`) VALUES (identity_id, birth_date, birth_place_id, elector_national_id, list_id, home_address_id, voting_office_id);

        SET electors_counter = electors_counter + 1;
    END WHILE;
        
    COMMIT;

END |