DELIMITER $$
CREATE PROCEDURE Limite_Creditos ()
BEGIN
DECLARE fim_cursor INT DEFAULT 0;
DECLARE vLimiteCredito INT DEFAULT 0;
DECLARE vTotalCredito INT DEFAULT 0;
DECLARE c CURSOR FOR SELECT LIMITE_DE_CREDITO FROM CLIENTES;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
OPEN c;
WHILE fim_cursor = 0
DO
FETCH c INTO vLimiteCredito;
	IF fim_cursor = 0 THEN
		SET vTotalCredito = vLimiteCredito + vTotalCredito;
	END IF;
END WHILE;
SELECT vTotalCredito AS TOTAL;
CLOSE c;
END $$
DELIMITER ;

CALL Limite_Creditos;