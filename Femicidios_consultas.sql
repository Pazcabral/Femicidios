use Femicidios;

-- Cantidad de causas
SELECT COUNT (Numrefcausa) AS Causas
FROM dbo.Causas

-- Cantidad de V�ctimas
SELECT COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas;

-- Cantidad de Sujetos Activos
SELECT COUNT(Numrefcausa) AS SujetosActivos
FROM SujetosActivos;

-- Agrupar las v�ctimas en funci�n del tipo de v�ctima
SELECT 
	T2.Tipo AS Tipo_v�ctima,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Tipo_victima AS T2 ON T1.Tipo_victima = T2.Id_tipo_victima
GROUP BY T2.Tipo
ORDER BY 2 DESC;

-- V�ctimas seg�n g�nero
SELECT 
	T2.Genero AS G�nero_v�ctima,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Genero_victima AS T2 ON T1.Genero_victima = T2.Id_genero
GROUP BY T2.Genero
ORDER BY 2 DESC;

-- V�ctimas seg�n rango de edad
SELECT
    CASE
        WHEN Edad_victima BETWEEN 0 AND 12 THEN 'Entre 0 y 12 a�os'
		WHEN Edad_victima BETWEEN 13 AND 17 THEN 'Entre 13 y 17 a�os'
        WHEN Edad_victima BETWEEN 18 AND 24 THEN 'Entre 18 y 24 a�os'
		WHEN Edad_victima BETWEEN 25 AND 34 THEN 'Entre 25 y 34 a�os'
		WHEN Edad_victima BETWEEN 35 AND 44 THEN 'Entre 35 y 44 a�os'
		WHEN Edad_victima BETWEEN 45 AND 59 THEN 'Entre 45 y 59 a�os'
		WHEN Edad_victima >= 60 THEN 'M�s de 60 a�os'
		ELSE 'Otro'
    END AS Edad,
    COUNT (Numrefcausa) AS Victimas
FROM Victimas
GROUP BY
	CASE
        WHEN Edad_victima BETWEEN 0 AND 12 THEN 'Entre 0 y 12 a�os'
		WHEN Edad_victima BETWEEN 13 AND 17 THEN 'Entre 13 y 17 a�os'
        WHEN Edad_victima BETWEEN 18 AND 24 THEN 'Entre 18 y 24 a�os'
		WHEN Edad_victima BETWEEN 25 AND 34 THEN 'Entre 25 y 34 a�os'
		WHEN Edad_victima BETWEEN 35 AND 44 THEN 'Entre 35 y 44 a�os'
		WHEN Edad_victima BETWEEN 45 AND 59 THEN 'Entre 45 y 59 a�os'
		WHEN Edad_victima >= 60 THEN 'M�s de 60 a�os'
        ELSE 'Otro'
    END;

-- V�ctimas seg�n Provincia
SELECT 
	T2.Jurisdiccion AS Provincia,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Jurisdiccion AS T2 ON T1.Jurisdiccion = T2.Id_jurisdiccion
GROUP BY T2.Jurisdiccion
ORDER BY 2 DESC;

-- V�ctimas seg�n Tipo de Lugar del hecho
SELECT 
	T2.Tipo_lugar AS Lugar_del_hecho,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Lugar AS T2 ON T1.Lugar = T2.Id_lugar
GROUP BY T2.Tipo_lugar
ORDER BY 2 DESC;

