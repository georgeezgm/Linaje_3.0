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
library(rlang)

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
source(paste0(rutaconexiones,"/conexiones.R"))
source(file,local=FALSE)
rm(l)
rm(lx)
rm(list = ls()[grep("rp", ls())])
rm(list = ls()[grep("res", ls())])
rm(list = ls()[grep("ctera", ls())])
rm(C)
rm(V)

rm(f)
rm(connn)
rm(drvvv)
rm(V)
rm(bar)
rm(callr_teradata)
dias_descarga_teradata<-10
lx<-c(0:1)

pollproces<- function(e){
  for(h in e){
    if(h==0) {g<-"rp0"}
    if(h!=0) {
      o<-paste0(",rp",h)
      g<-paste0(g,o)
    }}
  assign("dev",paste0("processx::poll(list(",g,"),ms=-1)"))
   return( dev)
}
exec(pollproces(lx),envir=.GlobalEnv,recursive = TRUE)
eval(pollproces(lx))
run(pollfunc)
extractFunction(pollfunc),envir=.GlobalEnv,recursive = TRUE)
get(pollfunc,envir=.GlobalEnv)

is.function(pollfunc)
 for(l in lx){
      print(paste0("Descargamos el dia ",l))

   
   
   assign(x_arbol(l,1,"rp"),r_bg(function (V){

     ruta<-"/Users/jorge/Documents/R/Linaje/scripts/jdbc/terajdbc4.jar"
                              library("DBI")
                               library("rJava")
                               library("RJDBC")
                                # CONEXIONES ----
                                drvvv<-JDBC("com.teradata.jdbc.TeraDriver",ruta)
                                C  <- dbConnect(drvvv,"jdbc:teradata://teradata.tsm.inet/dwgobdp0",'USBGODA','trgr0620')

                                # FECHA MAXIMA ----                                                                              
                                 f<-DBI::dbGetQuery(C,paste0("select  (max(it_ini_consulta)(date))-",V," as fx_maxima from dwgobdp0.god_parser_fin"))
                                 # DATOS ----
                                res<-DBI::dbGetQuery(
                                       C,
                                       paste0("SELECT distinct  '",f,"'(date) as fecha_query,
                                              trim(cast(co_query_amp as varchar(22))) as co_query,
                                              trim(tabla) as tabla,
                                              trim(tipo) as tipo,
                                              trim(tabla_vista) as tabla_vista,
                                              trim(cast(orden as varchar(3))) as orden
                                              FROM dwgobdp0.god_parser_fin
                                              where it_ini_consulta(date) = ('",f,"'(date))
                                              order by co_query asc, orden  asc "
                                       ))
                                print(paste0("Descarga ", l, " finalizada" ))
                                 # DESCONECTAR ----              
                                DBI::dbDisconnect(C)
                       ;res},
                       args=list(V=l),
                       package = TRUE));
         

   
   
           
        
 }
processx::poll(list(rp0,rp1),ms=-1)

processx::poll(list(rp0,rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10),ms=-1)

assign("descarga",pollfunc)
pollfunc
call"(str2lang(pollfunc))"

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



  get(lx)
  do.call(rp)
  for(h in lx){
    func<-paste0("res",h,"$get_result()")
  assign(paste0("rp",h),exec(func))
  }
  
  
processx::poll(list(rp0,rp1,rp2,rp3,rp4,rp5),ms=-1)
processx::poll(list(rp10),ms=-1)

execute<-paste0("assign(paste0('rp',",l,"),res",l,"$get_result());");

execute;


rm(resultado)




teradatatablasdia<-list(c(valor,resultado))

dbDisconnect(connn)

return(teradatatablasdia)
