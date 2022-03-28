.GlobalEnv
is.environment(.GlobalEnv)

############################################# LIBRERIAS Y PARAMETROS ################################################
options(java.parameters = "-Xmx3072M")

library(data.table)
library(bit64)
library(stringr)
#library(RTeradata)
library(rJava)
library(DBI)
library(RJDBC)
library(dplyr)
library(teradatasql)
library(dplyr.teradata)
#library(tdplyr)
library(parallel)
library(foreach)
library(BBmisc)
library(BatchJobs)
library(batchtools)
library(rstudioapi)
library(callr)
library(processx)
library(tidyverse)

################################### CONFIGURAMOS PARAMETROS DE SESION TERADATA ######################################

#job::job({system(source(paste0(rutascripts,"/jobs/job_tablas_tera.R")), wait=FALSE)},import="all",title=paste0("job_",l))
#job::job({job::export("changed", file = paste0("/Users/jorge/Documents/R/Linaje/scripts/jobs/job_tablas_tera.R"))},import=c(l,teradatatablasdia,teradatos),title=paste0("job_",l))
#jobRunScript(path = paste0(rutascripts,"/jobs/job_tablas_tera.R"),name = paste0("job_",l),encoding = "unknown",workingDir = default,importEnv = TRUE,exportEnv = "")
# CONEXIONES ----
x_arbol<- function(n,w,c)
{
  if(w == 1){return( paste0(c,n)) }
  if(w == 2){return( paste0(c,n,"$get_result()")) }
}
  
source(paste0(rutascripts,"/parseador.R"))
source(paste0(rutaconexiones,"/conexiones.R"))

SQLVISTAS<-"select B.CO_QUERY,\
'create table '||LOWER(B.TABLE_NAME)||' as ('||REGEXP_REPLACE(B.SQLTEXT2,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA from \
(SELECT ROWNUM as CO_QUERY,\
OWNER||'.'||VIEW_NAME as TABLE_NAME,\
 REGEXP_REPLACE(LOWER(TO_CLOB(SQLTEXT)),'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') as SQLTEXT2 \
from USBGODA.ALL_VIEWS) B"
  source(paste0(rutassqls,"/Vistas Exadata.sql"))
 
   vistas<-r_bg(function (){
                                 library("DBI")
                                 library("rJava")
                                 library("RJDBC")
                                # CONEXIONES ----
                                ctera <-conexion_teradata()
                                

                                 # DATOS ----
                                restera<-DBI::dbGetQuery(
                                       ctera,
                                       "SELECT RANK(T1.VIEWNAME) AS ID,
     CAST(T1.\"TEXTO0\" AS VARCHAR(20000)) AS TEXTO,
                                       T1.OWNER,
                                       T1.\"DATABASE\",
     T1.\"TABLE\",
     T1.VIEWNAME
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS VIEWNAME,
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS SQL_TRATADO,
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS SQL_TRATADO2,
        REGEXP_REPLACE(SQL_TRATADO2(CLOB(20K)),'VIEW','TABLE',1,0,'im')(CLOB(20K)) AS TEXTO1,
        REGEXP_REPLACE(TEXTO1(CLOB(20000)),'^((\\s){1,})|((\\s){1,})$','',1,0,'m')(CLOB(20000)) AS \"TEXTO0\",
        UPPER(TRIM(CreatorName)) as OWNER,
        UPPER(TRIM(DatabaseName))as \"DATABASE\",
        UPPER(TRIM(TableName))as \"TABLE\"
        FROM dbc.tables
        WHERE tablekind='V'
        AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1 
      where TEXTO <> ''                                  "
                                       )
                                 # DESCONECTAR ----              
                                DBI::dbDisconnect(ctera)
                       ;res},
                       package = TRUE);
   processx::poll(list(vistas),ms=-1);

# SELECT DE LA TABLA ----              
   
queryownerteravista<-restera %>% select(ID,OWNER)
querysqlteravista<- restera %>% select(ID,TEXTO) 


# PARSER ----              

   resultteravista<- parseador(querysqlteravista)

rp$wait

assign(x_arbol(l,1,"rp"),rp$get_result());
res0<-rp0$get_result()
res1<-rp1$get_result()
res2<-rp2$get_result()
res3<-rp3$get_result()
res4<-rp4$get_result()
res5<-rp5$get_result()
res6<-rp6$get_result()
res7<-rp7$get_result()
res8<-rp8$get_result()
res9<-rp9$get_result()
res10<-rp10$get_result()


for(l in lx){
assign(x_arbol(lx,1,"res"),x_arbol(lx,2,"rp"));
}

res0$wait
res6$wait


processx::poll(list(rp0,rp1,rp2,rp3,rp4,rp5),ms=-1)
processx::poll(list(rp6,rp7,rp8,rp9,rp10),ms=-1)

execute<-paste0("assign(paste0('rp',",l,"),res",l,"$get_result());");

execute;


rm(resultado)




teradatatablasdia<-list(c(valor,resultado))

dbDisconnect(connn)

return(teradatatablasdia)
