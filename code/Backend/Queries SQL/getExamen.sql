CREATE PROCEDURE getExamen @IdExamen int
AS 
BEGIN
    SELECT * from Examen 
    WHERE IdExamen = @IdExamen
    ORDER BY IdExamen
END