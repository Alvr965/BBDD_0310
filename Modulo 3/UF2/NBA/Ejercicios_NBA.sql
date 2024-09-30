1
SELECT NOMBRE "Nombre"
FROM JUGADORES
ORDER BY 1;

2
SELECT DISTINCT UPPER(POSICION) FROM JUGADORES; 
SELECT PESO FROM JUGADORES;

SELECT NOMBRE "Nombre"
FROM JUGADORES
WHERE UPPER(POSICION) IN ('C','F-C','C-F') AND PESO>200
ORDER BY 1;

SELECT NOMBRE "Nombre"
FROM JUGADORES
WHERE UPPER(POSICION) LIKE '%C%' AND PESO>200
ORDER BY 1;

3
SELECT NOMBRE "Nombre"
FROM EQUIPOS
ORDER BY 1;

4
SELECT CONFERENCIA FROM EQUIPOS;

SELECT NOMBRE "Nombre"
FROM EQUIPOS
WHERE INITCAP(CONFERENCIA)= 'East'
ORDER BY 1;

5
SELECT NOMBRE "Nombre", CIUDAD "Ciudad"
FROM EQUIPOS
WHERE INITCAP(CIUDAD) LIKE 'C%'
ORDER BY 1

6
SELECT NOMBRE "Jugador", NOMBRE_EQUIPO "Nombre del Equipo"
FROM JUGADORES
ORDER BY 2;

7
SELECT NOMBRE "Jugador"
FROM JUGADORES
WHERE INITCAP(NOMBRE_EQUIPO)='Raptors'
ORDER BY 1;

8
SELECT JUGADOR FROM ESTADISTICAS;

SELECT CODIGO, NOMBRE
FROM JUGADORES
WHERE INITCAP(NOMBRE) ='Pau Gasol';

SELECT PUNTOS_POR_PARTIDO "Media Puntos por Partido"
FROM ESTADISTICAS
WHERE JUGADOR=66;

9
SELECT TEMPORADA "Temporada", PUNTOS_POR_PARTIDO "Media Puntos por Partido"
FROM ESTADISTICAS
WHERE JUGADOR=66 AND TEMPORADA='04/05';

10
SELECT JUGADOR "Jugador", SUM(PUNTOS_POR_PARTIDO) "Puntos por partido"
FROM ESTADISTICAS
GROUP BY JUGADOR
ORDER BY 1;

11
SELECT COUNT(NOMBRE) "Jugadores", INITCAP(NOMBRE_EQUIPO) "Equipo en el que juegan"
FROM JUGADORES
GROUP BY INITCAP(NOMBRE_EQUIPO)
ORDER BY 2;

12
SELECT JUGADOR "Jugador", SUM(PUNTOS_POR_PARTIDO) "Puntos por partido"
FROM ESTADISTICAS
GROUP BY JUGADOR
ORDER BY SUM(PUNTOS_POR_PARTIDO) DESC;

SELECT NOMBRE "Jugador"
FROM JUGADORES
WHERE CODIGO=587; 