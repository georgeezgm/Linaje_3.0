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

SQLVISTAS<-"select B.CO_QUERY,\
'create table '||LOWER(B.TABLE_NAME)||' as ('||REGEXP_REPLACE(B.SQLTEXT2,'((--)(.*?)$)|(/\\*(.*)[^\\*/]\\*/)|(\")|(;)','',1,0,'m')||');' AS SQLVISTA from \
(SELECT ROWNUM as CO_QUERY,\
OWNER||'.'||VIEW_NAME as TABLE_NAME,\
 REGEXP_REPLACE(LOWER(TO_CLOB(SQLTEXT)),'(\\s){1,}|(\\s){1,}$|$',' ',1,0,'m') as SQLTEXT2 \
from USBGODA.ALL_VIEWS) B"
  source(paste0(rutassqls,"/Vistas Exadata.sql"))
source(paste0(rutasconnexiones,"/connexiones.R"))

   vistas<-r_bg(function (){
                                 library("DBI")
                                 library("rJava")
                                 library("RJDBC")
                                # CONEXIONES ----
                                Cexa <- connexion_exadata()

                                 # DATOS ----
                                restablasexa<-DBI::dbGetQuery(
                                       Cexa,
                                       "select /*+ PARALLEL(8) */ * from  USBGODA.GDQERYTO"
                                       
                                       )
                                 # DESCONECTAR ----              
                                DBI::dbDisconnect(Cexa)
                       ;restablasexa},
                       package = TRUE);
   processx::poll(list(vistas),ms=-1);
queryownerexa<-restablasexa %>% select(ID,OWNER)
querysqlexa<- restablasexa %>% select(ID,TEXTO)



 
   resultexa<- parseador(querysqlexa)
   
   DBI::dbCreateTable(
     drvexa,"USBGODA.GDQERYSO",resultexa);
     
   #  "select /*+ PARALLEL(8) */ * from  USBGODA.GDQERYTO"
     
  # )

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
