CREATE PROCEDURE update_luz
@Id_rango_de_examen int,
@luz int

AS
BEGIN
    UPDATE RangoDeExamen
    set Luz = @luz
    where IdRangoDeExamen = @Id_rango_de_examen
END