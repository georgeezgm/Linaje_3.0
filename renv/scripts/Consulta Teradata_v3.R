.GlobalEnv
is.environment(.GlobalEnv)

############################################# LIBRERIAS Y PARAMETROS ################################################
options(java.parameters = "-Xmx3072M")

library("data.table")
library(bit64)
library("stringi")
library("stringr")

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
library("DBI")
library("rJava")
library("RJDBC")
################################### CONFIGURAMOS PARAMETROS DE SESION TERADATA ######################################

#job::job({system(source(paste0(rutascripts,"/jobs/job_tablas_tera.R")), wait=FALSE)},import="all",title=paste0("job_",l))
#job::job({job::export("changed", file = paste0("/Users/jorge/Documents/R/Linaje/scripts/jobs/job_tablas_tera.R"))},import=c(l,teradatatablasdia,teradatos),title=paste0("job_",l))
#jobRunScript(path = paste0(rutascripts,"/jobs/job_tablas_tera.R"),name = paste0("job_",l),encoding = "unknown",workingDir = default,importEnv = TRUE,exportEnv = "")
# CONEXIONES ----
x_arbol<- function(w,c,n)
{
  if(w == 1){return( paste0(c,n)) }
  if(w == 2){return( paste0(c,n,"$get_result()")) }
}
source("/Users/jorge/Documents/R/Linaje/scripts/rutas_de_trabajo.R")
source(paste0(rutaconexiones,"/conexiones.R"))
source(file,local=FALSE)
rm(l)
rm(lx)
rm(list = ls()[grep("rp", ls())])
rm(list = ls()[grep("res", ls())])
rm(list = ls()[grep("ctera", ls())])

rm(connn)
rm(drvv)
rm(V)
rm(bar)
rm(callr_teradata)
dias_descarga_teradata<-20
lx<-c(0:dias_descarga_teradata)

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
#exec(pollproces(lx),envir=.GlobalEnv,recursive = TRUE)
#eval(pollproces(lx))
#run(pollfunc)
#extractFunction(pollfunc),envir=.GlobalEnv,recursive = TRUE)
#get(pollfunc,envir=.GlobalEnv)

#is.function(pollfunc)
 for(l in lx){
      print(paste0("Número:",l))

   
   
 #  assign(x_arbol(l,1,"rp"),r_bg(function (V,ruta){
 #    l<-9
   V<-l
   ruta<-rutajdbc
                      
                                # CONEXIONES ----
                                

                                # FECHA MAXIMA ----                                                                              
                                 res<-TABLA2(l)
                                assign(x_arbol(1,"rp",l),res)
                                if(l==0){
                                  print(paste0("cargando nivel ",l))
                                rp<-res
                                  print(paste0("cargado nivel ",l))
                                  }
                                if(l>0){
                                  rpsuma<-rp
                                  rp<-rbind(rpsuma,res)
                                }
                                
                               # nd(rp,rpsuma)
    print(paste0("cargado nivel ",l))
    }
processx::poll(list(rp0,rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10),ms=-1)



rblind

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
  
  rp<-rbind(rp0,rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10)
  res<-rp
processx::poll(list(rp0,rp1,rp2,rp3,rp4,rp5),ms=-1)
processx::poll(list(rp10),ms=-1)

execute<-paste0("assign(paste0('rp',",l,"),res",l,"$get_result());");

execute;


rm(resultado)




teradatatablasdia<-list(c(valor,resultado))

dbDisconnect(connn)

return(teradatatablasdia)
