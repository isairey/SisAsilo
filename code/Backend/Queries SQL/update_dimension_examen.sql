CREATE PROCEDURE update_dimension_examen
@examen_id int,
@dimension VARCHAR(255)

AS
BEGIN
    UPDATE Examen
    set Dimension = @dimension
    where IdExamen = @examen_id
END