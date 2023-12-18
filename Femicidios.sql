-- Crear la base de datos
CREATE DATABASE Femicidios;

-- Importamos los datos correspondientes a las tres tablas y ejecutamos la base de datos
use Femicidios;

-- Visualizamos los datos de nuestras tablas
SELECT TOP 10 * FROM dbo.Causas;

SELECT TOP 10 * FROM dbo.Victimas;

SELECT TOP 10 * FROM dbo.SujetosActivos;

-- Obtenemos los nombres de las columnas
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Victimas';

-- Generamos las claves primarias y secundarias y creamos las Relaciones entre Tablas
--TABLA HECHOS
ALTER TABLE [dbo].[Causas] ALTER COLUMN Numrefcausa INT NOT NULL;

ALTER TABLE [dbo].[Causas]
  ADD PRIMARY KEY (Numrefcausa);

--TABLA VICTIMAS
ALTER TABLE [dbo].[Victimas] 
ALTER COLUMN Numrefcausa INT NOT NULL;

ALTER TABLE [dbo].[Victimas] 
ALTER COLUMN Nro_victima INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
  ADD PRIMARY KEY (Numrefcausa, Nro_victima)

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Numrefcausa) REFERENCES [dbo].[Causas](Numrefcausa);

--TABLA SUJETOS ACTIVOS
ALTER TABLE [dbo].[SujetosActivos] 
ALTER COLUMN Numrefcausa INT NOT NULL;

ALTER TABLE [dbo].[SujetosActivos] 
ALTER COLUMN Numero_de_sujeto_activo INT NOT NULL;

ALTER TABLE [dbo].[SujetosActivos]
  ADD PRIMARY KEY (Numrefcausa, Numero_de_sujeto_activo)

ALTER TABLE [dbo].[SujetosActivos]
ADD FOREIGN KEY (Numrefcausa) REFERENCES [dbo].[Causas](Numrefcausa);

-- Creamos las tablas asociadas a las listas de códigos
--TABLA JURISDICCION
CREATE TABLE Jurisdiccion (
	Id_jurisdiccion INT NOT NULL PRIMARY KEY,
	Jurisdiccion VARCHAR(100) NOT NULL);

INSERT INTO Jurisdiccion (Id_jurisdiccion, Jurisdiccion) VALUES
(2, 'Ciudad de Buenos Aires'),
(6, 'Provincia de Buenos Aires'),
(10, 'Provincia de Catamarca'),
(14, 'Provincia de Córdoba'),
(18, 'Provincia de Corrientes'),
(22, 'Provincia de Chaco'),
(26, 'Provincia de Chubut'),
(30, 'Provincia de Entre Ríos'),
(34, 'Provincia de Formosa'),
(38, 'Provincia de Jujuy'),
(42, 'Provincia de La Pampa'),
(46, 'Provincia de La Rioja'),
(50, 'Provincia de Mendoza'),
(54, 'Provincia de Misiones'),
(58, 'Provincia de Neuquén'),
(62, 'Provincia de Río Negro'),
(66, 'Provincia de Salta'),
(70, 'Provincia de San Juan'),
(74, 'Provincia de San Luis'),
(78, 'Provincia de Santa Cruz'),
(82, 'Provincia de Santa Fe'),
(86, 'Provincia de Santiago del Estero'),
(90, 'Provincia de Tucumán'),
(94, 'Provincia de Tierra del Fuego, Antártida e Islas del Atlántico Sur');

-- Creamos las relaciones de la tabla Jurisdicción
-- Relación con tabla Causas 
ALTER TABLE [dbo].[Causas] ALTER COLUMN Jurisdiccion INT NOT NULL;

ALTER TABLE [dbo].[Causas]
ADD FOREIGN KEY (Jurisdiccion) REFERENCES [dbo].[Jurisdiccion](Id_jurisdiccion);

 -- Relación con tabla Victimas
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Jurisdiccion INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Jurisdiccion) REFERENCES [dbo].[Jurisdiccion](Id_jurisdiccion);

 -- Relación con tabla SujetosActivos
ALTER TABLE [dbo].[SujetosActivos] ALTER COLUMN Jurisdiccion INT NOT NULL;

ALTER TABLE [dbo].[SujetosActivos]
ADD FOREIGN KEY (Jurisdiccion) REFERENCES [dbo].[Jurisdiccion](Id_jurisdiccion);

--TABLA TIPO DE FEMICIDIO
CREATE TABLE Tipo_femicidio (
    Id_tipo INT NOT NULL PRIMARY KEY,
    TipoFemicidio VARCHAR(100) NOT NULL);

INSERT INTO Tipo_femicidio (Id_tipo, TipoFemicidio) VALUES
(1, 'Femicidio directo'),
(2, 'Femicidio vinculado'),
(3, 'Femicidio directo y femicidio vinculado');

-- Creamos las relaciones de la tabla Tipo_femicidio
-- Relación con la tabla Causas
ALTER TABLE [dbo].[Causas] ALTER COLUMN Tipo_femicidio INT NOT NULL;

ALTER TABLE [dbo].[Causas]
ADD FOREIGN KEY (Tipo_femicidio) REFERENCES [dbo].[Tipo_femicidio](Id_tipo);

-- Relación con tabla SujetosActivos
ALTER TABLE [dbo].[SujetosActivos] ALTER COLUMN Tipo_femicidio INT NOT NULL;

ALTER TABLE [dbo].[SujetosActivos]
ADD FOREIGN KEY (Tipo_femicidio) REFERENCES [dbo].[Tipo_femicidio](Id_tipo);

-- TABLA FRANJA_HORARIA
CREATE TABLE Franja_horaria (
    Id_franja INT NOT NULL PRIMARY KEY,
    Horario VARCHAR(50) NOT NULL);

INSERT INTO Franja_horaria (Id_franja, Horario) VALUES
(1, 'Entre 0 y 5.59 hs.'),
(2, 'Entre 6 y 11.59 hs.'),
(3, 'Entre 12 y 17.59 hs.'),
(4, 'Entre 18 y 23.59 hs.'),
(999, 'Sin datos');

-- Creamos las relaciones de la tabla Franja_horaria
ALTER TABLE [dbo].[Causas] ALTER COLUMN Franja_horaria INT NOT NULL;

ALTER TABLE [dbo].[Causas]
ADD FOREIGN KEY (Franja_horaria) REFERENCES [dbo].[Franja_horaria](Id_franja);

-- TABLA Tipo_victima
CREATE TABLE Tipo_victima (
    Id_tipo_victima INT NOT NULL PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL);

INSERT INTO Tipo_victima (Id_tipo_victima, Tipo) VALUES
(1, 'Víctima directa de femicidio'),
(2, 'Víctima de femicidio vinculado'),
(3, 'Víctima de femicidio vinculado por interposición en línea de fuego'),
(4, 'Otras muertes vinculadas a la violencia de género');

-- Creamos las relaciones de la tabla Tipo_victima
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Tipo_victima INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Tipo_victima) REFERENCES [dbo].[Tipo_victima](Id_tipo_victima);

-- TABLA GENERO
CREATE TABLE Genero_victima (
    Id_genero INT NOT NULL PRIMARY KEY,
    Genero VARCHAR(100) NOT NULL);

INSERT INTO Genero_victima (Id_genero, Genero) VALUES
(1, 'Mujer cis'),
(2, 'Mujer trans / travesti'),
(3, 'Varón cis'),
(4, 'Varón trans'),
(5, 'Otras identidades de género');

-- Relaciones de la tabla Género
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Genero_victima INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Genero_victima) REFERENCES [dbo].[Genero_victima](Id_genero);

-- TABLA ARMA
CREATE TABLE Arma (
Id_arma INT NOT NULL PRIMARY KEY,
TipoArma VARCHAR (100) NOT NULL);

INSERT INTO Arma (Id_arma, TipoArma) VALUES
(1, 'Arma de fuego reglamentaria'),
(2, 'Arma de fuego autorizada (no reglamentaria)'),
(3, 'Arma de fuego no autorizada'),
(4, 'Arma de fuego sin datos de autorización'),
(5, 'Arma blanca'),
(6, 'Fuego / otros medios combustibles'),
(7, 'Por intoxicación / venenos'),
(8, 'Fuerza física'),
(9, 'Otros medios'),
(10, 'Arma de fuego sin datos de autorización y fuego / otros medios combustibles'),
(11, 'Arma de fuego sin datos de autorización y fuerza física'),
(12, 'Arma blanca y fuego / otros medios combustibles'),
(13, 'Arma blanca y fuerza física'),
(14, 'Arma blanca y otros medios'),
(15, 'Fuego / otros medios combustibles y fuerza física'),
(16, 'Fuerza física y otros medios'),
(17, 'Arma blanca, fuerza física y otros medios'),
(999, 'Sin datos');

-- Relaciones de la tabla Arma
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Medio_empleado INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Medio_empleado) REFERENCES [dbo].[Arma](Id_arma);

-- TABLA LUGAR
CREATE TABLE Lugar (
Id_lugar INT NOT NULL PRIMARY KEY, 
Tipo_lugar VARCHAR(100) NOT NULL);

INSERT INTO Lugar (Id_lugar, Tipo_lugar) VALUES
(1, 'Vivienda de la víctima'),
(2, 'Vivienda del sujeto activo'),
(3, 'Vivienda compartida entre la víctima y el sujeto activo'),
(4, 'Otra vivienda (ni de la víctima ni del sujeto activo)'),
(5, 'Hotel / motel / hotel alojamiento (sin residencia permanente)'),
(6, 'Lugar de trabajo de la víctima'),
(7, 'Espacio público'),
(8, 'Otro lugar'),
(999, 'Sin datos');

-- Relaciones de la tabla Lugar
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Lugar INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Lugar) REFERENCES [dbo].[Lugar](Id_lugar);

-- TABLA VINCULOS
CREATE TABLE Vinculos (
Id_vinculo INT NOT NULL PRIMARY KEY, 
Vinculo_victima_sujetoactivo VARCHAR (100) NOT NULL);

INSERT INTO Vinculos (Id_vinculo, Vinculo_victima_sujetoactivo) VALUES
(1, 'Conyuge'),
(2, 'Ex conyuge'),
(3, 'Pareja'),
(4, 'Ex pareja'),
(5, 'Padre'),
(6, 'Padrastro'),
(7, 'Hermano'),
(8, 'Hijo'),
(9, 'Otro familiar'),
(10, 'Otro tipo de vinculo'),
(11, 'Desconocido'),
(12, 'Otro tipo de relacion sexo-afectiva'),
(999, 'Sin datos');

-- Relaciones de la tabla Vinculos
ALTER TABLE [dbo].[Victimas] ALTER COLUMN Vinculo_1 INT NOT NULL;

ALTER TABLE [dbo].[Victimas]
ADD FOREIGN KEY (Vinculo_1) REFERENCES [dbo].[Vinculos](Id_vinculo);

-- TABLA Genero SujetosActivos
CREATE TABLE Genero_SujetoAct (
Id_genero_sujeto INT NOT NULL PRIMARY KEY, 
Genero_sujetoactivo VARCHAR (100) NOT NULL);

INSERT INTO Genero_SujetoAct (Id_genero_sujeto, Genero_sujetoactivo) VALUES
(1, 'Varón cis'),
(2, 'Varón trans'),
(999, 'Sin datos');

-- Relaciones de la tabla Genero_SujetoAct
ALTER TABLE [dbo].[SujetosActivos] ALTER COLUMN Genero_sujeto_activo INT NOT NULL;

ALTER TABLE [dbo].[SujetosActivos]
ADD FOREIGN KEY (Genero_sujeto_activo) REFERENCES [dbo].[Genero_SujetoAct](Id_genero_sujeto);

-- Consultas para exportar las tablas a Power BI
-- Tabla causas
SELECT Numrefcausa, Jurisdiccion, Tipo_femicidio, Franja_horaria 
FROM Causas; 

-- Tabla victimas
SELECT Numrefcausa, Jurisdiccion, Nro_victima, Tipo_victima, Genero_victima, Edad_victima, Medio_empleado, Lugar, Vinculo_1, Vinculo_2, Vinculo_3, Vinculo_4
FROM Victimas;

-- Tabla SujetosActivos
SELECT Numrefcausa, Jurisdiccion, Tipo_femicidio, Numero_de_sujeto_activo, Genero_sujeto_activo, Edad_sujeto_activo
FROM SujetosActivos

-- Importamos el resto de las tablas de forma completa