
##Version  6; Miercoles 19 de Agosto del 2020 a --- Presente

#Voy a incluir el tratamiento de las vistas de Teradata como si fueran tablas en el proceso de Parser para que entren tanto en el 
#Grafo como en las descargs de información de Tablas para Estructurales. A petición de Javier Alvarez.

#Llamada a un Script a parte con la carga de la tabla que en principio debería ser relativamente constante. SQL a ejecutar en teradata en la carpeta SCRIPTS


.GlobalEnv 
is.environment(.GlobalEnv)



######################################## EJEMPLO DE CADENA DE LANZAMIENTO ###########################################

# Rscript lanzador_parseador_puntual.R 8 1 ej_cons_parseo.txt ej_cons_parseo_salida.txt
# 8: numero de procesoso en paralelo
# 1: tipo de fichero (windows, unix, RDS)
# ej_cons_parseo.txt: fichero con los datos aparsear con campos co_query, ds_query
# ej_cons_parseo_salida.txt: dichero de salida devuelve co_query_amp, tabla, tipo, tabla/vista, orden

############################################# LIBRERIAS Y PARAMETROS ################################################
if (!is.element("easypackages", installed.packages()[,1]))
  install.packages("easypackages")
if (!is.element("remotes", installed.packages()[,1]))
  install.packages("remotes")
library("easypackages")
library("remotes")
install_packages(c("data.table","stringr","dplyr","ggplot2movies","DBI","bit64"))
libraries(c("data.table","stringr","dplyr","ggplot2movies","DBI","bit64"))
# if (!is.element("data.table", installed.packages()[,1]))
#   install.packages("data.table", type = "source",repos = "https://Rdatatable.gitlab.io/data.table")
# if (!is.element("stringr", installed.packages()[,1]))
#   install.packages("bit64")
# if (!is.element("dplyr", installed.packages()[,1]))
#   install.packages("dplyr")
# if (!is.element("ggplot2movies", installed.packages()[,1]))
#   install.packages("ggplot2movies")
# if (!is.element("DBI", installed.packages()[,1]))
#   install.packages("DBI")
#if (!is.element("ROracle", installed.packages()[,1]))
#install.packages('~/R/ROracle_1.3-1.tar.gz', repos=NULL,dependencies=TRUE,type="source", configure.args='--with-oci-lib=/usr/local/lib/oracle')

#install.packages("data.table")
#install.packages("stringr")
#install.packages("dplyr")

# library(data.table)
# library(stringr)
# library(dplyr)
# library(bit64)
# #(ROracle)
# library(stringi)
################################### LEEMOS ARGUMENTOS DE LANZAMIENTO EN CONSOLA #####################################
ruta<- "/Users/jorge/Documents/R/parseador"
setwd(ruta)
rutaficheros<- paste0(ruta,"/ficheros/")
rutadatosentrada<- paste0(ruta,"/DATOS/Entrada")
rutadatosalida<- paste0(ruta,"/DATOS/salida")

#args <- commandArgs()
args<- c("/Library/Frameworks/R.framework/Resources/bin/exec/R","--no-echo","--no-restore","--file=lanzador_parseador_puntual_v7_1.R","--args","5", "2", paste0(rutadatosentrada,"/VistasTeradata2021_11_23.csv") ,paste0(rutadatosalida,"/VistasTeradata2021_11_23.out"))
print(args)
asc <- function(x) { strtoi(charToRaw(x),16L) }
chr <- function(n) { rawToChar(as.raw(n)) }
################################### EJEMPLO CONSULTA EXTRACCION DE QUERYS PARA PARSEAR ##############################
##### Cuidado con el caracter de separacion, ha que buscar uno que no este dentro de las consultas, por defecto ~

# select co_query, ds_query
# from dwtbjop0.dwqerytt
# where cast(it_ini_consulta as timestamp) = cast('20/05/2020' as date format 'dd/mm/yyyy')
# and ds_query not like '%~%'
# and ds_query not like  '%' || x'0A' || '%'

########################### LEEMOS EL FICHERO INTRODUCIDO EN LA LLAMADA DESDE EL SISTEMA ############################

print(paste0('Paso1: leemos el fichero de datos de tipo ',args[7]))
# Damos tres opciones de lectura dependiendo del tipo del fichero y origen Windows/Linux
# Lo ideas es la lectura de RDS (3), lectura de fichero unix (2) y el peor la transformacion CUIDADO se podrian perder registros

# Origen fichero unix
if (args[7]==1){system(paste0("tr -d '\15\32' < ",args[8], " > god_unixfilewin.txt"))
                datos_q_log<- fread('god_unixfilewin.txt',sep =';',strip.white=TRUE, encoding='Latin-1',colClasses=list(character=1:5),showProgress='TRUE')}
# Origen fichero unix
#if (args[7]==2){datos_q_log<- fread(args[8], sep =';', quote='\"', header=TRUE, fill=TRUE, showProgress=TRUE, strip.white=TRUE, encoding='UTF-8', colClasses=list(character=1:2),verbose=TRUE)}

if (args[7]==2){datos_q_log<- fread(args[8], sep =';', quote='\"', header=TRUE, fill=TRUE, strip.white=TRUE, encoding='UTF-8',verbose = TRUE)}
# Origen fichero RDS
if (args[7]==3){datos_q_log<- readRDS(args[8])}

# Para guardar el fichero en RDS hay que emplear el comando, con version=2
# saveRDS(objeto_R,'ruta y nombre archivo destino.RDS', version=2)

################################### INICIALIZAMOS LOS PARAMMETROS DEL SCRIPT ########################################

print(paste0("Paso 0: se van a levantar ",args[6]," hilos"))  
n_proc_par<- as.numeric(args[6])
fecha<- Sys.time()
print(fecha)
var_dia<- paste0('_',gsub(':','',gsub('-','',gsub(' ','_',fecha))))

########################### PARAMETROS DE CONFIGURACION DE LA PARALELIZACION DIARIA #################################
  
n_reg_bloques <- ceiling(dim(datos_q_log)[1]/n_proc_par)
print(paste0("Paso2: generamos ",n_proc_par," procesos paralelos con ",n_reg_bloques,' registos pro bloque'))
  
############################### ELIMINAMOS FICHEROS DE SALIDA OTRAS EJECUCIONES #####################################
setwd(rutaficheros)
files_ejec_ant<- list.files(getwd(),'.tmp')
lapply(files_ejec_ant,file.remove)
  
####################################### DIVIDIMOS EL FICHERO EN BLOQUES DE N REG ####################################
  
n_bloques<- ceiling(dim(datos_q_log)[1]/n_reg_bloques)
reg_ini<- 0
for (i in 1:n_bloques){
    reg_ini<- reg_ini+1
    reg_fin<- reg_ini+(n_reg_bloques-1)
    print(paste('Registros_seleccionados: ',reg_ini,' - ',reg_fin))
    fwrite(datos_q_log[reg_ini:reg_fin,],paste0(c('god_datos_q_log_f',i,var_dia,'.tmp'), collapse = ''),sep =';')
    reg_ini<- reg_fin
}
  
print(paste0("Paso3: creamos ",n_proc_par," archivos temporales con los datos"))

############################################### LANZAMOS EL PROCESO #################################################
  
proc_lanzados<-1
proc_terminados<-0
  
while (proc_lanzados<=n_bloques) {
    
############################### MONTAMOS EL ARCHIVO PARA LANZAR EL RSCRIPT DESDE EL SISTEMA ##,#######################
  l0<-' #remove.packages("data.table")

 
 #install.packages("data.table", type="source", repos="https://Rdatatable.gitlab.io/data.table") ## installs from source, which requires Rtools; use this for older versions of R
  library(data.table)
       # install.packages("stringr",type="both",repos="https://cloud.r-project.org")
        library("stringr") '
     
   # l1.1<- paste0("library(","\"","data.table","\")")
    l2<- paste0("source('",ruta,"/parseador.R')")
    l3<- paste0("datos_q_log_file<- fread('god_datos_q_log_f",proc_lanzados,var_dia,'.tmp',"',sep =';',strip.white=TRUE, encoding='Latin-1',colClasses=list(character=1:5))")
    l4<- "result<- parseador(datos_q_log_file)"
    l5<- paste0("fwrite(result,'god_result_f",proc_lanzados,var_dia,'.tmp',"',sep =';')")
    l6<- 'quit(save = "no")'
    
    fileConn<-file(paste0(c('god_ejecucion_f',proc_lanzados,var_dia,'.R'), collapse=''))
    writeLines(c(l0,l2,l3,l4,l5,l6), fileConn)
    close(fileConn)
    print(paste0("Paso4: creamos ",n_proc_par," archivos temporales de ejecucion R"))
    
####################################### CONDICION DE RETENCION DEL PROCESO ##########################################
    
    while (!(proc_lanzados-proc_terminados)<=n_proc_par){
      Sys.sleep(30)
      proc_terminados<- length(list.files(pattern=paste0(c('^god_result_f.*',var_dia), collapse = '')))
    }
    
####################################### LANZAMOS EL RSCRIPT DESDE EL SISTEMA ########################################
    
    system(paste0(c("nohup Rscript god_ejecucion_f",proc_lanzados,var_dia,".R &"), collapse=''), ignore.stdout=F, ignore.stderr=T, wait=FALSE)
    
    proc_lanzados<- proc_lanzados+1
}

print("Paso5: Esperamos hasta que todos los hilos hayan terminado")
  
################################ RETENEMOS HASTA QUE TERMINAN TODOS LOS PROCESOS ####################################
  
while (proc_terminados<(proc_lanzados-1)){
    Sys.sleep(60)
    proc_terminados<- length(list.files(pattern=paste0(c('^god_result_f.*',var_dia), collapse = '')))
}

print("Paso6: Proceso finalizado y unimos los resultados en un solo fichero")

############################## UNIMOS TODOS LOS FICHEROS PARA MONTAR UNA SALIDA UNICA ###############################

ficheros_result<- list.files(pattern=paste0(c('^god_result_f.*',var_dia), collapse = ''))
salida_fin<- rbindlist(lapply(ficheros_result, function (x) fread(x,sep =';',strip.white=TRUE, encoding='Latin-1', 
                                                                    colClasses=list(character=1:4))))
datos_q_log_bck<-datos_q_log
#datos_q_log_1<-select(datos_q_log,c(CO_QUERY,paste0(CO_QUERYUSERNAME,))
datos_q_log_cross<-datos_q_log %>% select("CO_QUERY","USERNAME")
datos_q_log_cross$CO_QUERY<-as.character("CO_QUERY")
salida_fin_cross <- salida_fin %>% select("V1")
names(salida_fin_cross)=c('V6')

salida_fin_cross$V6=integer64(str_sub(salida_fin_cross$V6,1,18))
salida_completa<- cbind(salida_fin,salida_fin_cross)

salida_conUSER<- salida_completa %>% left_join(datos_q_log_cross, by= c( "V6"="CO_QUERY")) 

############################## ELIMINAMOS FICHEROS DE SALIDA PRESENTE EJECUCION #####################################
#TodoExa<-left_join(datos_R,CruceExa, by=c(datos_R$QUERY=CruceExa$SCN))
#files_ejec_ant<- list.files(getwd(),'god_.*')
#lapply(files_ejec_ant,file.remove)
#print("Paso7: Eliminamos los ficheros de la ejecucion")

################################### GUARDAMOS EL RESULTADO EN UN FICHERO CSV ########################################
#write.table(unique(Salida_fin_buena), file=args[9], sep='~',quote=TRUE,qmethod = "double")
#
fwrite(unique(salida_fin), file=args[9], sep=';',quote=TRUE,append=FALSE)
setwd(ruta)

salida_fin_buena<-salida_fin
salida_fin_buena$V2=ifelse(str_sub(salida_fin_buena$V2,9,9)==".",salida_fin_buena$V2,paste0("dwturmp0",".",salida_fin_buena$V2))
  
#  salida_fin_buena<- c(salida_fin$V1,ifelse(str_sub(salida_fin$V2,9,9)==".",salida_fin$V2,paste0("dwturmp0",".",salida_fin$V2)),salida_fin$V3,salida_fin$V4,salida_fin$V5)
write.csv2(salida_fin, file=args[9], sep=";", qmethod="double", row.names=FALSE, col.names=TRUE)

names(salida_fin_buena)=c("co_query","tabla","ddl","tipo_tabla","ordem")
print(paste0("Paso8: grabamos el fichero de salida: ",./DATOS/Salida/teradataDWTURMP0_v2.out))

############################################ CERRAMOS LA SESION DE R #################################################
#
#quit("no")



