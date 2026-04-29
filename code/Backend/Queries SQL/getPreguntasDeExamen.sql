CREATE PROCEDURE getPreguntasDeExamen @IdExamen int
AS 
BEGIN
        SELECT Pregunta from Pregunta
        WHERE IdExamen = @IdExamen
ORDER BY IdExamen
END