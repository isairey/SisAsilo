CREATE PROCEDURE update_edad_paciente
@paciente_id int

AS
BEGIN
    UPDATE Paciente
    set Edad = DATEDIFF(MONTH,FechaDeNacimiento,GETDATE())/12
    where IdPaciente = @paciente_id
END