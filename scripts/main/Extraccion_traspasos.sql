-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

select 
(case
when tabla_in=tabla_out and nu_in='1' then  tabla_in
when tabla_in=tabla_out and nu_in<>'1'then (nu_in||'.'||tabla_in)
else tabla_in
end )as tabla_in_new,
case
when tabla_in=tabla_out and nu_out='1'then tabla_out
when tabla_in=tabla_out and nu_out<>'1' then (nu_out||'.'||tabla_out)
else tabla_out
end 
as table_out_new, 
tipo from (

SELECT  distinct REGEXP_REPLACE(pre_tabla_in,'20[0-9][0-9][0-9][0-9][0-9][0-9]','YYYYMMDD',1,0,'m') as tabla_in, 
REGEXP_REPLACE(pre_tabla_out,'20[0-9][0-9][0-9][0-9][0-9][0-9]','YYYYMMDD',1,0,'m') as tabla_out ,
tipo,
substr(CO_TIPO_TRASPASO,1,1) as nu_in, 
substr(CO_TIPO_TRASPASO,2,1) as nu_out
from (
SELECT distinct lower(trim(NO_BASE_DATOS_ORIGEN)||'.'||CO_TABLA_ORIGEN) as pre_tabla_in, lower(NO_BASE_DATOS_DESTINO||'.'||CO_TABLA_DESTINO) as pre_tabla_out, 

case 
	when CO_TIPO_TRASPASO ='12' then 'traspaso Teradata a Exadata' 
	when CO_TIPO_TRASPASO ='21' then 'traspaso Exadata a Teradata' 
	when CO_TIPO_TRASPASO ='41' then 'traspaso TF42 a Teradata' 
	when CO_TIPO_TRASPASO ='31' then 'traspaso BDA Producción a Teradata' 
	when CO_TIPO_TRASPASO ='A1' then 'traspaso BDA Analitica a Teradata' 
	when CO_TIPO_TRASPASO ='13' then 'traspaso Teradata a BDA Produccion' 
	when CO_TIPO_TRASPASO ='14' then 'traspaso Teradata a TF42' 
	when CO_TIPO_TRASPASO ='1A' then 'traspaso Teradata a BDA Analitica' 
end
	
	
	
	
	as tipo,
	(trim(CO_TIPO_TRASPASO))(VARCHAR(3)) as CO_TIPO_TRASPASO 
	FROM DWBASEP0.DWATRTTT  WHERE  (co_tipo_traspaso like '%1%'))A
	where tipo is not null

	)B
