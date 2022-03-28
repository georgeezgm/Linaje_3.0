### DEFINICION DE VARIABLES ###

.GlobalEnv
is.environment(.GlobalEnv)


## TABLAS ##
tablasprocesar <- read.table(file = paste0(rutadatos,"/Sistema/TablasProcesar.txt"),header=TRUE,sep = ";",quote="")
variables <- read.table(file = paste0(rutadatos,"/Sistema/variables.txt"),header=TRUE,sep = "~",quote="\'")
grupo_tablas_analisis<-str_to_lower(tablasprocesar$TABLA )
cadena_tablas<-variables[variables$Nombre_variable=="patron_tablas",]$variable
cadena_tablas_finales<-variables[variables$Nombre_variable=="patron_tablas_finales",]$variable
cadena_tablas_borrar<-variables[variables$Nombre_variable=="patron_tablas_borrar",]$variable


## REFRESCAR DATOS DEL FICHERO Y REALIZAR CRUCES? ##    
#CARGAR VISTAS

cargar_vistas<- if_else(variables[variables$Nombre_variable=="quieres_cargar_vistas",]$variable=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_vistas<-variables[variables$Nombre_variable=="cual_es_el_nombre_fichero_vistas",]$variable
separador_vistas<-variables[variables$Nombre_variable=="cual_es_su_separador_vistas",]$variable
quote_vistas<-variables[variables$Nombre_variable=="cual_es_su_quote_vistas",]$variable
header_vistas<-TRUE
num_row<-if_else(variables[variables$Nombre_variable=="aparece_numero_fila",]$variable=="SI",1,0) # 1 SI, 0 NO

#CARGAR TABLAS
refresco_datos<- if_else(variables[variables$Nombre_variable=="quieres_cargar_nuevos_datos",]$variable=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_datos<-variables[variables$Nombre_variable=="cual_es_el_nombre_fichero_datos",]$variable
separador_datos<-variables[variables$Nombre_variable=="cual_es_su_separador_datos",]$variable
quote_datos<-variables[variables$Nombre_variable=="cual_es_su_quote_datos",]$variable
header_datos<-TRUE

#CARGAR TRASPASOSx

cargar_traspasos<- if_else(variables[variables$Nombre_variable=="quieres_cargar_traspasos",]$variable=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_traspasos<-variables[variables$Nombre_variable=="cual_es_el_nombre_fichero_traspasos",]$variable
separador_traspasos<-variables[variables$Nombre_variable=="cual_es_su_separador_traspasos",]$variable
quote_traspasos<-variables[variables$Nombre_variable=="cual_es_su_quote_traspasos",]$variable
header_traspasos<-TRUE
num_row_traspasos<-if_else(variables[variables$Nombre_variable=="aparece_numero_fila_traspasos",]$variable=="SI",1,0) # 1 SI, 0 NO

patron_teradata<-variables[variables$Nombre_variable=="patron_teradata",]$variable
patron_exadata<-variables[variables$Nombre_variable=="patron_exadata",]$variable
patron_bda_pro<-variables[variables$Nombre_variable=="patron_bda_pro",]$variable
patron_bda_analitica<-variables[variables$Nombre_variable=="patron_bda_analitica",]$variable

## PEDIR USUARIO LA INFORMACION (COMENTADO) ##
#tabla_usuario<-readline(prompt="Tabla Analisis: dwbasep0.")
#tabla_analisis<- paste0("dwbasep0.",tabla_usuario)
#eleccion_bajada<-menu(c("10", "20", "30", "40", "50"),graphics = FALSE, title="Cuantos niveles quieres bajar?")
#niveles_bajada<- paste0(eleccion_bajada,"0")
#niveles_bajada <- 30
#refresco_datos<-menu(c("SI","NO"),graphics = FALSE, title="quieres refrescar datos?")


#CARGAR VISTAS

cargar_tablas_exa<- if_else(variables[variables$Nombre_variable=="quieres_cargar_tablas_exa",]$variable=="SI",1,0) # 1 SI, 0 NO
nombre_fichero_datos_exa<-variables[variables$Nombre_variable=="cual_es_el_nombre_fichero_tablas_exa",]$variable
separador_datos_exa<-variables[variables$Nombre_variable=="cual_es_su_separador_tablas_exa",]$variable
quote_datos_exa<-variables[variables$Nombre_variable=="cual_es_su_quote_tablas_exa",]$variable
header_tablas_exa<-TRUE
num_row_exa<-if_else(variables[variables$Nombre_variable=="aparece_numero_fila_exa",]$variable=="SI",1,0) # 1 SI, 0 NO
