CREATE PROCEDURE getExamenes
AS 
BEGIN
        SELECT * from Examen 
ORDER BY IdExamen
END