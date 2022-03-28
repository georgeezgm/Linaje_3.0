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
#library(parallel)
#library(foreach)
library(BBmisc)
library(BatchJobs)
library(batchtools)
library(rstudioapi)
print(paste0("Descargando datos día ",l))
###CONEXIONES
drvexa <- JDBC("oracle.jdbc.driver.OracleDriver","/Users/jorge/instantclient/ojdbc8.jar:/Users/jorge/instantclient/orai18n.jar")
connexa <- dbConnect(drvexa, "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol033.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol034.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol035.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol036.tesa)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=PT2BI0_DIRECTO_ODS)))",user="USBGODA", password="oragodatemp1",database="dwgobdp0")
###FECHA MAXIMA
fx<-dbGetQuery(connexa,paste0("select  (max(it_ini_consulta)(date))-",l," from dwgobdp0.god_parser_fin"))
###DATOS
resultado<-dbGetQuery(
connn,
paste0("SELECT distinct '",fx,"'(date) as fecha_query,
trim(cast(co_query_amp as varchar(22))) as co_query,
trim(tabla) as tabla,
trim(tipo) as tipo,
trim(tabla_vista) as tabla_vista,
trim(cast(orden as varchar(3))) as orden
FROM dwgobdp0.god_parser_fin
where it_ini_consulta(date) = '",fx,"'(date)
order by co_query asc, orden  asc "
))
##GUARDAR RESULTADOS LISTA
if(l==0){
teradatatablasdia<-list(c(valor=l,resultado))
}
if(l>0){
  listateradatatabladia<-list(c(valor=l,resultado))
  teradatatablasdia<-c(teradatatablasdia,listateradatatabladia,recursive=TRUE)
}
###GUARDAR RESULTADO POR SEPARADO
assign(paste0("teradia_",l),resultado)

#### MEZCLAR DATOS

if(l==0){
  teradatos<-resultados
}
if(l>0){
  
  
  teradatosunidos<-rbind(teradatos,resultados)
  teradatos<-teradatosunidos
  
}
  

