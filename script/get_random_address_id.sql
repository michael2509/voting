CREATE FUNCTION `get_random_address_id`() RETURNS INT

    READS SQL DATA

RETURN (
	SELECT a.id FROM `addresses` a WHERE a.id <> 1 ORDER BY RAND() LIMIT 1
)