
drop table  USBGODA.GD_V$SQL_PLAN 
purge

CREATE VIEW SYS.GV_$SQL AS null;

CREATE TABLE USBGODA.GV_SQL
as sBN																											m                                                                       where 1=2
INSERT INTO SYS.V_$SQL_PLAN
	 SELECT  * FROM GV_$SQL_PLAN
INSERT INTO /*+ PARALLEL(8) */ 	USBGODA.GD_V$SQL_PLAN  SELECT  /*+ PARALLEL(8) */ SYS.V$SQL_PLAN.* FROM         SYS.V$SQL_PLAN;


INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;


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
                                        PLAN_HASH_VALUE,CHILD_ADDRESS,CHILD_NUMBER
                                 --       ROW_NUMBER() OVER (PARTITION BY dbms_crypto.hash("SQLTRATADO1",2) order by 1) R
                                        (ROW_NUMBER() OVER (PARTITION BY SQL_ID order by 1)) AS REPETS
                                FROM USBGODA.GD_V$SQL
                                
                                
                                CREATE TABLE GDQERYTO as
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
    
    DROP TABLE GDQERYHO;
    CREATE TABLE  GDQERYHO as
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
    INSERT  INTO  USBGODA.GDQERYHO select * FROM USBGODA.GD_V$SQL where SQL_ID not in (select distinct SQL_ID from USBGODA.GDQERYIO);