CREATE PROCEDURE update_siglas_examen
@examen_id int,
@siglas VARCHAR(255)

AS
BEGIN
    UPDATE Examen
    set Siglas = @siglas
    where IdExamen = @examen_id
END