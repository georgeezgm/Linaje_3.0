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
INSERT INTO GDQERYHO 
select /*+ PARALLEL(8) */ * FROM GD_V$SQL;

CREATE TABLE GDQERYIO
INSERT INTO GDQERYIO
 SELECT /*+ PARALLEL(8) */ SQL_ID from GDQERYHO

select count(*) from USBGODA.GD_V$SQL

CREATE TABLE USBGODA.GDQERYSO
(ID_PARSER VARCHAR2(22) NOT NULL,
TABLE_NAME VARCHAR2(50) NOT NULL,
TIPO_CONSULTA VARCHAR2(15) NOT NULL,
VISTA VARCHAR2(15),
ORDEN NUMBER(2) NOT NULL)


'insert into tetrzatt (no_proceso,fx_actual,fx_tabla,id_sesion,it_traza,ds_traza,ds_sqltext) values (:vproceso,:vfechaactual,:vfechatabla,sys_context(''userenv'',''sessionid''),systimestamp,:vtraza,:vsentencia)' vsentencia:='' vtraza:='inicio proceso' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit begin vtraza:='inicio del borrado de las trazas' vsqlcode := 0 vsentencia:='' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit vsentencia:='delete from tetrzatt where no_proceso='''||vproceso||''' and trunc(it_traza) < sysdate - '||to_char(vdiasborrado)||'' execute immediate vsentencia vtraza:='fin del borrado de las trazas' vsqlcode := 0 dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit exception when others then vsqlcode := sqlcode vtraza:='error: '||vsqlcode||'-'||sqlerrm dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit raise_application_error(-20099, sqlerrm) end vtablaorigen :='umd_parcom1.proda_product_char_value' vtabladiaria :='tepccvao' vtablafoto :='carga'||vfechatabla||vtabladiaria begin vtraza:='comprobando tabla origen: '||vtablaorigen vsqlcode := 0 vsentencia:='' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit vsentencia:='select 1 from '||vtablaorigen||' where rownum <2' execute immediate vsentencia into vsqlcount exception when no_data_found then vsqlcode := sqlcode vtraza:='error: la tabla de entrada esta vacia :'||vtablaorigen dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit raise_application_error(-20099, sqlerrm) when others then vsqlcode := sqlcode vtraza:='error: '||vsqlcode||'-'||sqlerrm dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit raise_application_error(-20099, sqlerrm) end begin vtraza:='borrando tabla foto: '||vtablafoto vsqlcode := 0 vsentencia:='' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit vsentencia:='drop table '||vtablafoto||' purge' execute immediate vsentencia exception when others then vsqlcode := sqlcode if vsqlcode != -942 and vsqlcode != 0 then vtraza:='error: '||vsqlcode||'-'||sqlerrm dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit raise_application_error(-20000, sqlerrm) end if end begin vtraza:='creando tabla foto: '||vtablafoto vsqlcode := 0 vsentencia:='' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit vsentencia:='create table '||vtablafoto||' nologging compress for query high tablespace '||vtbs||' pctfree 0 as select '||vparallel||' a.*, sysdate it_carga, to_date('''||vfechatabla||''',''yyyymmdd'')it_dia from '||vtablaorigen||' a ' execute immediate vsentencia dbms_stats.gather_table_stats (user, vtablafoto, degree => 6) exception when others then vsqlcode := sqlcode vtraza:='error: '||vsqlcode||'-'||sqlerrm dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit raise_application_error(-20001, sqlerrm) end vtraza:='fin proceso ok' vsentencia:='' dbms_output.put_line( to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') ||' : ' ||vtraza) execute immediate vauditoria using vproceso, vfechaactual, vfechatabla, vtraza, vsentencia commit end