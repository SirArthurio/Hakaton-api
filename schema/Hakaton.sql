CREATE SCHEMA "hakaton";
USE hakaton;

CREATE TABLE Rol(
    IDRol INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreRol VARCHAR(20) NOT NULL
);

CREATE TABLE Persona(
    Documento INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    TipoDocumento VARCHAR(2) NOT NULL,
    Contrasena VARCHAR(20) NOT NULL
);

CREATE TABLE Proyecto(
    IDProyecto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreProyecto VARCHAR(20) NOT NULL,
    Descripcion TEXT,
    TiempoInicio DATETIME NOT NULL,
    TiempoFinalizacion DATETIME NOT NULL,
    IDFase INT NOT NULL,

    FOREIGN KEY (IDFase) REFERENCES Fase_Proyecto(IDFase)
);

CREATE TABLE Fase_Proyecto(
    IDFase INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreFase VARCHAR(20) NOT NULL
);

CREATE TABLE Usuario_Proyecto(
    IDUsuarioProyecto INT PRIMARY KEY NOT NULL,
    IDUsuario INT NOT NULL,
    IDProyecto INT NOT NULL,

    FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)
);

CREATE TABLE Objetivo(
    IDObjetivo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreObjetivo VARCHAR(20) NOT NULL,
    IDProyecto INT NOT NULL,

    FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto)
);

CREATE TABLE Notificacion(
    IDNotificacion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Mensaje TEXT NOT NULL,
    FechaEncio DATETIME NOT NULL,

    IDUsuario INT NOT NULL,
    IDProyecto INT NOT NULL,
    IDEstado INT NOT NULL,

    FOREIGN KEY (IDUsuario) REFERENCES Persona(Documento),
    FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto),
    FOREIGN KEY (IDEstado) REFERENCES Estado_Notificacion(IDEstado)
);

CREATE TABLE Estado_Notificacion(
    IDEstado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreEstado VARCHAR(20) NOT NULL
);