use Femicidios;

-- Cantidad de causas
SELECT COUNT (Numrefcausa) AS Causas
FROM dbo.Causas

-- Cantidad de Víctimas
SELECT COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas;

-- Cantidad de Sujetos Activos
SELECT COUNT(Numrefcausa) AS SujetosActivos
FROM SujetosActivos;

-- Agrupar las víctimas en función del tipo de víctima
SELECT 
	T2.Tipo AS Tipo_víctima,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Tipo_victima AS T2 ON T1.Tipo_victima = T2.Id_tipo_victima
GROUP BY T2.Tipo
ORDER BY 2 DESC;

-- Víctimas según género
SELECT 
	T2.Genero AS Género_víctima,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Genero_victima AS T2 ON T1.Genero_victima = T2.Id_genero
GROUP BY T2.Genero
ORDER BY 2 DESC;

-- Víctimas según rango de edad
SELECT
    CASE
        WHEN Edad_victima BETWEEN 0 AND 12 THEN 'Entre 0 y 12 años'
		WHEN Edad_victima BETWEEN 13 AND 17 THEN 'Entre 13 y 17 años'
        WHEN Edad_victima BETWEEN 18 AND 24 THEN 'Entre 18 y 24 años'
		WHEN Edad_victima BETWEEN 25 AND 34 THEN 'Entre 25 y 34 años'
		WHEN Edad_victima BETWEEN 35 AND 44 THEN 'Entre 35 y 44 años'
		WHEN Edad_victima BETWEEN 45 AND 59 THEN 'Entre 45 y 59 años'
		WHEN Edad_victima >= 60 THEN 'Más de 60 años'
		ELSE 'Otro'
    END AS Edad,
    COUNT (Numrefcausa) AS Victimas
FROM Victimas
GROUP BY
	CASE
        WHEN Edad_victima BETWEEN 0 AND 12 THEN 'Entre 0 y 12 años'
		WHEN Edad_victima BETWEEN 13 AND 17 THEN 'Entre 13 y 17 años'
        WHEN Edad_victima BETWEEN 18 AND 24 THEN 'Entre 18 y 24 años'
		WHEN Edad_victima BETWEEN 25 AND 34 THEN 'Entre 25 y 34 años'
		WHEN Edad_victima BETWEEN 35 AND 44 THEN 'Entre 35 y 44 años'
		WHEN Edad_victima BETWEEN 45 AND 59 THEN 'Entre 45 y 59 años'
		WHEN Edad_victima >= 60 THEN 'Más de 60 años'
        ELSE 'Otro'
    END;

-- Víctimas según Provincia
SELECT 
	T2.Jurisdiccion AS Provincia,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Jurisdiccion AS T2 ON T1.Jurisdiccion = T2.Id_jurisdiccion
GROUP BY T2.Jurisdiccion
ORDER BY 2 DESC;

-- Víctimas según Tipo de Lugar del hecho
SELECT 
	T2.Tipo_lugar AS Lugar_del_hecho,
	COUNT(Numrefcausa) AS Victimas
FROM dbo.Victimas AS T1
INNER JOIN dbo.Lugar AS T2 ON T1.Lugar = T2.Id_lugar
GROUP BY T2.Tipo_lugar
ORDER BY 2 DESC;

