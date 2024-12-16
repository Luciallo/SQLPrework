
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name" as Nombre_pista, a."Title" as titulo_album
from "Track" as t 
inner join "Album" as a 
  ON t."AlbumId" = a."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select a."Title" as titulo_album , a2."Name" as nombre_artista
from "Album" as a 
inner join "Artist" as a2
  ON a."ArtistId" = a2."ArtistId"
order by nombre_artista;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
SELECT 
    CONCAT("FirstName", ' ', "LastName") AS nombre_cliente,
    SUM("Total") AS total_facturas
FROM "Invoice" AS i
INNER JOIN "Customer" AS c 
    ON i."CustomerId" = c."CustomerId"
GROUP BY "FirstName", "LastName"
ORDER BY total_facturas DESC
LIMIT 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select Concat(e."FirstName", ' ', e."LastName") as nombre_empleado,
       concat(c."FirstName",' ',c."LastName") as nombre_cliente
from "Employee" as e 
inner join "Customer" as c 
   ON e."EmployeeId" = c."SupportRepId" ;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
 select "InvoiceId" as ID_facturas , "Name" as nombre_pista
 from "InvoiceLine" as il 
 inner join "Track" as t 
   on il."TrackId" = t."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
 select "Composer" as nombre_artista, g."Name" as genero
 from "Track" as  t
 inner join "Genre" as g 
 on t."GenreId" = g."GenreId";  
--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as nombre_pista, mt."Name" as tipo_de_medio
from "Track" as t 
inner join "MediaType" as mt 
  ON t."MediaTypeId" = mt."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.
 select t."Name" as nombre_pista, g."Name"  as genero
 from "Track" as t 
 left join "Genre" as g 
  on t."GenreId" = g."GenreId" ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select concat("FirstName",' ', "LastName") as nombre_cliente,
       "InvoiceId" 
from "Customer" as c 
left join "Invoice" as i 
 ON c."CustomerId" = i."CustomerId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select a2."Title" as titulo_album,
        a."Name" as nombre_artista      
from "Artist" as a 
left join "Album" as a2 
 on a."ArtistId" = a2."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select g."Name" as genero,
       count("TrackId") as numero_pistas
from "Track" as t
full join "Genre" as g 
 on t."GenreId" = g."GenreId" 
group  by genero
order by numero_pistas desc;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
SELECT 
    "Title" AS titulo_album,
    SUM("Milliseconds") AS duracion_total
FROM "Album" AS a
INNER JOIN "Track" AS t 
    ON a."AlbumId" = t."AlbumId"
GROUP BY "Title";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select concat("FirstName",' ',"LastName") as nombre_cliente,
       sum("Total") as total_gastado
from "Customer" as c
inner join "Invoice" as i 
  ON c."CustomerId" = i."CustomerId"
group by "FirstName","LastName";

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select concat(e."FirstName",' ', e."LastName") as nombre_empleado,
       concat(c."FirstName",' ', c."LastName") as nombre_cliente
from "Employee" as e
left join "Customer" as c 
 on e."EmployeeId" = c."SupportRepId"; 




