### DEFINICION DE VARIABLES ###

.GlobalEnv
is.environment(.GlobalEnv)


## TABLAS ##
tablasprocesar <- read.table(file = paste0(rutadatos,"/sistema/TablasProcesar.txt"),header=TRUE,sep = ";",quote="")
variables <- read.table(file = paste0(rutadatos,"/sistema/variables.txt"),header=TRUE,sep = "\t",quote="\'")
grupo_tablas_analisis<-str_to_lower(tablasprocesar$TABLA )
cadena_tablas<-variables['patron_tablas',]
cadena_tablas_finales<-variables['patron_tablas_finales',]
cadena_tablas_borrar<-variables['patron_tablas_borrar',]


## REFRESCAR DATOS DEL FICHERO Y REALIZAR CRUCES? ##    
#CARGAR VISTAS

cargar_vistas<- if_else(variables['quieres_cargar_vistas',]=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_vistas<-variables['cual_es_el_nombre_fichero_vistas',]
separador_vistas<-variables['cual_es_su_separador_vistas',]
quote_vistas<-variables['cual_es_su_quote_vistas',]
header_vistas<-TRUE
num_row<-if_else(variables['aparece_numero_fila',]=="SI",1,0) # 1 SI, 0 NO

#CARGAR TABLAS
refresco_datos<- if_else(variables['quieres_cargar_nuevos_datos',]=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_datos<-variables['cual_es_el_nombre_fichero_datos',]
separador_datos<-variables['cual_es_su_separador_datos',]
quote_datos<-variables['cual_es_su_quote_datos',]
header_datos<-TRUE

#CARGAR VISTAS

cargar_traspasos<- if_else(variables['quieres_cargar_vistas',]=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_traspasos<-variables['cual_es_el_nombre_fichero_vistas',]
separador_traspasos<-variables['cual_es_su_separador_vistas',]
quote_traspasos<-variables['cual_es_su_quote_vistas',]
header_traspasos<-TRUE
num_row_traspasos<-if_else(variables['aparece_numero_fila',]=="SI",1,0) # 1 SI, 0 NO



## PEDIR USUARIO LA INFORMACION (COMENTADO) ##
#tabla_usuario<-readline(prompt="Tabla Analisis: dwbasep0.")
#tabla_analisis<- paste0("dwbasep0.",tabla_usuario)
#eleccion_bajada<-menu(c("10", "20", "30", "40", "50"),graphics = FALSE, title="Cuantos niveles quieres bajar?")
#niveles_bajada<- paste0(eleccion_bajada,"0")
#niveles_bajada <- 30
#refresco_datos<-menu(c("SI","NO"),graphics = FALSE, title="quieres refrescar datos?")
