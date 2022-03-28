### DEFINICION DE VARIABLES ###

.GlobalEnv
is.environment(.GlobalEnv)


## TABLAS ##
tablasprocesar <- read.table(file = paste0(rutadatos,"/sistema/TablasProcesar.txt"),header=TRUE,sep = ";",quote="")

grupo_tablas_analisis<-str_to_lower(tablasprocesar$TABLA )
cadena_tablas<-'\\.d(9|w)....(v|t)t$' # metemos patron, si dejamos como '' va hasta el final del grago ^dw....tt$' ##HE CAMBIADO TT por VT
cadena_tablas_finales<-'\\.carga|\\.pro'
cadena_tablas_borrar<-'\\.error|\\.old|\\.dwcarttt$|\\.dwcarstt$'



## REFRESCAR DATOS DEL FICHERO Y REALIZAR CRUCES? ##    
#CARGAR VISTAS
cargar_vistas <- 1 # 1 SI, 0 NO
nombre_fichero_vistas<-"/VistasTeradata_rename.out"
separador_vistas<-"~"
quote_vistas<-"\""
header_vistas<-TRUE
#CARGAR TABLAS
refresco_datos<- 1 # 1 SI, 0 NO
nombre_fichero_datos<-"/SalidaTeradata6Oct.csv"
separador_datos<-";"
quote_datos<-"\""
header_datos<-TRUE



## PEDIR USUARIO LA INFORMACION (COMENTADO) ##
#tabla_usuario<-readline(prompt="Tabla Analisis: dwbasep0.")
#tabla_analisis<- paste0("dwbasep0.",tabla_usuario)
#eleccion_bajada<-menu(c("10", "20", "30", "40", "50"),graphics = FALSE, title="Cuantos niveles quieres bajar?")
#niveles_bajada<- paste0(eleccion_bajada,"0")
#niveles_bajada <- 30
#refresco_datos<-menu(c("SI","NO"),graphics = FALSE, title="quieres refrescar datos?")
