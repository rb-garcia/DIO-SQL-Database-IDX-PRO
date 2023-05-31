/* Chamada da procedure
  ** O campo idAluno não é auto incremental
  CALL sp_aluno(1, '12345', 1, 'insert', @retorno);
  CALL sp_aluno(1, '54321', 2, 'update', @retorno);
  CALL sp_aluno(1, NULL, NULL,'delete', @retorno);
  SELECT @retorno;
*/

DROP PROCEDURE IF EXISTS `sp_aluno`;
  
DELIMITER $$

CREATE PROCEDURE `sp_aluno` (    
    IN p_idAluno INT,    
    IN p_matricula VARCHAR(50),
    IN p_Pessoa_IdPessoa INT,
    IN p_operacao VARCHAR(10),
    OUT p_retorno INT
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
		ROLLBACK;
		SET p_retorno = -1;
	END;
    
    DECLARE exit handler for sqlwarning
	BEGIN
		ROLLBACK;
		SET p_retorno = -2;
	END;
    
    START TRANSACTION;

    IF p_operacao = 'insert' THEN
        INSERT INTO aluno (idAluno, matricula, Pessoa_IdPessoa) VALUES (p_idAluno, p_matricula, p_Pessoa_IdPessoa);
    ELSEIF p_operacao = 'update' THEN
        UPDATE aluno SET matricula = p_matricula, Pessoa_IdPessoa = p_Pessoa_IdPessoa WHERE idAluno = p_idAluno;
    ELSEIF p_operacao = 'delete' THEN
        DELETE FROM aluno WHERE idAluno = p_idAluno;
    END IF;
    
    COMMIT;
	SET p_retorno = 0;
END$$

DELIMITER ;