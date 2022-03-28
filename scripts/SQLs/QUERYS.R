



SQLVISTASEXADATA<-"select B.CO_QUERY,LOWER(OWNER) as OWNER,LOWER(VIEW_NAME) as VIEW_NAME,
'create table '||LOWER(B.TABLE_NAME)||' as ('||REGEXP_REPLACE(B.SQLTEXT2,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA from 
(SELECT ROWNUM as CO_QUERY,OWNER,VIEW_NAME,
OWNER||'.'||VIEW_NAME as TABLE_NAME,
 REGEXP_REPLACE(LOWER(TO_CLOB(SQLTEXT)),'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') as SQLTEXT2 
from USBGODA.ALL_VIEWS) B" 
