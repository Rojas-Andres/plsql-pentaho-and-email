CREATE OR REPLACE FUNCTION public.crea_fechas()
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare

fecha_fin integer;
fecha_ini varchar;
valor integer;
fec integer;
ano_siguiente integer;
id_fecha integer;
dia date;
dia_fecha varchar; 
mes_fecha varchar;
ano_fecha varchar;

begin
	
	fecha_fin = 2021;
	
	fecha_ini = '2015-01-01';
	id_fecha = 0;
	for fecha in 2015..2021 loop
		
		--select cast(split_part(fecha_ini,'-',1) as integer) into fec ; 
		fec = cast(split_part(fecha_ini,'-',1) as integer);
		ano_siguiente = fecha + 1; 
		raise notice 'fec %, ano_siguiente % ',fec,ano_siguiente;
		
		--Cuando ya sea igual al año siguiente debe de salir y comenzar a llenar el siguiente año 
		
		while fec < ano_siguiente loop
   			id_fecha = id_fecha + 1;
   			ano_fecha = cast(split_part(fecha_ini,'-',1) as varchar);
   			mes_fecha = cast(split_part(fecha_ini,'-',2) as varchar);
   			dia_fecha= cast(split_part(fecha_ini,'-',3) as varchar);
   			
   			SELECT CAST(fecha_ini AS DATE) + CAST('1 days' AS INTERVAL) into dia;
   			-- Ya debe de hacer el insert y cambiar el dia de fecha_ini
   			
   			fecha_ini = cast(dia as varchar ); 
   			
   			fec = cast(split_part(fecha_ini,'-',1) as integer);
			
   			raise notice 'dia_fecha % mes_fecha % ano_fecha % id %',dia_fecha,mes_fecha,ano_fecha,id_fecha ;
   			
   			insert into fechas(fecha_id ,dia ,mes ,ano,fecha )
   			values (id_fecha,dia_fecha,mes_fecha,ano_fecha,dia );
   		end loop;
		
		raise notice 'fecha %',fecha;
	end loop;

return true;

END;
$function$
;
