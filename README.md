# Femicidios en Argentina. Año 2021
Características y tendencias de los homicidios por razones de género

![Image text](https://github.com/Pazcabral/Femicidios/blob/main/Femicidios.JPG)

### :clipboard: Contexto
En los años últimos años, la violencia de género ha ganado visibilidad como problema público en Argentina y de la mano de ello se han realizado esfuerzos para producir información oficial sobre este tipo de violencias, en particular aquellas de gravedad extrema como los femicidios, es decir, los asesinatos de mujeres por razones de género. En esta línea, las estadísticas provistas por el Registro Nacional de Femicidios de la Corte Suprema de Justicia de la Nación resultan relevantes ya que brindan datos sobre las causas judiciales de los hechos, las víctimas y los sujetos activos que cometieron los hechos. En este proyecto, relacionamos y analizamos estos datos, con el objetivo de obtener información valiosa que permita contruibuir al diseño de políticas de prevención y erradicación de estas formas de violencia. 


### :dart: Objetivos
El objetivo general de este proyecto es relacionar los datos de causas judiciales, víctimas y sujetos activos de femicidio en Argentina del año 2021 y analizar las características centrales de estos hechos y sus protagonistas. Se busca obtener información sobre la distribución territorial de los hechos, los tipos de lugares, determinadas características de las víctimas tales como el género y la edad, así como también los tipos de femicidios más frecuentes. 


### :triangular_ruler: Metodología
Los datos utilizados en el presente trabajo son los datos abiertos del Registro Nacional de Femicidios de la Justicia Argentina (RNFJA). Para cada año, las estadísticas se publican en tres bases (una por cada unidad de análisis): causa judicial, víctima y sujeto activo de femicidio. Es posible acceder a las fuentes desde el siguiente enlace: https://www.csjn.gov.ar/omrecopilacion/omfemicidio/registroFemicidiosDatosAbiertos.html?anioBuscar=2021

Las tres bases se encuentran descargadas en la carpeta "Fuente de datos". Asimismo, se incluye el libro de códigos donde pueden encontrarse los códigos y etiquetas de las variables y categorías.


### :key: Creación de las tablas y relaciones
Por medio de SQL Server se creó la base de datos "Femicidios" y se importaron las 3 tablas con los datos: "Causas", "Víctimas" y "Sujetos Activos". Posteriormente, se crearon las tablas de dimensiones "Jurisdicción", "Tipo_femicidio", "Franja_horaria", "Tipo_víctima", "Género_víctima", "Arma", "Lugar" y "Vínculos" con las etiquetas asociadas a cada código presente en las tablas de hechos. 

Script SQL con la creación de tablas y relaciones: https://github.com/Pazcabral/Femicidios/blob/main/Femicidios.sql

También por medio de SQL se realizaron las siguientes consultas con el objetivo de obtener insights para responder a los objetivos del proyecto: https://github.com/Pazcabral/Femicidios/blob/main/Femicidios_consultas.sql 


### :bar_chart: Visualización de los datos
Mediante Power Query y el uso de funciones DAX se realizaron algunas transformaciones en los datos para facilitar la presentación de la información. 

El dashboard interactivo para la visualización de los datos se realizó por medio de Power BI, al que es posible acceder desde este enlace: https://app.powerbi.com/view?r=eyJrIjoiYTExYjM1YTUtOTIzYy00YjVhLWI1MWMtZGYxZTdhNzY3YzRjIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9  


### 🛠️ Principales lenguajes y herramientas utilizadas: </h3>
SQL Server - Microsoft Power BI

