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
################################### CONFIGURAMOS PARAMETROS DE SESION TERADATA ######################################


teradatadia<- function (z){
  bar<-makeProgressBar(max=30)
  bar$inc(1)
  drvv <- JDBC("com.teradata.jdbc.TeraDriver","/Users/jorge/Library/RazorSQL/teradata/terajdbc4.jar")
  bar$inc(1)
  connn <- dbConnect(drvv,"jdbc:teradata://teradata.tsm.inet/dwgobdp0",'USBGODA','trgr0620')
  bar$inc(1)
  fx<-dbGetQuery(conn,paste0("select  (max(it_ini_consulta)(date))-",z," from dwgobdp0.god_parser_fin"))
  bar$inc(1)
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
  bar$inc(1)
 dbDisconnect(connn)
 bar$inc(1)
resultlist<- List(l,fx,resultado)
names(resultlist)<-c("dia","fecha","resultado")
  return(resultlist)
}

result<-teradatadia(0)
  
 #drvexa <- JDBC("oracle.jdbc.driver.OracleDriver","/Users/jorge/instantclient/ojdbc8.jar:/Users/jorge/instantclient/orai18n.jar")
  #connexa <- dbConnect(drvexa, "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol033.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol034.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol035.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol036.tesa)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=PT2BI0_DIRECTO_ODS)))",user="USBGODA", password="oragodatemp1",database="dwgobdp0")

 # options(internet.info = 0)
  
  #http_proxy=http://t151024:password@IP_proxy:puerto_proxy/

  #outputPar<-vector()
 # parallel::clusterExport(cl,varlist=c("drvtera","queryteradata"),envir = .GlobalEnv)
  #parallel::clusterApplyLB(cl, 1:2, function(y) { #Con balance de carga clusterApplyLB
   for(l in 1:10){
    #  outputPar <- foreach(l = 1:10, .packages=c("RJDBC","DBI","rJava","foreach","stringr","BBmisc","data.table"))%dopar%{
        #Connecting to database through RODBC
        bar$inc(1)
        print(l)
       # assign(paste0("drv",l),drvx())
        #con<-connx(paste0("drv",l))
        #assign(paste0("conn",l),con)
        
        
        result<-teradatadia(l)
        bar$inc(1)
        teradatadia[[ll]]<-teradia_1
        assign(paste0("teradia_",l),result)
        teradatosunidos<-rbind(teradatos,result)
        teradatos<-teradatosunidos
        bar$inc(1)
        
      }
#    )
    
    
 # teradia<- dbGetQuery(conn,consulta)
 # assign(nombre, teradia)
#  y<-y+1
  
 #   })

  
