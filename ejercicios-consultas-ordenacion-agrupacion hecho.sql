
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title" 
from "Album"
order by "Title";

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select  "AlbumId" , count("AlbumId") as numero_canciones
from "Track"
group by "AlbumId" 
order by numero_canciones desc 
limit 1;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select "Composer" , avg("Milliseconds"), stddev("Milliseconds"), variance("Milliseconds") 
from "Track"
group by "Composer"; 

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select "Name", "UnitPrice" 
from "Track"
limit 10;

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select "FirstName" , "EmployeeId" 
from "Employee"
order by "EmployeeId" desc;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select count("GenreId") as numero_de_generos
from "Genre";

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select "FirstName" , "Country" 
from "Customer" 
order by "FirstName" 
limit 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select "Country", count("CustomerId") as numero_clientes
from "Customer"
group by "Country" ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select "BillingCountry" , sum("Total")  
from "Invoice"
group by "BillingCountry"
having sum ("Total")> 10;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select "Country" , count ("CustomerId") as numero_clientes
from "Customer" 
group by "Country"
having count ("CustomerId")> 5;


-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
select "MediaTypeId" , count("TrackId")
from "Track" 
where "Milliseconds" > 250000
group by "MediaTypeId";


-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select "Country" , count("CustomerId") as numero_clientes
from "Customer"
where "SupportRepId" < 5
group by "Country";

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
select "BillingPostalCode" , count ("CustomerId") as numero_clientes
from "Invoice" 
group by "BillingPostalCode" 
having count ("CustomerId")> 5;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select "MediaTypeId" , count("TrackId")
from "Track" 
where "UnitPrice"> 0.99 and"Milliseconds" > 200000
group by "MediaTypeId";

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select "Country" , "State" ,"CustomerId" , "Company" 
from "Customer"
where "SupportRepId" > 3 and "Company" is not NULL;
