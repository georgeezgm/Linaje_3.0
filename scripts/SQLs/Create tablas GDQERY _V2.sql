 
 
 
 
 CREATE TABLE GDQERYTO as (select /*+ PARALLEL(8) */ C.SQL_ID as "ID",C.FIRST_LOAD_TIME as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$|^(\s){1,}',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(LOWER(SQL_FULLTEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C WHERE 1=2);
        

DELETE FROM GDQERYTO;
INSERT INTO GDQERYTO 

----- CREAR TABLA GDQERYTO
select /*+ PARALLEL(8) */ 
            C.SQL_ID as "ID_SQL",
            C.FIRST_LOAD_TIME as "FX_LOAD_DATE",
            C.PARSING_SCHEMA_NAME as DS_OWNER, 
            REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS DS_TEXT_SQL,
            "SERVICE" AS DS_SERVICE,
            MODULE
FROM (
            SELECT /*+ PARALLEL(8) */ B.*,
                        REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$|^(\s){1,}',' ',1,0,'m') AS "SQLTRATADO2"
               FROM (
                              SELECT  /*+ PARALLEL(8) */   
                                        SQL_ID,  
                                        SQL_FULLTEXT,
                                        REGEXP_REPLACE(LOWER(SQL_FULLTEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
                                        FIRST_LOAD_TIME,
                                        PARSING_SCHEMA_NAME,
                                        UPPER("SERVICE") AS "SERVICE",
                                        UPPER(MODULE) AS MODULE,
                                 --       ROW_NUMBER() OVER (PARTITION BY dbms_crypto.hash("SQLTRATADO1",2) order by 1) R
                                        (ROW_NUMBER() OVER (PARTITION BY SQL_ID order by 1)) AS REPETS
                                FROM USBGODA.GD_V$SQL
                    ) B WHERE REPETS =1
    )C where SQL_ID not in (select SQL_ID from GDQERYIO);
        
        
COMMIT;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);

INSERT INTO  GDQERYIO
 SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO where SQL_ID not in (select SQL_ID from GDQERYIO);



CREATE TABLE USBGODA.GDQERYSO
(ID_PARSER VARCHAR2(22) NOT NULL,
TABLE_NAME VARCHAR2(50) NOT NULL,
TIPO_CONSULTA VARCHAR2(15) NOT NULL,
VISTA VARCHAR2(15),
ORDEN NUMBER(2) NOT NULL)

commit

SELECT * FROM USBGODA.GD_V$SQLt