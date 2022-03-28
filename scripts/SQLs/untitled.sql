select max(fechacorta) from JMILLO_PARSE_DATOS;
select max(fechacorta) from JMLILLO_PARSE_DATOS;
select max(fechacorta) from JMLILLO_PARSER_DATOS;
select v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
           v.FIRST_LOAD_TIME,
           v.DISK_READS,
           v.ROWS_PROCESSED,
           v.ELAPSED_TIME,
           v.service
      from v$sql v where PARSING_SCHEMA_NAME='USBGODA';
SELECT /*+ parallel(8) */ MAX(FECHAINI) AS FECHAINI2 FROM T147282.JMLILLO_SQLAREA_HT;
select v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
           v.FIRST_LOAD_TIME,
           v.DISK_READS,
           v.ROWS_PROCESSED,
           v.ELAPSED_TIME,
           v.service
      from v$sql v where (PARSING_SCHEMA_NAME='USBGODA' OR PARSING_SCHEMA_NAME='T147282') ;
CREATE CARGA_SQLAREA as SELECT * FROM T147282.CARGA_SQLAREA WHERE 1=2;
CREATE TABLE CARGA_SQLAREA as SELECT * FROM T147282.CARGA_SQLAREA WHERE 1=2;
INSERT /*+ append parallel(8) */ INTO CARGA_SQLAREA SELECT /*+ parallel(8) */ * from T147282.CARGA_SQLAREA;
SELECET * FROM GDQERYHO WHERE PARSING_SCHEMA_NAME ='USBGODA';
SELECET * FROM USBGODA.GDQERYHO WHERE PARSING_SCHEMA_NAME = "USBGODA";
SELECT * FROM USBGODA.GDQERYHO WHERE PARSING_SCHEMA_NAME = "USBGODA";
SELECT /*+ parallel(8) */ MAX(FECHAINI) AS FECHAINI2 FROM T147282.JMLILLO_SQLAREA_HT
      
      SELECT /* OPT_DYN_SAMP */ /*+ ALL_ROWS IGNORE_WHERE_CLAUSE NO_PARALLEL(SAMPLESUB) opt_param('parallel_execution_enabled', 'false') NO_PARALLEL_INDEX(SAMPLESUB) NO_SQL_TUNE */ NVL(SUM(C1),0), NVL(SUM(C2),0) FROM (SELECT /*+ IGNORE_WHERE_CLAUSE NO_PARALLEL("AUD$") FULL("AUD$") NO_PARALLEL_INDEX("AUD$") */ 1 AS C1, CASE WHEN "AUD$"."RETURNCODE"=0 AND "SYS"."DBMS_LOB"."GETLENGTH"("AUD$"."SQLTEXT")>=:B1 AND SYS_EXTRACT_UTC(FROM_TZ("AUD$"."NTIMESTAMP#",'UTC') AT TIME ZONE 'Europe/Madrid')>SYS_EXTRACT_UTC(:B2) AND "AUD$"."SQLTEXT" IS NOT NULL AND "AUD$"."SCN" IS NOT NULL THEN 1 ELSE 0 END AS C2 FROM "SYS"."AUD$" SAMPLE BLOCK (0.024618 , 1) SEED (1) "AUD$") SAMPLESUB
      
      INSERT /*+ APPEND parallel (8)*/ INTO T147282.JMLILLO_SQL_TEXT SELECT /*+ parallel(8) */ A.HASH_VALUE, A.SQL_ID, B.COMMAND_NAME, A.PIECE, A.SQL_TEXT FROM GV$SQLTEXT A INNER JOIN V$SQLCOMMAND B ON A.COMMAND_TYPE=B.COMMAND_TYPE WHERE A.HASH_VALUE NOT IN ( SELECT /*+ parallel(8) */ HASH_VALUE FROM T147282.JMLILLO_SQL_TEXT WHERE PIECE=0 ) 
      
      T147282.JMLILLO_SQL_TEXT
      
      INSERT /*+ append parallel(8) */ INTO T147282.CARGA_SQLAREA SELECT /*+ parallel(8) */ TRUNC(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-DD/HH24:MI:SS')) AS FECHA, INST_ID , SQL_ID , HASH_VALUE, SHARABLE_MEM , PERSISTENT_MEM , RUNTIME_MEM , USERS_OPENING , EXECUTIONS , PX_SERVERS_EXECUTIONS , END_OF_FETCH_COUNT , USERS_EXECUTING , LOADS , FIRST_LOAD_TIME , DISK_READS , DIRECT_WRITES , APPLICATION_WAIT_TIME , CONCURRENCY_WAIT_TIME , CLUSTER_WAIT_TIME , USER_IO_WAIT_TIME , PLSQL_EXEC_TIME , JAVA_EXEC_TIME , ROWS_PROCESSED , COMMAND_TYPE , PARSING_USER_ID AS USER_ID , PARSING_SCHEMA_ID , PARSING_SCHEMA_NAME AS USERNAME , MODULE, MODULE_HASH, CPU_TIME , ELAPSED_TIME , OUTLINE_SID , PHYSICAL_READ_BYTES AS IO_READ , PHYSICAL_WRITE_BYTES AS IO_WRITE FROM GV$SQLAREA WHERE TO_TIMESTAMP(FIRST_LOAD_TIME,'YYYY-MM-DD/HH24:MI:SS') > COALESCE(:B1 ,TO_TIMESTAMP('01/01/2000','DD/MM/YYYY HH24:MISS'))
      
      CREATE TABLE CARGA_SQLAREA as SELECT * FROM T147282.CARGA_SQLAREA WHERE 1=2
      
       INJMLILLO_PARSER_DATOSSERT /*+ append parallel(8) */ INTO CARGA_SQLAREA SELECT /*+ parallel(8) */ * from T147282.CARGA_SQLAREA
       
       
       
       
       SELECT * FROM USBGODA.GDQERYHO WHERE PARSING_SCHEMA_NAME = 'USBGODA';
SELECT * FROM USBGODA.GDQERYHO WHERE PARSING_SCHEMA_NAME = 'USBGODA';
select * from GD_V$SQLAREA_20200619  WHERE PARSING_SCHEMA_NAME = 'USBGODA';
CREATE TABLE GD_V$SQLAREA_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLAREA.*       FROM             V$SQLAREA          WHERE             1 = 2         )
CREATE TABLE GD_V$SQLTEXT_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLTEXT.*       FROM             V$SQLTEXT          WHERE             1 = 2         )
CREATE TABLE GD_V$SQL_PLAN_20220127   AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL_PLAN.*      FROM             V$SQL_PLAN         WHERE             1 = 2         )
CREATE TABLE GD_V$SQL_20220127    	  AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL.*         	FROM             V$SQL        		WHERE             1 = 2         );
CREATE TABLE GD_V$SQLAREA_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLAREA.*       FROM             V$SQLAREA          WHERE             1 = 2         );
CREATE TABLE GD_V$SQLTEXT_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLTEXT.*       FROM             V$SQLTEXT          WHERE             1 = 2         );
CREATE TABLE GD_V$SQL_PLAN_20220127   AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL_PLAN.*      FROM             V$SQL_PLAN         WHERE             1 = 2         );
CREATE TABLE GD_V$SQL_20220127    	  AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL.*         	FROM             V$SQL        		WHERE             1 = 2         );
CREATE TABLE GD_V$SQLAREA_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLAREA.*       FROM             V$SQLAREA          WHERE             1 = 2         );
CREATE TABLE GD_V$SQLTEXT_20220127    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLTEXT.*       FROM             V$SQLTEXT          WHERE             1 = 2         );
CREATE TABLE GD_V$SQL_PLAN_20220127   AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL_PLAN.*      FROM             V$SQL_PLAN         WHERE             1 = 2         );
CREATE TABLE GD_V$SQL_20220127    	  AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL.*         	FROM             V$SQL        		WHERE             1 = 2         );
INSERT /*+ PARALLEL(GD_V$SQL_20220127) */ 				INTO USBGODA.GD_V$SQL_20220127     		SELECT  /*+ PARALLEL(V$SQL) */        	SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL.*     	FROM         V$SQL;
INSERT /*+ PARALLEL(USBGODA.GD_V$SQLAREA_20220127) */ 	INTO USBGODA.GD_V$SQLAREA_20220127     	SELECT  /*+ PARALLEL(V$SQLAREA) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(USBGODA.GD_V$SQL_PLAN_20220127) */ 	INTO USBGODA.GD_V$SQL_PLAN_20220127     SELECT  /*+ PARALLEL(V$SQL_PLAN) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
INSERT /*+ PARALLEL(USBGODA.GD_V$SQLTEXT_20220127) */ 	INTO USBGODA.GD_V$SQLTEXT_20220127     SELECT  /*+ PARALLEL(V$SQLTEXT) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQL_TEXT;
SELECT  /*+ PARALLEL(V$SQLTEXT) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQL_TEXT;
INSERT /*+ PARALLEL(USBGODA.GD_V$SQLTEXT_20220127) */ 	INTO USBGODA.GD_V$SQLTEXT_20220127     SELECT  /*+ PARALLEL(V$SQLTEXT) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
select * from GD_V$SQL_20220127  WHERE PARSING_SCHEMA_NAME = 'USBGODA';
select min(FIRST_LOAD_TIME), max(FIRST_LOAD_TIME) from GD_V$SQL_20220127  WHERE PARSING_SCHEMA_NAME = 'USBGODA';
select min(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/HH:MI:SS')), max(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/HH:MI:SS')) from GD_V$SQL_20220127 ;
select min(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/24HH:MI:SS')), max(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/HH:MI:SS')) from GD_V$SQL_20220127 ;
select min(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/24HH:MI:ss')), max(TO_DATE(FIRST_LOAD_TIME,'YYYY-MM-dd/24HH:MI:ss')) from GD_V$SQL_20220127 ;
select min(FIRST_LOAD_TIME), max(FIRST_LOAD_TIME) from GD_V$SQL_20220127 ;
Select * from GD_V$SQL_20220127 where SQL_TEXT like '%REPLACE%';
Select * from GD_V$SQL_20220127 where SQL_TEXT like '%REGEXP_REPLACE%';
Select * from GV_$SQL where SQL_TEXT like '%REGEXP_REPLACE%';
SELECT
	count(*)
FROM
	SYS.DBA_VIEWS;
SELECT
	count(*)
FROM
	SYS.ALL_VIEWS;
SELECT
	OWNER, VIEW_NAME, OWNER||VIEW_NAME as VISTA, REGEXP_REPLACE(UPPER(TEXT),'  ',' ') as SQLTEXT
FROM
	SYS.DBA_VIEWS;
SELECT
	OWNER, VIEW_NAME, OWNER||VIEW_NAME as VISTA, REGEXP_REPLACE(UPPER(TEXT),'  ',' ',CLOB) as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, VIEW_NAME, OWNER||VIEW_NAME as VISTA, REGEXP_REPLACE(UPPER(TEXT),'  ',' ','CLOB') as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, VIEW_NAME, OWNER||VIEW_NAME as VISTA, REGEXP_REPLACE(TO_CLOB(UPPER(TEXT)),'  ',' ','CLOB') as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	REGEXP_REPLACE(TO_CLOB(UPPER(TEXT)),'  ',' ','CLOB') as SQLTEXT
FROM
	SYS.DBA_VIEWS;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	REGEXP_REPLACE(TO_CLOB(UPPER(TEXT)),'  ',' ') as SQLTEXT
FROM
	SYS.DBA_VIEWS;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	REGEXP_REPLACE(UPPER(TO_CLOB(TEXT)),'  ',' ') as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	
	REPLACE(UPPER(TO_CLOB(TEXT)),'  ',' ') as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	
	UPPER(TO_CLOB(TEXT))as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
	OWNER||VIEW_NAME as VISTA, 
	
	UPPER(TEXT) as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
--	OWNER||VIEW_NAME as VISTA, 
	
	UPPER(TEXT) as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
--	OWNER||VIEW_NAME as VISTA, 
	
	TO_CLOB(TEXT) as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
--	OWNER||VIEW_NAME as VISTA, 
	
	TEXT as SQLTEXT
FROM
	SYS.DBA_VIEWS
;
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TO_LOB(TEXT) as SQLTEXT
FROM
	SYS.DBA_VIEWS;
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT as SQLTEXT
FROM
	SYS.DBA_VIEWS;
CREATE TABLE JEG_VISTAS_EXADATA_TEMP
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT as SQLTEXT
FROM
	SYS.DBA_VIEWS;
CREATE TABLE JEG_VISTAS_EXADATA_TEMP(
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT as SQLTEXT
FROM
	SYS.DBA_VIEWS);
CREATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT as SQLTEXT
FROM
	SYS.DBA_VIEWS);
CREATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT 
FROM
	SYS.DBA_VIEWS where 1=2);
CREATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
	OWNER, 
	VIEW_NAME, 
(OWNER||'.'||VIEW_NAME) as VISTA, 
	
	TEXT 
FROM
	all_VIEWS where 1=2);
REATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
*
FROM
	all_VIEWS where 1=2);
CREATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
*
FROM
	ALL_VIEWS);
CREATE TABLE JEG_VISTAS_EXADATA_TEMP as (
SELECT
(OWNER||'.'||VIEW_NAME) as VISTA, 
TEXT(CLOB 20k)
FROM
	ALL_VIEWS)
;
select *
FROM
  sys.view$ v;
select u.name, o.name, v.text
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#;
select u.name, o.name, to_CLOB(v.text)
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#;
CREATE TABLE USBGODA.ALL_VIEWS (OWNER,VIEW_NAME,SQLTEXT CLOB);
INSERT INTO USBGODA.ALL_VIEWS(select u.name, o.name, to_LOB(v.text)
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#;
CREATE TABLE USBGODA.ALL_VIEWS (OWNER,VIEW_NAME,SQLTEXT CLOB);
CREATE TABLE USBGODA.ALL_VIEWS (OWNER VARCHAR2(30) Not Null,VIEW_NAME VARCHAR2(30) Not Null,SQLTEXT CLOB);
INSERT INTO USBGODA.ALL_VIEWS(select u.name, o.name, to_LOB(v.text)
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#;
INSERT INTO USBGODA.ALL_VIEWS(select u.name, o.name, to_LOB(v.text)
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#);
select * from USBGODA.ALL_VIEWS;
select ROWNUM as CO_QUERY, 'CREATE TABLE '||OWNER||'.'||VIEW_NAME||' AS( '||SQLTEXT||');' as TEXTO FROM

ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME, REGEX_REPLACE(SQLTEXT,' '{2,},' ',1,0,m)
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME, REGEX_REPLACE(SQLTEXT,' {2,}',' ',1,0,m)
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME, REGEX_REPLACE(SQLTEXT,' {2,}',' ',1,0,m) from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,' '{2,},' ',1,0,m) from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'\s{2,}?','\s',1,0,m) from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'\s{2,}?','\s',1,0,m) as TEXT from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'\s{2,}?','\s','1','0','m') as TEXT from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'\s{2,}?','\s',1,0,'m') as TEXT from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'(\s){2,}?','\s',1,0,'m') as TEXT from
ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEX_REPLACE(SQLTEXT,'(\s){2,}?','\s',1,0,'m') as TEXT from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,"(\s){1,}|(\s){1,}$|$"," ",1,0,"m") as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,"(\s){1,}|(\s){1,}$|$"," ",1,0,"m") as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT 
OWNER,
VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,"(\s){1,}|(\s){1,}$|$"," ",1,0,"m") as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT 
OWNER,
VIEW_NAME as TABLE_NAME,
REGEX_REPLACE(SQLTEXT,"(\s){1,}"," ",1,0,"m") as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as TABLE_NAME,
REGEXP_REPLACE(SQLTEXT,"(\s){1,}|(\s){1,}$|$"," ",1,0,"m") as "TEXTO" from
USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as "TEXTO" 
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as "CSQL_TEXT" 
 REGEXP_REPLACE(TO_CLOB("CSQL_TEXT"),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS "SQL_TRATADO",
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as CSQL_TEXT"
 REGEXP_REPLACE(TO_CLOB(CSQL_TEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS "SQL_TRATADO"
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as CSQL_TEXT
 REGEXP_REPLACE(TO_CLOB(CSQL_TEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS "SQL_TRATADO"
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as CSQL_TEXT,
 REGEXP_REPLACE(TO_CLOB(CSQL_TEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS "SQL_TRATADO"
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as "CSQL_TEXT",
 REGEXP_REPLACE(TO_CLOB("CSQL_TEXT"),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS "SQL_TRATADO"
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2,
 REGEXP_REPLACE(TO_CLOB(SQLTEXT2),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER,
VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS;
SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS;
select 
 REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS)as B;
select 
 REGEXP_REPLACE(SQLTEXT2,'(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS)as B;
select 
 REGEXP_REPLACE(SQLTEXT2,'(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS)as B;
select 
 REGEXP_REPLACE(SQLTEXT2,'(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select 
 REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select 
 REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select CO_QUERY,TABLE_NAME,
 REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m') AS SWLTTEXT3
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select CO_QUERY,
'CREATE TABLE '||TABLE_NAME||' AS ('||REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select CO_QUERY,
'create table '||TABLE_NAME||' as ('||REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_CLOB(SQLTEXT),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select CO_QUERY,
'create table '||TABLE_NAME||' as ('||REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(TO_LOWER(TO_CLOB(SQLTEXT)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
select CO_QUERY,
'create table '||LOWER(TABLE_NAME)||' as ('||REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(LOWER(TO_CLOB(SQLTEXT)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
SELECT distinct '0' as valor, '2022-02-01'(date) as fecha_query,
                                              trim(cast(co_query_amp as varchar(22))) as co_query,
                                              trim(tabla) as tabla,
                                              trim(tipo) as tipo,
                                              trim(tabla_vista) as tabla_vista,
                                              trim(cast(orden as varchar(3))) as orden
                                              FROM dwgobdp0.god_parser_fin
                                              where it_ini_consulta(date) between (('2022-02-01'(date)-5) and ('2022-02-01'(date)))
                                              order by co_query asc, orden  asc;
SELECT distinct '0' as valor, '2022-02-01'(date) as fecha_query,
                                              trim(cast(co_query_amp as varchar(22))) as co_query,
                                              trim(tabla) as tabla,
                                              trim(tipo) as tipo,
                                              trim(tabla_vista) as tabla_vista,
                                              trim(cast(orden as varchar(3))) as orden
                                              FROM dwgobdp0.god_parser_fin
                                              where it_ini_consulta(date) between (('2022-02-01'(date))-5 and ('2022-02-01'(date)))
                                              order by co_query asc, orden  asc;
SELECT distinct '0' as valor, '2022-02-01'(date) as fecha_query,
                                              trim(cast(co_query_amp as varchar(22))) as co_query,
                                              trim(tabla) as tabla,
                                              trim(tipo) as tipo,
                                              trim(tabla_vista) as tabla_vista,
                                              trim(cast(orden as varchar(3))) as orden
                                              FROM dwgobdp0.god_parser_fin
                                              where it_ini_consulta(date) = ('2022-02-01'(date))-5
                                            --  where it_ini_consulta(date) between (('2022-02-01'(date))-5 and ('2022-02-01'(date)))
                                              order by co_query asc, orden  asc;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT "1."||RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1.VIEWNAME) AS ID,
    T1.TEXTO(VARCHAR(20000)),
     T1.OWNER,
     T1.DATABASE,
     T1.TABLE,
     T1.VIEWNAME
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS VIEWNAME,
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS SQL_TRATADO,
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS SQL_TRATADO2,
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS TEXTO,
        UPPER(TRIM(CreatorName)) as OWNER,
        UPPER(TRIM(DatabaseName))as DATABASE,
        UPPER(TRIM(TableName))as TABLE
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1.VIEWNAME) AS ID,
    T1.TEXTO(VARCHAR(20000)),
     T1.OWNER,
     T1.DATABASE,
     T1.TABLE,
     T1.VIEWNAME
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS VIEWNAME,
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS SQL_TRATADO,
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS SQL_TRATADO2,
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS TEXTO,
        UPPER(TRIM(CreatorName)) as OWNER,
        UPPER(TRIM(DatabaseName))as 'DATABASE',
        UPPER(TRIM(TableName))as TABLE
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1.VIEWNAME) AS ID,
    T1.TEXTO(VARCHAR(20000)),
     T1.OWNER,
     T1.\"DATABASE\",
     T1.TABLE,
     T1.VIEWNAME
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS VIEWNAME,
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS SQL_TRATADO,
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS SQL_TRATADO2,
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS TEXTO,
        UPPER(TRIM(CreatorName)) as OWNER,
        UPPER(TRIM(DatabaseName))as \"DATABASE\",
        UPPER(TRIM(TableName))as TABLE
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        LOWER(RequestText(CLOB(20K))) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(LOWER(SQL_TRATADO2(CLOB(20K))),'VIEW','TABLE',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where trim(TEXTO) is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where rtrim(TEXTO) is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        TRIM(CSQL_TEXT(CLOB(20K)) as CSQL_TEXT1,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT1(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where trim(TEXTO) is not null order by TEXTO asc;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        TRIM(CSQL_TEXT(CLOB(20K))) as CSQL_TEXT1,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT1(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where trim(TEXTO) is not null order by TEXTO asc;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        TRIM(CSQL_TEXT(CLOB(20K))) as CSQL_TEXT1,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT1(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^(\s){1,}|(\s){1,}$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where TEXTO is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        TRIM(CSQL_TEXT(CLOB(20K))) as CSQL_TEXT1,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT1(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^(\s){1,}|(\s){1,}$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where T1."TEXTO" is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^(\s){1,}|(\s){1,}$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      
    ) as T1 where T1."TEXTO" is not null
    
    
;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^(\s){1,}|(\s){1,}$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      where "TEXTO" is not null
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^(\s){1,}|(\s){1,}$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      AND "TEXTO" is not null
    ) as T1;
SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
      AND "TEXTO" is not null;
select * FROM dbc.tables
        WHERE tablekind='V';
select  RequestText(CLOB(20K)) as CSQL_TEXT FROM dbc.tables
        WHERE tablekind='V'
          AND  CreatorName  NOT IN ('DBC','SystemFe')
      AND "TEXTO" is not null;
select  RequestText(CLOB(20K)) as CSQL_TEXT FROM dbc.tables
        WHERE tablekind='V'
          AND  CreatorName  NOT IN ('DBC','SystemFe');
select  RequestText(CLOB(20K)) as CSQL_TEXT ,
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
 FROM dbc.tables
        WHERE tablekind='V';
select  RequestText(CLOB(20K)) as CSQL_TEXT ,
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
 FROM dbc.tables
        WHERE tablekind='V'
          AND  CreatorName  NOT IN ('DBC','SystemFe');
select  RequestText(CLOB(20K)) as CSQL_TEXT ,
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE",
        CREATORNAME
 FROM dbc.tables
        WHERE tablekind='V';
select  RequestText(CLOB(20K)) as CSQL_TEXT ,
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE",
        CREATORNAME,
        DBC.TABLES.*
 FROM dbc.tables
        WHERE tablekind='V';
select  RequestText(CLOB(20K)) as CSQL_TEXT ,
 REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
       
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE",
        CREATORNAME,
        DBC.TABLES.*
 FROM dbc.tables
        WHERE tablekind='V';
select  "RequestText"(CLOB(20K)) as CSQL_TEXT ,
 REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
       
         UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
 UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE",
        CREATORNAME,
        DBC.TABLES.*
 FROM dbc.tables
        WHERE tablekind='V';
select * from dbc.views;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20K)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20K)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    --  AND "TEXTO" is not null
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
     AND "TEXTO" <> ''
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
         where "TEXTO" <> ''

;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20000))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
         where "TEXTO" <> ''

;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20K))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
         where "TEXTO" <> ''

;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20K))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
         where "TEXTO" is not null;
SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V';
SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V';
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20K))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20000))as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2(20000)) as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
      --   where "TEXTO" is not null 

;
SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR2) as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
      --   where "TEXTO" is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
   ( T1."TEXTO0"(VARCHAR2) )as TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
   ( T1."TEXTO0"(VARCHAR2) )as "TEXTO",
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     T1."TEXTO0",
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
      --;
TO_VARCHAR2(T1."TEXTO0") AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     TO_VARCHAR(T1."TEXTO0") AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
      --   where "TEXTO" is not null;
SELECT RANK(T1."VIEWNAME") AS ID,
     T1."TEXTO0"(VARCHAR2(20K)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     T1."TEXTO0"(VARCHAR2(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     CAST(T1."TEXTO0" AS VARCHAR2(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     CAST(T1."TEXTO0" AS CLOB(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
IN ('com.teradata.jdbc.jdk6.JDK6_SQL_Clob@7d66f9d7');
SELECT RANK(T1."VIEWNAME") AS ID,
     CAST(T1."TEXTO0" AS CLOB(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
      --   where "TEXTO" is not null 
--REGEXP_INSTR(TEXTO,
;
SELECT RANK(T1."VIEWNAME") AS ID,
     CAST(T1."TEXTO0" AS VARCHAR(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1;
SELECT RANK(T1."VIEWNAME") AS ID,
     CAST(T1."TEXTO0" AS VARCHAR(20000)) AS TEXTO,
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20000)) as "CSQL_TEXT",
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0",
        
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
     --       AND  CreatorName  NOT IN ('DBC','SystemFe')
    ) as T1 
    
        where "TEXTO" <> '';
select v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
           v.FIRST_LOAD_TIME,
           v.DISK_READS,
           v.ROWS_PROCESSED,
           v.ELAPSED_TIME,
           v.service
      from v$sql v where (PARSING_SCHEMA_NAME='USBGODA' OR PARSING_SCHEMA_NAME='T147282');
select distinct v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
          -- v.FIRST_LOAD_TIME,
        --   v.DISK_READS,
          -- v.ROWS_PROCESSED,
           --v.ELAPSED_TIME,
           v.service
      from v$sql v where (PARSING_SCHEMA_NAME='USBGODA' OR PARSING_SCHEMA_NAME='T147282') ;
SELECT * FROM USBGODA.GDQERYHO WHERE PARSING_SCHEMA_NAME = 'USBGODA';
insert /*+ PARALLEL(GDQERYHO) */into USBGODA.GDQERYHO   select  /*+ PARALLEL(V$SQL) */ SYSDATE  as FX_INSERCCION_CAMPO, V$SQL.* from V$SQL;
CREATE TABLE USBGODA.GD_V$SQLAREA    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLAREA.*       FROM             V$SQLAREA          WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQLTEXT    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLTEXT.*       FROM             V$SQLTEXT          WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQL_PLAN   AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL_PLAN.*      FROM             V$SQL_PLAN         WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQL    	  AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL.*         	FROM             V$SQL        		WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQLTEXT    AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQLTEXT.*       FROM             V$SQLTEXT          WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQL_PLAN   AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL_PLAN.*      FROM             V$SQL_PLAN         WHERE             1 = 2         );
CREATE TABLE USBGODA.GD_V$SQL    	  AS         ( SELECT             SYSDATE AS FX_INSERCCION_CAMPO,             V$SQL.*         	FROM             V$SQL        		WHERE             1 = 2         );
INSERT /*+ PARALLEL(GD_V$SQL_20220127) */ 				INTO USBGODA.GD_V$SQL_20220127     		SELECT  /*+ PARALLEL(V$SQL) */        	SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL.*     	FROM         V$SQL;
INSERT /*+ PARALLEL(GD_V$SQL) */ 				INTO USBGODA.GD_V$SQL    		SELECT  /*+ PARALLEL(V$SQL) */        	SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL.*     	FROM         V$SQL;
INSERT /*+ PARALLEL(GD_V$SQL) */ 				INTO USBGODA.GD_V$SQL    		SELECT  /*+ PARALLEL(V$SQL) */        	SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL.*     	FROM         V$SQL;
INSERT /*+ PARALLEL(GD_V$SQL) */ 				INTO USBGODA.GD_V$SQL    		SELECT  /*+ PARALLEL(V$SQL) */        	SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL.*     	FROM         V$SQL;
INSERT /*+ PARALLEL(USBGODA.GD_V$SQLTEXT) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(V$SQLTEXT) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
DROP TABLE USBGODA.GD_V$SQLTEXT;
select CO_QUERY,
'create table '||LOWER(TABLE_NAME)||' as ('||REGEXP_REPLACE(SQLTEXT2,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA
 from
(SELECT ROWNUM as CO_QUERY,
OWNER||'.'||VIEW_NAME as "TABLE_NAME",
 REGEXP_REPLACE(LOWER(TO_CLOB(SQLTEXT)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') as SQLTEXT2

 from USBGODA.ALL_VIEWS) B;
Select * from USBGODA.GD_V$SQL;
select * from USBGODA.ALL_VIEWS;
Select * from USBGODA.GD_V$SQL;
Select * from LINAJE;
Select * from JMLILLO_PARSER_DATOS;
Select * from USBGODA.GD_V$SQL;
Select * from USBGODA.GD_V$SQL;
Select * from JMLILLO_PARSER_DATOS;
Select Max(FECHACORTA),MIN(FECHACORTA) from JMLILLO_PARSER_DATOS;
Select * from USBGODA.GD_V$SQL;
Select Max(FIRST_LOAD_TIME),MIN(FIRST_LOAD_TIME) from USBGODA.GD_V$SQL;
Select SQL_ID,  LOWER(TO_CLOB(SQL_FULLTEXT)) as CSQL_TEXT,
   REGEXP_REPLACE(CSQL_TEXT(CLOB(20000)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20000)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20000)) AS "SQL_TRATADO2",
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20000)),'VIEW','TABLE',1,0,'im')(CLOB(20000)) AS "TEXTO1",
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\s){1,})|((\s){1,})$','',1,0,'m')(CLOB(20000)) AS "TEXTO0"
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(TO_CLOB(SQL_FULLTEXT)) as T1,
  REGEXP_REPLACE(T1(CLOB(20000)),'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(TO_CLOB(SQL_FULLTEXT)) as T,
  REGEXP_REPLACE(T(CLOB(20000)),'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(TO_CLOB(SQL_FULLTEXT))  T,
  REGEXP_REPLACE(T(CLOB(20000)),'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(SQL_FULLTEXT(CLOB (20000)))  as T,
 -- REGEXP_REPLACE(T,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 -- REGEXP_REPLACE(T,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as SQLTRATADO1 ,
     --   REGEXP_REPLACE(SQL_TRATADO,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as SQLTRATADO1 ,
      REGEXP_REPLACE(SQL_TRATADO1,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as SQLTRATADO1 ,
      REGEXP_REPLACE(SQLTRATADO1,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQL_TRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as SQLTRATADO1 ,
      REGEXP_REPLACE(SQLTRATADO1,'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS SQLTRATADO2,
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
      REGEXP_REPLACE("SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2",
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
      REGEXP_REPLACE("SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2",
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL;
select B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
    --    REGEXP_REPLACE(SQL_TRATADO2,'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
 from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B;
select B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
     REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
 from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B;
select B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2",
     REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO,
 from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B;
select B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2",
     REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
 from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2",
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\\")|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(SQL_FULLTEXT),
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(SQL_FULLTEXT) as SQL_FULLTEXT,
 REGEXP_REPLACE(SQL_FULLTEXT,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  LOWER(SQL_FULLTEXT) as SQL_FULL_TEXT,
 REGEXP_REPLACE(SQL_FULL_TEXT,'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(LOWER(SQL_FULL_TEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.*,
      REGEXP_REPLACE("SQLTRATADO2",'^((\s){1,})|((\s){1,})$','',1,0,'m') AS TEXTO
FROM (
 select /*+ PARALLEL(8) */ B.*,
  REGEXP_REPLACE(B."SQLTRATADO1",'(\s){1,}|(\s){1,}$|$',' ',1,0,'m') AS "SQLTRATADO2"
   from (
 
  Select /*+ PARALLEL(8) */  SQL_ID,  
  SQL_FULLTEXT,
 REGEXP_REPLACE(LOWER(SQL_FULLTEXT),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/){1,}|(\"){1,}|(;)','',1,0,'m') as "SQLTRATADO1" ,
     
        FIRST_LOAD_TIME,
        LAST_LOAD_TIME,
        PARSING_SCHEMA_NAME
        from USBGODA.GD_V$SQL) B )C;
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",C.FIRST_LOAD_TIME(DATE) as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_DATE(C.FIRST_LOAD_TIME,"DD-MM-YYYY") as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_DATE(C.FIRST_LOAD_TIME,'DD-MM-YYYY') as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_CHAR(C.FIRST_LOAD_TIME,'DD-MM-YYYY') as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_DATE(C.FIRST_LOAD_TIME,'YYYY-MM-DD/00:00:00') as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_CHAR(C.FIRST_LOAD_TIME,'YYYY-MM-DD/24HH:MI:SS') as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_CHAR(C.FIRST_LOAD_TIME,'YYYY-MM-DD/HH24:MI:SS') as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
select /*+ PARALLEL(8) */ C.SQL_ID as "ID",TO_CHAR(C.FIRST_LOAD_TIME) as "DATE",C.PARSING_SCHEMA_NAME as OWNER, 
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
        from USBGODA.GD_V$SQL) B )C;
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
        from USBGODA.GD_V$SQL) B )C;
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
        from USBGODA.GD_V$SQL) B )C;
COMMIT;
select count(*) from JEG_SQLS_TRATADAS;
select count(*) from JEG_SQLS_TRATADAS;
select count(*) from USBGODA.GD_V$SQL;
DROP TABLE USBGODA.GDQERYTO;
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
INSERT INTO GDQERYTO 
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
COMMIT;
INSERT INTO GDQERYTO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL;
CREATE TABLE GDQERYIO
as SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
INSERT /*+ PARALLEL(8) */ INTO USBGODA.GD_V$SQL SELECT  /*+ PARALLEL(8) */ SYSDATE AS FX_INSERCCION_CAMPO,V$SQL.* FROM V$SQL;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLAREA     	SELECT  /*+ PARALLEL(8) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;
INSERT INTO GDQERYTO 
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
        from USBGODA.GD_V$SQL) B )C where SQL_ID not in (select SQL_ID from GDQERYIO);
commit;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT INTO  GDQERYIO
as SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT INTO  GDQERYIO
 SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO where SQL_ID not in (select SQL_ID from GDQERYIO);
commit;
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
INSERT INTO  GDQERYIO
 SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO where SQL_ID not in (select SQL_ID from GDQERYIO);
COMMIT;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);

INSERT INTO;
INSERT INTO GDQERYTO 
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
        from USBGODA.GD_V$SQL) B )C where SQL_ID not in (select SQL_ID from GDQERYIO);
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
        from USBGODA.GD_V$SQL) B )C;
CREATE TABLE USBGODA.GDSQLTTO as 
SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT where 1=2;
CREATE TABLE USBGODA.GDSQLTTO
SELECT  /*+ PARALLEL(8) */       
V$SQLTEXT.*     FROM         V$SQLTEXT where 1=2;
CREATE TABLE USBGODA.GDSQLTTO as (
SELECT  /*+ PARALLEL(8) */       *     FROM         V$SQLTEXT where 1=2);
CREATE TABLE USBGODA.GDSQLTTO as (
SELECT        *     FROM         V$SQLTEXT where 1=2);
CREATE TABLE USBGODA.GDSQLTTO as (
SELECT        *     FROM         V$SQLTEXT );
CREATE TABLE GDSQLTTO as (
SELECT        *     FROM         V$SQLTEXT );
CREATE TABLE GDSQLTTO as (
SELECT        *     FROM         GD_V$SQLTEXT );
CREATE TABLE GDSQLTTO as (
SELECT        GD_V$SQLTEXT .*     FROM         GD_V$SQLTEXT );
INSERT INTO GDSQLTTO 
SELECT        GD_V$SQLTEXT .*     FROM         GD_V$SQLTEXT ;
INSERT INTO GDSQLTTO 
SELECT * FROM GD_V$SQLTEXT ;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
DROP TABLE USBGODA.GD_V$SQL_20200613;
SELECT * FROM USBGODA.GD_V$SQLTEXT ;
SELECT * FROM USBGODA.GD_V$SQLTEXT ORDER BY FX_INTERSECCION_CAMPO, ADDRESS HASH_VALUE,SQL_ID_PIECE asc;
SELECT * FROM USBGODA.GD_V$SQLTEXT ORDER BY FX_INTERSECCION_CAMPO, ADDRESS, HASH_VALUE,SQL_ID_PIECE asc;
SELECT * FROM USBGODA.GD_V$SQLTEXT ORDER BY FX_INTERSECCION_CAMPO, ADDRESS, HASH_VALUE,SQL_ID ,PIECE asc;
SELECT * FROM USBGODA.GD_V$SQLTEXT ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
delete USBGODA.GD_V$SQLTEXT;
INSERT INTO USBGODA.GD_V$SQLTEXT 
SELECT * FROM USBGODA.GD_V$SQLTEXT ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
INSERT INTO USBGODA.GD_V$SQLTEXT 
SELECT * FROM USBGODA.GD_V$SQLTEXT_20220127 ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
INSERT INTO USBGODA.GD_V$SQLTEXT 
SELECT * FROM USBGODA.GD_V$SQLAREA_20200619 ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
INSERT INTO USBGODA.GD_V$SQLTEXT 
SELECT * FROM USBGODA.GD_V$SQLAREA_20200619 ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
INSERT INTO USBGODA.GD_V$SQLTEXT 
SELECT * FROM USBGODA.GD_V$SQLAREA_20200619 ORDER BY FX_INSERCCION_CAMPO desc, ADDRESS, HASH_VALUE , SQL_ID, PIECE asc;
SELECT * FROM USBGODA.GD_V$SQLAREA_20200619 ORDER BY desc FX_INSERCCION_CAMPO, ADDRESS, HASH_VALUE , desc SQL_ID, asc PIECE;
SELECT * FROM USBGODA.GD_V$SQLAREA_20200619 ORDER BY  FX_INSERCCION_CAMPO ,  SQL_ID,  PIECE;
SELECT * FROM USBGODA.GD_V$SQLAREA ORDER BY  FX_INSERCCION_CAMPO ,  SQL_ID,  PIECE;
SELECT * FROM SYS.GD_V$SQLAREA ORDER BY  FX_INSERCCION_CAMPO ,  SQL_ID,  PIECE;
SELECT * FROM SYS.GV_$SQLAREA where rownum <10000 ORDER BY  FX_INSERCCION_CAMPO desc ,  SQL_ID desc, PIECE asc;
SELECT * FROM SYS.GV_$SQLAREA;
INSERT INTO USBGODA.GD_V$SQLAREA 
SELECT * FROM SYS.GV_$SQLAREA 
ORDER BY  FIRST_LOAD_TIME desc ,  SQL_ID desc;
INSERT INTO USBGODA.GD_V$SQLAREA (
SELECT * FROM SYS.GV_$SQLAREA 
ORDER BY  FIRST_LOAD_TIME desc ,  SQL_ID desc);
INSERT INTO USBGODA.GD_V$SQLAREA (
SELECT * FROM SYS.GV_$SQLAREA );
INSERT INTO USBGODA.GD_V$SQLAREA 
SELECT * FROM SYS.GV_$SQLAREA;
select * from USBGODA.GD_V$SQLAREA;
SELECT * FROM SYS.GV_$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
INSERT /*+ PARALLEL(8) */ INTO USBGODA.GD_V$SQL SELECT  /*+ PARALLEL(8) */ SYSDATE AS FX_INSERCCION_CAMPO,V$SQL.* FROM V$SQL;
select * frokm  FROM V$SQL;
select * frokm  FROM V_$SQL;
select * frokm  FROM GV_$SQL;
select * from  FROM V_$SQL;
select * from  FROM V_$SQL where rownum <10000;
CREATE TABLE USBGODA."GD_V$SQL_20220216" (

);
CREATE TABLE USBGODA.GD_V$SQL_20220216 (

);
CREATE TABLE USBGODA.GD_V$SQL_20220216 as ( 
SELECT * FROM SYS.GV_$SQL where 2=1
);
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
                                FROM USBGODA.GD_V$SQL;
SELECT * FROM USBGODA.GD_V$SQL;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLTEXT    SELECT  /*+ PARALLEL(8) */       SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLTEXT.*     FROM         V$SQLTEXT;
INSERT /*+ PARALLEL(8) */ INTO USBGODA.GD_V$SQL SELECT  /*+ PARALLEL(8) */ SYSDATE AS FX_INSERCCION_CAMPO,V$SQL.* FROM V$SQL;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLAREA     	SELECT  /*+ PARALLEL(8) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLAREA     	SELECT  /*+ PARALLEL(8) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQLAREA     	SELECT  /*+ PARALLEL(8) */      SYSDATE AS FX_INSERCCION_CAMPO,         V$SQLAREA.*     FROM         V$SQLAREA;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
INSERT /*+ PARALLEL(8) */ 	INTO USBGODA.GD_V$SQL_PLAN     SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
commit;
SELECT  /*+ PARALLEL(8) */     SYSDATE AS FX_INSERCCION_CAMPO,         V$SQL_PLAN.*    FROM         V$SQL_PLAN;
drop table  USBGODA.GD_V$SQL_PLAN;
CREATE TABLE USBGODA.GD_V$SQL_PLAN  as SELECT  /*+ PARALLEL(8) */ * FROM         V$SQL_PLAN;
CREATE TABLE USBGODA.GD_V$SQL_PLAN  as SELECT  /*+ PARALLEL(8) */ * FROM         V$SQL_PLAN where 1=2;
CREATE TABLE USBGODA.GD_V$SQL_PLAN  as SELECT  /*+ PARALLEL(8) */ * FROM         V$SQL_PLAN where 1=2;
INSERT /*+ PARALLEL(8) */ 	USBGODA.GD_V$SQL_PLAN  SELECT  /*+ PARALLEL(8) */ * FROM         V$SQL_PLAN;
INSERT INTO /*+ PARALLEL(8) */ 	USBGODA.GD_V$SQL_PLAN  SELECT  /*+ PARALLEL(8) */ SYS.V$SQL_PLAN.* FROM         SYS.V$SQL_PLAN;
INSERT INTO /*+ PARALLEL(8) */ 	USBGODA.GD_V$SQL_PLAN  SELECT  /*+ PARALLEL(8) */ SYS.V$SQL_PLAN.* FROM         SYS.V$SQL_PLAN;
drop table  USBGODA.GD_V$SQL_PLAN;
purge;
CREATE TABLE /*+ PARALLEL(8) */ 	USBGODA.GD_V$SQL_PLAN AS SELECT  * FROM         SYS.V$SQL_PLAN;
SELECT  * FROM SYS.V$SQL_PLAN;
CREATE TABLE USBGODA.GD_V$SQL_PLAN SELECT  * FROM SYS.V_$SQL_PLAN;
SELECT  * FROM V_$SQL_PLAN;
SELECT  * FROM V_$SQL_PLAN;
SELECT  * FROM GV_$SQL_PLAN;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
DROP TABLE GDQERYHO;
    INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
DROP TABLE GDQERYHO;
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
CREATE TABLE  GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
CREATE TABLE  GDQERYHO as
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT /*+ PARALLEL(8) */ INTO USBGODA.GD_V$SQL SELECT  /*+ PARALLEL(8) */ V$SQL.* FROM V$SQL;
INSERT INTO /*+ PARALLEL(8) */ GDQERYHO select /*+ PARALLEL(8) */ * FROM GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT INTO /*+ PARALLEL(8) */ USBGODA.GDQERYHO select /*+ PARALLEL(8) */ USBGODA.GD_V$SQL.* FROM USBGODA.GD_V$SQL;
INSERT /*+ PARALLEL(8) */ INTO  USBGODA.GDQERYHO select /*+ PARALLEL(8) */ USBGODA.GD_V$SQL.* FROM USBGODA.GD_V$SQL where SQL_ID not in (select SQL_ID from GDQERYIO);
INSERT  INTO  USBGODA.GDQERYHO select USBGODA.GD_V$SQL.* FROM USBGODA.GD_V$SQL where SQL_ID not in (select SQL_ID from USBGODA.GDQERYIO);
INSERT  INTO  USBGODA.GDQERYHO select USBGODA.GD_V$SQL.* FROM USBGODA.GD_V$SQL where SQL_ID not in (select distinct SQL_ID from USBGODA.GDQERYIO);
select USBGODA.GD_V$SQL.* FROM USBGODA.GD_V$SQL where SQL_ID not in (select distinct SQL_ID from USBGODA.GDQERYIO);
select * FROM USBGODA.GD_V$SQL;
select * FROM USBGODA.GD_V$SQL;
select * FROM USBGODA.GD_V$SQL;
CREATE TABLE USBGODA.GD_SQL
as select * from SYS.GD_V$SQL where 1=2;
CREATE TABLE USBGODA.GV_SQL
as select * from SYS.GV_$SQL where 1=2;
select * from SYS.V_$SQL;
elect * from V_$SQL;
select * from DWGOBDP0.global_parser_fin sample 100;
