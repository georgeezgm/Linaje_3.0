
#### VERSION 3.3 -> BUCLE DE TABLAS
#### VERSION 4 -> Conexion a Teradata y Logger
#### VERSION 5 -> Incluimos Creación de las vistas de Teradata y Empezamos a Separar Scripts. en mini Scripts

.GlobalEnv

source(paste0(rutascripts,"/rutas_de_trabajo"))

#use_proxy("http://proxyinternet.t0.inet", port = 8080, username = "T151024", password = "JE122021", auth = "basic")
use_proxy("http://proxyinternet.t0.inet", port = 8080)
GET("https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.1/PACKAGES", use_proxy("http://proxyinternet.t0.inet", port = 8080), verbose())

##INSTALACION DE PAQUETES
system(source(paste0(rutascripts,"/Paquetes Continuacion Bueno.R")),wait=TRUE)

#,intern = TRUE,  ignore.stdout = FALSE, ignore.stderr = FALSE , input = NULL)
          
### LOG ###

#          system(source(paste0(rutascripts,"/logger.R")),wait=TRUE)
          
### DEFINICION DE VARIABLES ###
                          
          source(paste0(rutascripts,"/DefinicionVariables_main.R"),local = FALSE, echo = TRUE, verbose = TRUE)

##REFRESCO DE DATOS
                if (refresco_datos == 1){    
                  
                  print("HAS ELEGIDO REFRESCAR LOS DATOS")
                  source(paste0(rutascripts,"/main/Cargaficheros_procesamiento_main_v4.R"),local = FALSE, echo = TRUE, verbose = TRUE)
                }else {
                  print("HAS ELEGIDO NO REFRESCAR LOS DATOS")
                }
setwd(rutadatossistema)

saveRDS(datos, file = "datos.rds")
saveRDS(datos_juntos, file = "datos_juntos.rds")
saveRDS(datos_1_juntos, file = "datos_1_juntos.rds")
saveRDS(datos_1_fichero, file = "datos_1_fichero.rds")
saveRDS(datos_filt_rigth, file = "datos_filt_rigth.rds")
saveRDS(datos_filt_left, file = "datos_filt_left.rds")
saveRDS(datos_filt_ren, file = "datos_filt_ren.rds")
saveRDS(datos_filt_ren_in, file = "datos_filt_ren_in.rds")
saveRDS(datos_filt_ren_out, file = "datos_filt_ren_out.rds")
saveRDS(datos_2_exa, file = "datos_2_exa.rds")
saveRDS(datos_1_exa, file = "datos_1_exa.rds")
saveRDS(datos_filt_total, file = "datos_filt_total.rds")
saveRDS(datos_filt_teradata, file = "datos_filt_teradata.rds")
saveRDS(datos_filt_total, file = "datos_filt_tot.rds")
saveRDS(datos_filt_rigth_amp, file = "datos_filt_rigth_amp.rds")
saveRDS(datos_filt_salida, file = "datos_filt_salida.rds")



rm(list = ls()[grep("datos", ls())])
 


##BUSQUEDA DE TABLAS <- se haria en este punto con el fichero /scripts/BusquedaTablas.R
          
######COMIENZA EL BUCLE DE LAS TABLAS#######

print("COMENZAMOS A REALIZAR GRAFOS DE LAS TABLAS")

source(paste0(rutascripts,"/grafico webpage main.R"),local = FALSE, echo = TRUE, verbose = TRUE)
ruta_actual= getwd()
if(ruta_actual==rutainicial){
    break
  }else{
          setwd(rutainicial)
  }


print("FIN DEL PROCESO")
library(remotes)

install_github("trevorld/r-argparse",host = "api.github.com",
               dependencies = TRUE,upgrade =  "ask",
               build = TRUE,
               build_manual = TRUE,
               build_vignettes = TRUE
)







