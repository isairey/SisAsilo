

/*CREATE DATABASE TC2007B;  */
/*usar este comando antes de correr el codigo*/
USE TC2007B;


CREATE TABLE Autorizacion (
    IdAutorizacion INT IDENTITY(1,1) PRIMARY KEY,
    Rol VARCHAR(255),
    Correo VARCHAR(255),
    Contrasenia VARCHAR(255),
    Nombre VARCHAR(255),
    ApellidoPaterno VARCHAR(255),
    APellidoMaterno VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Administrador (
    IdAdministrador INT IDENTITY(1,1) PRIMARY KEY,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdAutorizacion INT FOREIGN KEY REFERENCES Autorizacion(IdAutorizacion)
);


/*IMAGEN*/

CREATE TABLE Imagen(
    IdImagen INT IDENTITY(1,1) PRIMARY KEY,
    NombreDeImagen VARCHAR(255),
    Ubicacion VARCHAR(511),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Medico (
    IdMedico INT IDENTITY(1,1) PRIMARY KEY,
    Ubicacion VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdAutorizacion INT FOREIGN KEY REFERENCES Autorizacion(IdAutorizacion),
    IdImagen INT FOREIGN KEY REFERENCES Imagen(IdImagen)
);

/*UBICACIONES*/
CREATE TABLE Grupo (
    IdGrupo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Zona (
    IdZona INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdGrupo INT FOREIGN KEY REFERENCES Grupo(IdGrupo)
);

CREATE TABLE Decanato (
    IdDecanato INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdZona INT FOREIGN KEY REFERENCES Zona(IdZona)
);

CREATE TABLE Parroquia (
    IdParroquia INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdDecanato INT FOREIGN KEY REFERENCES Decanato(IdDecanato)
);

/*EXAMENES*/
CREATE TABLE Respuesta (
    IdRespuesta INT IDENTITY(1,1) PRIMARY KEY,
    Respuesta VARCHAR(255),
    Peso FLOAT(24),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Examen(
    IdExamen INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    Siglas VARCHAR(255),
    Dimension VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Pregunta (
    IdPregunta INT IDENTITY(1,1) PRIMARY KEY,
    Pregunta VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdExamen INT FOREIGN KEY REFERENCES Examen(IdExamen)
);

CREATE TABLE RangoDeExamen (
    IdRangoDeExamen INT IDENTITY(1,1) PRIMARY KEY,
    MaximoValor FLOAT(24),
    MinimoValor FLOAT(24),
    Indicador Char(255),
    Luz INT,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdExamen INT FOREIGN KEY REFERENCES Examen(IdExamen)
);

CREATE TABLE PreguntaRespuesta (
    IdPreguntaRespuesta INT IDENTITY(1,1) PRIMARY KEY,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPregunta INT FOREIGN KEY REFERENCES Pregunta(IdPregunta),
    IdRespuesta INT FOREIGN KEY REFERENCES Respuesta(IdRespuesta)
);



/*PSICOLOGO*/

CREATE TABLE LineaDeAtencion(
    IdLineaDeAtencion INT IDENTITY(1,1) PRIMARY KEY,
    Telefono VARCHAR(255),
    Titulo VARCHAR(255),
    Nombre VARCHAR(255),
    Ubicacion VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdImagen INT FOREIGN KEY REFERENCES Imagen(IdImagen)
);

/*PACIENTE*/

CREATE TABLE Paciente(
    IdPaciente INT IDENTITY(1,1) PRIMARY KEY,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Genero CHAR,
    Peso FLOAT(24),
    Estatura FLOAT(24),
    TipoDeSangre VARCHAR(3),
    FechaDeNacimiento DATE,
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    Edad INT,
    IdAutorizacion INT FOREIGN KEY REFERENCES Autorizacion(IdAutorizacion),
    IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
    IdParroquia INT FOREIGN KEY REFERENCES Parroquia(IdParroquia),
    IdImagen INT FOREIGN KEY REFERENCES Imagen(IdImagen)
);

/*EXAMEN Y REGISTRO DE EXAMEN*/



CREATE TABLE ExamenPaciente(
    IdExamenPaciente INT IDENTITY(1,1) PRIMARY KEY,
    Resultado FLOAT(24),
    FechaDeExamen DATE,
    Ubicacion VARCHAR(255),
    Evaluador VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
    IdExamen INT FOREIGN KEY REFERENCES Examen(IdExamen)
);





/*TROFEO*/

CREATE TABLE Trofeo(
    IdTrofeo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdImagen INT FOREIGN KEY REFERENCES Imagen(IdImagen)
);

CREATE TABLE TrofeoPaciente(
    IdTrofeoPaciente INT IDENTITY(1,1) PRIMARY KEY,
    Completado BIT,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
    IdTrofeo INT FOREIGN KEY REFERENCES Trofeo(IdTrofeo)
);

/*ACCIONES*/

CREATE TABLE Accion(
    IdAccion INT IDENTITY(1,1) PRIMARY KEY,
    Tema VARCHAR(255),
    Descripcion VARCHAR(255),
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE AccionPaciente(
    IdAccionPaciente INT IDENTITY(1,1) PRIMARY KEY,
    Completado BIT,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
    IdAccion INT FOREIGN KEY REFERENCES Accion(IdAccion)
);

CREATE TABLE ImagenPaciente(
    IdImagenPaciente INT IDENTITY(1,1) PRIMARY KEY,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
    IdImagen INT FOREIGN KEY REFERENCES Imagen(IdImagen)
);

CREATE TABLE Favorito(
    IdFavorito INT IDENTITY(1,1) PRIMARY KEY,
    Favorito BIT,
    /*Verificar si así se pone el ACTIVE y preguntar el TIMESTAMP*/
    Register DATETIME DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL,
    IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
    IdLineaDeAtencion INT FOREIGN KEY REFERENCES LineaDeAtencion(IdLineaDeAtencion)
);
/*
ALTER TABLE Paciente
ADD Edad INT NULL;

ALTER TABLE Examen
ADD Siglas VARCHAR(255) NULL;

ALTER TABLE RangoDeExamen
ADD Luz INT NULL;

ALTER TABLE Examen
ADD Dimension VARCHAR(255) NULL;*/