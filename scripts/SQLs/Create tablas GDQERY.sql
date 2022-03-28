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
        

DROP TABLE   GDQERYTO;

CREATE TABLE GDQERYTO asv
select /*+ PARALLEL(8) */ 
            C.SQL_ID as "ID_SQL",
            C.FIRST_LOAD_TIME as "FX_LOAD_DATE",
            C.PARSING_SCHEMA_NAME as DS_OWNER, 
            REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS DS_TEXT_SQL,
            "SERVICE" AS DS_SERVICE,
            MODULE, ADDRESS,
                                        HASH_VALUE,
                                        PLAN_HASH_VALUE
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
                                        ADDRESS,
                                        HASH_VALUE,
                                        PLAN_HASH_VALUE,
                                 --       ROW_NUMBER() OVER (PARTITION BY dbms_crypto.hash("SQLTRATADO1",2) order by 1) R
                                        (ROW_NUMBER() OVER (PARTITION BY SQL_ID order by 1)) AS REPETS
                                FROM USBGODA.GD_V$SQL
                    ) B WHERE REPETS =1
    )C where SQL_ID not in (select SQL_ID from GDQERYIO);

----- CREAR TABLA GDQERYTO

       ------- PASO1                
DELETE TABLE USBGODA.GDQERYTO_TEMP2 ;
alter table USBGODA.GDQERYTO_TEMP2 nologging;
set autotrace on statistics
        insert into  USBGODA.GDQERYTO_TEMP2  SELECT  /*+ PARALLEL(8) */   
                                         SQL_ID,  
                                        SQL_FULLTEXT,
                                        REGEXP_REPLACE(LOWER(SQL_FULLTEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
                                        FIRST_LOAD_TIME,
                                        PARSING_SCHEMA_NAME,
                                        UPPER("SERVICE") AS "SERVICE",
                                        UPPER(MODULE) AS MODULE,
                                        ADDRESS,
                                        HASH_VALUE,
                                        PLAN_HASH_VALUE,
                                 --       ROW_NUMBER() OVER (PARTITION BY dbms_crypto.hash("SQLTRATADO1",2) order by 1) R
                                        (ROW_NUMBER() OVER (PARTITION BY SQL_ID order by 1)) AS REPETS
                                FROM USBGODA.GDSQLVTO where SQL_ID not in (select SQL_ID from GDQERYIO);
                                commit;
       ------- PASO2  


DELETE TABLE USBGODA.GDQERYTO_TEMP1 ;
alter table USBGODA.GDQERYTO_TEMP1 nologging;
set autotrace on statistics

      insert into  USBGODA.GDQERYTO_TEMP1 
       
                SELECT /*+ PARALLEL(8) */ B.* ,
                        REGEXP_REPLACE( "SQLTRATADO1",'(\s){1,}|(\s){1,}$|$|^(\s){1,}',' ',1,0,'m') AS "SQLTRATADO2"
               FROM  USBGODA.GDQERYTO_TEMP2 B WHERE REPETS =1
               ;
    commit;
                    
       ------- PASO3                   
            CREATE TABLE USBGODA.GDQERYTO AS (
            SELECT /*+ PARALLEL(8) */ 
                T1.SQL_ID as "ID_SQL",
                T1.FIRST_LOAD_TIME as "FX_LOAD_DATE",
                T1.PARSING_SCHEMA_NAME as DS_OWNER, 
                REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS DS_TEXT_SQL,
                "SERVICE" AS DS_SERVICE,
                MODULE, 
                ADDRESS,
                HASH_VALUE,
                PLAN_HASH_VALUE
        FROM USBGODA.GDQERYTO_TEMP1 T1); -- where SQL_ID not in (select SQL_ID from GDQERYIO);
       
       
       
       
       
       
       
        COMMIT;
        _

CREATE TABLE 	USBGODA.GD_V$SQL_PLAN as  SELECT  /*+ PARALLEL(8) */ V_$SQL_PLAN.* FROM         SYS.V_$SQL_PLAN where 1=2;

NSERT INTO	USBGODA.GD_V$SQL_PLAN  SELECT  /*+ PARALLEL(8) */ V_$SQL_PLAN.* FROM         SYS.V_$SQL_PLAN ;


INSERT /*+ PARALLEL(8) */  INTO USBGODA.GDQERYHO 
select * FROM SYS.GV_$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);

DROP TABLE GDQERYIO PURGE;

CREATE TABLE GDQERYIO AS 
--INSERT INTO  GDQERYIO
 SELECT /*+ PARALLEL(8) */ ID_SQL from GDQERYTO where ID_SQL not in (select ID_SQL from GDQERYIO);



CREATE TABLE USBGODA.GDQERYSO
(ID_PARSER VARCHAR2(22) NOT NULL,
TABLE_NAME VARCHAR2(50) NOT NULL,
TIPO_CONSULTA VARCHAR2(15) NOT NULL,
VISTA VARCHAR2(15),
ORDEN NUMBER(2) NOT NULL)

commit

SELECT * FROM USBGODA.GD_V$SQL