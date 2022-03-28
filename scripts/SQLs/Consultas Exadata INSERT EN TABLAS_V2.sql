CREATE TABLE USBGODA.GDSQLTTO as 
SELECT  /*+ PARALLEL(8) */       #SYSDATE AS FX_INSERCCION_CAMPO,         
V$SQLTEXT.*     FROM         V$SQLTEXT where 1=2;


CREATE TABLE GDSQLTTO as (
SELECT        *     FROM         V$SQLTEXT );

INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
INSERT /*+ PARALLEL(8) */ INTO USBGODA.GD_V$SQL SELECT  /*+ PARALLEL(8) */ SYSDATE AS FX_INSERCCION_CAMPO,V$SQL.* FROM V$SQL;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLAREA     	SELECT  /*+ PARALLEL(8) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;

 CREATE TABLE JEG_SQLS_TRATADAS as (select /*+ PARALLEL(8) */ C.SQL_ID as "ID",C.FIRST_LOAD_TIME as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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


INSERT INTO JEG_SQLS_TRATADAS 
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",C.FIRST_LOAD_TIME as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C ;
        
        commit
