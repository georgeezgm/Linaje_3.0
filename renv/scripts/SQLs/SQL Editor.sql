
CREATE VOLATILE TABLE VOLATIL_T1,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO AS 
(
 
select CO_QUERY, CAST(DS_QUERY as CLOB) as DS_QUERY
,CO_BBDD_DEFECTO as "USERNAME",DS_GRUPO_SENTENCIAS
 
from  JAGP_DWGDQUTT
where
it_ini_consulta(date, format 'yyyy-MM-dd') >= '2020-09-25' (date,format 'yyyy-MM-dd') 
and DS_GRUPO_SENTENCIAS not like 'DML%'
and DS_QUERY not like '%DWCAR_TT%'  )WITH DATA
      

     ON COMMIT PRESERVE ROWS;
     