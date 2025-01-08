-- Crear la base de datos 
CREATE DATABASE MonitoreoDispositivos_TP2; 
GO

-- Usar la base de datos recién creada 
USE MonitoreoDispositivos_TP2; 
GO

-- 1. Crear la tabla Ubicaciones
CREATE TABLE Ubicacion
(
    id_ubicacion int PRIMARY KEY IDENTITY(1,1),
    calle VARCHAR(150),
    numero int,
);

GO

-- 2. Crear la tabla TipoDispositivo
CREATE TABLE TipoDispositivo
(
    id_tipo_dispositivo int PRIMARY KEY IDENTITY(1,1),
    tipo_dispositivo VARCHAR(50) NOT NULL
);

GO

-- 3. Crear la tabla Dispositivo
CREATE TABLE Dispositivo
(
    id_dispositivo int PRIMARY KEY IDENTITY(1,1),
    id_tipo_dispositivo int,
    FOREIGN KEY (id_tipo_dispositivo) REFERENCES TipoDispositivo(id_tipo_dispositivo),
);

GO

-- 4. Crear la tabla DispositivosUbicacion
CREATE TABLE DispositivoUbicacion
(
    id_dispositivo int,
    id_ubicacion int,
    fecha_instalacion DATETIME,
    PRIMARY KEY (id_dispositivo, id_ubicacion),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicacion(id_ubicacion)
);

GO

-- 5. Crear la tabla Tecnicos
CREATE TABLE Tecnico
(
    id_tecnico int PRIMARY KEY IDENTITY(1,1),
    nombre_apellido VARCHAR(100),
    telefono VARCHAR(50),
    direccion VARCHAR(150),
    especialidad VARCHAR(50)
);

GO

-- 6. Crear la tabla Mantenimientos
CREATE TABLE Mantenimiento
(
    id_mantenimiento int PRIMARY KEY IDENTITY(1,1),
    id_dispositivo int,
    id_tecnico int,
    fecha_mantenimiento DATETIME,
    descripcion_tareas VARCHAR(255),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
);

GO

-- 7. Crear la tabla Alertas
CREATE TABLE Alerta
(
    id_alerta int PRIMARY KEY IDENTITY(1,1),
    id_ubicacion int,
    gravedad VARCHAR(20) CHECK (gravedad IN ('aviso', 'urgencia', 'emergencia')),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicacion(id_ubicacion)
);

GO

-- 8. Crear la tabla DatosMonitoreo
CREATE TABLE DatosMonitoreo
(
    id_datos_monitoreo int PRIMARY KEY IDENTITY(1,1),
    id_dispositivo int,
    id_alerta int,
    fecha_datos DATETIME,
    valor DECIMAL(6,2),
    unidad_de_medida VARCHAR(50),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
    FOREIGN KEY (id_alerta) REFERENCES Alerta(id_alerta)
);

GO

-- 9. Crear la tabla Eventos
CREATE TABLE Evento
(
    id_evento int PRIMARY KEY IDENTITY(1,1),
    id_ubicacion int,
    descripcion VARCHAR(255),
    fecha_evento DATETIME
        FOREIGN KEY (id_ubicacion) REFERENCES Ubicacion(id_ubicacion)
);

GO

-- 10. Crear la tabla AlertasEventos para la relación muchos a muchos entre Alertas y Eventos
CREATE TABLE EventoAlerta
(
    id_eventos_alertas int PRIMARY KEY IDENTITY(1,1),
    id_evento int,
    id_alerta int,
    FOREIGN KEY (id_alerta) REFERENCES Alerta(id_alerta),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);

USE MonitoreoDispositivos;
GO

-- 1. Insertar datos en Ubicacion (60 filas)
INSERT INTO Ubicacion
    (calle, numero)
VALUES
    ('Calle A', 10),
    ('Calle B', 20),
    ('Calle C', 30),
    ('Calle D', 40),
    ('Calle E', 50),
    ('Calle F', 60),
    ('Calle G', 70),
    ('Calle H', 80),
    ('Calle I', 90),
    ('Calle J', 100),
    ('Calle K', 110),
    ('Calle L', 120),
    ('Calle M', 130),
    ('Calle N', 140),
    ('Calle O', 150),
    ('Calle P', 160),
    ('Calle Q', 170),
    ('Calle R', 180),
    ('Calle S', 190),
    ('Calle T', 200),
    ('Calle U', 210),
    ('Calle V', 220),
    ('Calle W', 230),
    ('Calle X', 240),
    ('Calle Y', 250),
    ('Calle Z', 260),
    ('Calle AA', 270),
    ('Calle BB', 280),
    ('Calle CC', 290),
    ('Calle DD', 300),
    ('Calle EE', 310),
    ('Calle FF', 320),
    ('Calle GG', 330),
    ('Calle HH', 340),
    ('Calle II', 350),
    ('Calle JJ', 360),
    ('Calle KK', 370),
    ('Calle LL', 380),
    ('Calle MM', 390),
    ('Calle NN', 400),
    ('Calle OO', 410),
    ('Calle PP', 420),
    ('Calle QQ', 430),
    ('Calle RR', 440),
    ('Calle SS', 450),
    ('Calle TT', 460),
    ('Calle UU', 470),
    ('Calle VV', 480),
    ('Calle WW', 490),
    ('Calle XX', 500),
    ('Calle YY', 510),
    ('Calle ZZ', 520),
    ('Calle AAA', 530),
    ('Calle BBB', 540),
    ('Calle CCC', 550),
    ('Calle DDD', 560),
    ('Calle EEE', 570),
    ('Calle FFF', 580),
    ('Calle GGG', 590),
    ('Calle HHH', 600);
GO

-- 2. Insertar datos en TipoDispositivo (10 filas)
INSERT INTO TipoDispositivo
    (tipo_dispositivo)
VALUES
    ('Sensor de Temperatura'),
    ('Cámara de Seguridad'),
    ('Detector de Humedad'),
    ('Sensor de Movimiento'),
    ('Medidor de CO2'),
    ('Medidor de Luz'),
    ('Contador de Pasos'),
    ('Medidor de Sonido'),
    ('Sensor de Vibración'),
    ('Medidor de Presión');
GO

-- 3. Insertar datos en Dispositivo (20 filas)
INSERT INTO Dispositivo
    (id_tipo_dispositivo)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);
GO

-- 4. Insertar datos en DispositivoUbicacion (20 filas, ejemplo: 1 dispositivo por ubicacion)
INSERT INTO DispositivoUbicacion
    (id_dispositivo, id_ubicacion, fecha_instalacion)
VALUES
    (1, 1, '2024-01-10'),
    (2, 2, '2024-01-11'),
    (3, 3, '2024-01-12'),
    (4, 4, '2024-01-13'),
    (5, 5, '2024-01-14'),
    (6, 6, '2024-01-15'),
    (7, 7, '2024-01-16'),
    (8, 8, '2024-01-17'),
    (9, 9, '2024-01-18'),
    (10, 10, '2024-01-19'),
    (11, 11, '2024-01-20'),
    (12, 12, '2024-01-21'),
    (13, 13, '2024-01-22'),
    (14, 14, '2024-01-23'),
    (15, 15, '2024-01-24'),
    (16, 16, '2024-01-25'),
    (17, 17, '2024-01-26'),
    (18, 18, '2024-01-27'),
    (19, 19, '2024-01-28'),
    (20, 20, '2024-01-29');
GO

-- 5. Insertar datos en Tecnico (10 filas)
INSERT INTO Tecnico
    (nombre_apellido, telefono, direccion, especialidad)
VALUES
    ('Juan Perez', '123456789', 'Calle Falsa 123', 'Electricidad'),
    ('Maria Lopez', '987654321', 'Av. Siempre Viva 742', 'Mecánica'),
    ('Carlos Diaz', '111222333', 'Gran Via 100', 'Electrónica'),
    ('Ana Torres', '222333444', 'Plaza Mayor 5', 'Informática'),
    ('Luis Hernandez', '333444555', 'Calle Real 45', 'Electricidad'),
    ('Elena Garcia', '444555666', 'Calle Alta 34', 'Mecánica'),
    ('Jorge Martinez', '555666777', 'Calle Baja 12', 'Electrónica'),
    ('Sofia Ramos', '666777888', 'Calle Nueva 60', 'Informática'),
    ('Raul Suarez', '777888999', 'Paseo de la Castellana 15', 'Electricidad'),
    ('Laura Rivera', '888999000', 'Calle Principal 50', 'Mecánica');
GO

-- 6. Insertar datos en Mantenimiento (20 filas)
INSERT INTO Mantenimiento
    (id_dispositivo, id_tecnico, fecha_mantenimiento, descripcion_tareas)
VALUES
    (1, 1, '2024-02-01', 'Revisión general de sensores'),
    (2, 2, '2024-02-02', 'Ajuste de cámaras de seguridad'),
    (3, 3, '2024-02-03', 'Limpieza de filtro de aire'),
    (4, 4, '2024-02-04', 'Revisión de batería de respaldo'),
    (5, 5, '2024-02-05', 'Actualización de firmware de sensores'),
    (6, 6, '2024-02-06', 'Reparación de fallas en cámaras de seguridad'),
    (7, 7, '2024-02-07', 'Inspección de cables y conexiones'),
    (8, 8, '2024-02-08', 'Calibración de sensores de temperatura'),
    (9, 9, '2024-02-09', 'Verificación de sistema de alertas'),
    (10, 10, '2024-02-10', 'Reemplazo de piezas defectuosas'),
    (11, 1, '2024-02-11', 'Revisión de configuración de red'),
    (12, 2, '2024-02-12', 'Limpieza de sensores de movimiento'),
    (13, 3, '2024-02-13', 'Verificación de registros de monitoreo'),
    (14, 4, '2024-02-14', 'Prueba de sistema de alarmas'),
    (15, 5, '2024-02-15', 'Calibración de medidores de presión'),
    (16, 6, '2024-02-16', 'Reemplazo de baterías'),
    (17, 7, '2024-02-17', 'Actualización de software de seguridad'),
    (18, 8, '2024-02-18', 'Revisión del sistema de control de acceso'),
    (19, 9, '2024-02-19', 'Revisión de antenas de señal'),
    (20, 10, '2024-02-20', 'Calibración de medidores de presión');
GO

-- 7. Insertar datos en Alerta (30 filas)
INSERT INTO Alerta
    (id_ubicacion, gravedad)
VALUES
    (1, 'aviso'),
    (2, 'urgencia'),
    (3, 'emergencia'),
    (4, 'aviso'),
    (5, 'urgencia'),
    (6, 'emergencia'),
    (7, 'aviso'),
    (8, 'urgencia'),
    (9, 'emergencia'),
    (10, 'aviso'),
    (11, 'urgencia'),
    (12, 'emergencia'),
    (13, 'aviso'),
    (14, 'urgencia'),
    (15, 'emergencia'),
    (16, 'aviso'),
    (17, 'urgencia'),
    (18, 'emergencia'),
    (19, 'aviso'),
    (20, 'urgencia'),
    (21, 'emergencia'),
    (22, 'aviso'),
    (23, 'urgencia'),
    (24, 'emergencia'),
    (25, 'aviso'),
    (26, 'urgencia'),
    (27, 'emergencia'),
    (28, 'aviso'),
    (29, 'urgencia'),
    (30, 'emergencia');
GO

-- 8. Insertar datos en DatosMonitoreo (40 filas, algunas sin alertas)
INSERT INTO DatosMonitoreo
    (id_dispositivo, id_alerta, fecha_datos, valor, unidad_de_medida)
VALUES
    (1, 1, '2024-03-01', 23.5, '°C'),
    (2, NULL, '2024-03-02', 0, 'Estado'),
    -- Sin alerta
    (3, 2, '2024-03-03', 99.6, '%'),
    (4, NULL, '2024-03-04', 0, 'Movimiento'),
    -- Sin alerta
    (5, 3, '2024-03-05', 80.8, 'ppm'),
    (6, 4, '2024-03-06', 87.3, 'lux'),
    (7, NULL, '2024-03-07', 195, 'Pasos'),
    -- Sin alerta
    (8, 5, '2024-03-08', 70.4, 'dB'),
    (9, 6, '2024-03-09', 22.3, 'm/s²'),
    (10, NULL, '2024-03-10', 24.0, 'Pa'),
    -- Sin alerta
    (11, 7, '2024-03-11', 0.1, '°C'),
    (12, 8, '2024-03-12', 1, 'Estado'),
    (13, NULL, '2024-03-13', 19.9, '%'),
    -- Sin alerta
    (14, 9, '2024-03-14', 1, 'Movimiento'),
    (15, 10, '2024-03-15', 22.1, 'ppm'),
    (16, 11, '2024-03-16', 23.5, 'lux'),
    (17, NULL, '2024-03-17', 200.0, 'Pasos'),
    -- Sin alerta
    (18, 12, '2024-03-18', 21.5, 'dB'),
    (19, 13, '2024-03-19', 23.4, 'm/s²'),
    (20, 14, '2024-03-20', 19.2, 'Pa'),
    (1, 15, '2024-03-21', 22.0, '°C'),
    (2, 16, '2024-03-22', 1.0, 'Estado'),
    (3, 17, '2024-03-23', 20.5, '%'),
    (4, 18, '2024-03-24', 1, 'Movimiento'),
    (5, NULL, '2024-03-25', 21.9, 'ppm'),
    -- Sin alerta
    (6, 19, '2024-03-26', 18.4, 'lux'),
    (7, 20, '2024-03-27', 1019.2, 'Pasos'),
    (8, NULL, '2024-03-28', 23.8, 'dB'),
    -- Sin alerta
    (9, 21, '2024-03-29', 20.1, 'm/s²'),
    (10, 22, '2024-03-30', 18.9, 'Pa'),
    (11, NULL, '2024-03-31', 22.6, '°C'),
    -- Sin alerta
    (12, 23, '2024-04-01', 1, 'Estado'),
    (13, 24, '2024-04-02', 23.0, '%'),
    (14, 25, '2024-04-03', 1, 'Movimiento'),
    (15, 26, '2024-04-04', 19.4, 'ppm'),
    (16, 27, '2024-04-05', 18.3, 'lux'),
    (17, NULL, '2024-04-06', 221, 'Pasos'),
    -- Sin alerta
    (18, 28, '2024-04-07', 23.3, 'dB'),
    (19, 29, '2024-04-08', 21.7, 'm/s²'),
    (20, 30, '2024-04-10', 19.6, 'Pa');
GO

-- 9. Insertar datos en Evento (10 filas)
INSERT INTO Evento
    (id_ubicacion, descripcion, fecha_evento)
VALUES
    (1, 'Alerta de temperatura', '2024-03-01'),
    (2, 'Alerta de movimiento en cámara', '2024-03-02'),
    (3, 'Nivel alto de ruido en área', '2024-03-03'),
    (4, 'Nivel alto de CO2 en el ambiente', '2024-03-04'),
    (5, 'Cantidad excesiva de pasos', '2024-03-05'),
    (6, 'Nivel de Humedad Alto', '2024-03-06'),
    (7, 'Movimiento detectado en área restringida', '2024-03-07'),
    (8, 'Error en sensor de luminosidad', '2024-03-08'),
    (9, 'Lectura de presión fuera de rango', '2024-03-09'),
    (10, 'Sismo', '2024-03-10');
GO

-- 10. Insertar datos en EventoAlerta (10 filas, con varias alertas para un solo evento)
INSERT INTO EventoAlerta
    (id_evento, id_alerta)
VALUES
    (1, 1),
    (1, 7),
    (1, 15),
    -- Múltiples alertas para el evento 1
    (2, 9),
    (2, 18),
    (2, 25),
    -- Múltiples alertas para el evento 2
    (3, 5),
    (3, 12),
    (3, 28),
    -- Múltiples alertas para el evento 3
    (4, 3),
    (4, 10),
    (4, 26),
    -- Múltiples alertas para el evento 4
    (5, 20),
    -- Una alerta para el evento 5
    (6, 2),
    (6, 17),
    (6, 24),
    -- Múltiples alertas para el evento 6
    (7, 8),
    (7, 16),
    (7, 23),
    -- Una alerta para el evento 7
    (8, 4),
    (8, 16),
    (8, 19),
    (8, 27),
    -- Múltiples alertas para el evento 8
    (9, 14),
    (9, 22),
    (9, 30),
    -- Múltiples alertas para el evento 9
    (10, 6),
    (10, 11),
    -- Múltiples alertas para el evento 10
    (10, 19),
    (10, 27);               -- Agregando otra alerta adicional para el evento 10
GO

USE MonitoreoDispositivos;
GO

-- a) Listar todos los dispositivos involucrados en el último evento registrado

SELECT td.tipo_dispositivo AS Dispositivo, e.id_evento, dm.valor, dm.unidad_de_medida, e.fecha_evento AS 'Fecha de Evento'
FROM Dispositivo d
    INNER JOIN TipoDispositivo td ON d.id_tipo_dispositivo = td.id_tipo_dispositivo
    INNER JOIN DatosMonitoreo dm ON d.id_dispositivo = dm.id_dispositivo
    INNER JOIN Alerta a ON dm.id_alerta = a.id_alerta
    INNER JOIN EventoAlerta ea ON a.id_alerta = ea.id_alerta
    INNER JOIN Evento e ON ea.id_evento = e.id_evento
WHERE e.fecha_evento = (
    SELECT MAX(fecha_evento)
    FROM Evento
);

GO

-- b) Mostrar la cantidad de dispositivos por tipo ordenados de mayor a menor

SELECT td.tipo_dispositivo, COUNT(td.id_tipo_dispositivo) AS Cantidad
FROM Dispositivo d
    INNER JOIN TipoDispositivo td ON d.id_tipo_dispositivo = td.id_tipo_dispositivo
GROUP BY td.tipo_dispositivo
ORDER BY COUNT(td.id_tipo_dispositivo) DESC

GO

-- c) Mostrar que día se produjo el índice de contaminación más alto y cuál fue ese valor

SELECT TOP 1
    td.tipo_dispositivo, dm.valor, dm.unidad_de_medida, dm.fecha_datos
FROM Dispositivo d
    INNER JOIN TipoDispositivo td ON d.id_tipo_dispositivo = td.id_tipo_dispositivo
    INNER JOIN DatosMonitoreo dm ON dm.id_dispositivo = d.id_dispositivo
WHERE td.tipo_dispositivo = 'Medidor de CO2'
ORDER BY dm.fecha_datos DESC

GO

GO

-- INICIO CONSIGNA TP 2 --

CREATE TABLE [Gravedad]
(
    [id_gravedad] INT IDENTITY (1, 1) PRIMARY KEY,
    [descripcion] VARCHAR(50) NOT NULL CHECK (descripcion IN ('aviso', 'urgencia', 'emergencia')),
    [prioridad] INT NOT NULL UNIQUE 
);

GO

--corrección del check de prioridad menor o igual a 100. CHECK (prioridad >= 0 AND prioridad <= 100);

INSERT INTO Gravedad
    (descripcion, prioridad)
VALUES
    ('aviso', 10),
    ('urgencia', 50),
    ('emergencia', 100)


GO


-- Agrego la columna que va a funcionar como FK
ALTER TABLE Alerta ADD id_gravedad INT;

GO

-- Actualizo la tabla de alerta con los ID correspondientes
UPDATE Alerta
SET id_gravedad = (
    SELECT g.id_gravedad
    FROM Gravedad g
    WHERE gravedad = g.descripcion
);

GO

-- elimino la columna de los datos viejos
ALTER TABLE Alerta DROP CONSTRAINT CK__Alerta__gravedad__34C8D9D1;
ALTER TABLE Alerta DROP COLUMN gravedad;

GO

-- Creo el nuevo indice
ALTER TABLE Alerta
ADD CONSTRAINT FK_Alerta_id_gravedad
FOREIGN KEY (id_gravedad) REFERENCES Gravedad (id_gravedad);

GO


-- Punto 3, vista vResumenDiario

CREATE VIEW vResumenDiario
AS

    SELECT
        td.tipo_dispositivo
        , dm.fecha_datos
        , CONCAT(MAX(dm.valor), ' ', dm.unidad_de_medida) AS valor_maximo 
        , CONCAT(MIN(dm.valor), ' ', dm.unidad_de_medida) AS valor_minimo
        , CONCAT(AVG(dm.valor), ' ', dm.unidad_de_medida) AS valor_promedio
    FROM Dispositivo d
        INNER JOIN TipoDispositivo td ON d.id_tipo_dispositivo = td.id_tipo_dispositivo
        INNER JOIN DatosMonitoreo dm ON dm.id_dispositivo = d.id_dispositivo
    GROUP BY td.tipo_dispositivo, dm.fecha_datos, dm.unidad_de_medida;

GO

SELECT *
FROM vResumenDiario v_rd
WHERE v_rd.tipo_dispositivo = 'Medidor de Presión'

GO

-- Punto 4, pConsultarMantenimiento

CREATE PROCEDURE pConsultarMantenimiento
    @codigo_dispositivo INT,
    @cantidad_mantenimientos INT OUTPUT,
    @ultimo_tecnico VARCHAR(100) OUTPUT,
    @fecha_ultimo DATETIME OUTPUT
AS
BEGIN
    -- Paso 1: Inicializar variables de salida
    SET @cantidad_mantenimientos = 0;
    SET @ultimo_tecnico = NULL;
    SET @fecha_ultimo = NULL;

    -- Paso 2: Calcular cantidad de mantenimientos del año actual
    SELECT @cantidad_mantenimientos = COUNT(*)
    FROM Mantenimiento
    WHERE id_dispositivo = @codigo_dispositivo
        AND YEAR(fecha_mantenimiento) = YEAR(GETDATE());

    -- Paso 3: Obtener la fecha del último mantenimiento
    SELECT TOP 1
        @fecha_ultimo = m.fecha_mantenimiento,
        @ultimo_tecnico = t.nombre_apellido
    FROM Mantenimiento m
        INNER JOIN Tecnico t ON m.id_tecnico = t.id_tecnico
    WHERE m.id_dispositivo = @codigo_dispositivo
    ORDER BY m.fecha_mantenimiento DESC;
END;

GO

DECLARE @codigo_dispositivo int = 2
DECLARE @cantidad_mantenimientos int
DECLARE @ultimo_tecnico varchar(100)
DECLARE @fecha_ultimo datetime

EXECUTE [dbo].[pConsultarMantenimiento] 
   @codigo_dispositivo
  ,@cantidad_mantenimientos OUTPUT
  ,@ultimo_tecnico OUTPUT
  ,@fecha_ultimo OUTPUT

SELECT @cantidad_mantenimientos 'Cantidad de mantenimientos', @ultimo_tecnico 'Ultimo tecnico', @fecha_ultimo 'Fecha ultimo mantenimiento'

GO

-- Punto 5, pHistorialMediciones

CREATE PROCEDURE pHistorialMediciones
    @id_dispositivo INT,
    @fecha_inicio DATE
AS
BEGIN

    SELECT
        fecha_datos,
        valor,
        unidad_de_medida,
        valor - LAG(valor) OVER (PARTITION BY id_dispositivo ORDER BY fecha_datos) AS diferencia
    FROM
        DatosMonitoreo
    WHERE 
        id_dispositivo = @id_dispositivo
        AND fecha_datos >= @fecha_inicio
    ORDER BY 
        fecha_datos;

END;

GO

DECLARE @fecha_inicio DATETIME = '2020'
DECLARE @id_dispositivo INT = 6

EXEC pHistorialMediciones @id_dispositivo, @fecha_inicio

GO