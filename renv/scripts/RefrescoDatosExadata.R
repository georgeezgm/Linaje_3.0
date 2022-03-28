
##DECLARACION DE VARIABLES

library("data.table")   # paquete para manipulacion estructuras data.table, grandes cantidades de datosexa
library('igraph')       # paquete grafos
library('stringr')      # pquete procesado de cadenas
library('dplyr')        # paquete combinacion y limpiado de datosexa
#library('tdplyr')           # paquete tratamiento de datosexa en teradata
library('Cairo')        # paquete para imprimir en pdf
library('parallel')     # paquete para usar mclapply computacion paralela
library('stringi')      # pquete procesado de cadenas
library('log4r')        # pquete logger
library('teradatasql')  # paquete sql teradata  
library('dplyr.teradata')   # paquete conexion y tratamiento de base de datosexa teradata
library('devtools')         # paquete herramientas de desarrollador
#  
library('lubridate')
library('tidyr')
library('curl')
library('readxl')
library('readr')
## RUTAS DE TRABAJO  
rutainicial <- "/Users/jorge/Library/Mobile Documents/com~apple~CloudDocs/Documents/R/Parser_v1/Parser_v1"
rutaoriginal<- paste0(rutainicial,"/datosexa")
##REFRESCO DE datosexa

if (refresco_datosexa == 1){
  print("HAS ELEGIDO REFRESCAR LOS datosexa")
  ## FICHERO DE datosexa ##
  #LECTURA DE datosexa
  print("   PROCESO 1 de 6")
  datosexa <- read.table(file = paste0(rutaoriginal,"/ResultnParser20200625_2.txt"), header = TRUE, sep = ";",quote="\"", colClasses = "character")
  #  EXADATA-> datosexa <- read.table(file = paste0(rutaoriginal,"/SQLsExadataLog_v5.txt"), header = TRUE, sep = "~",quote="\"",fill=TRUE) 
  #datosexa2 <- str_to_lower(read.table(file = "/Users/jorge/Documents/TRABAJO/Estructurales/R/V1/extraccion_20200317_3.csv", header = TRUE, sep = "   ",quote = "\"", colClasses = "character"))
  #CARGAR NOMBRE DE CAMPOS
  print("   PROCESO 2 de 6")
  names(datosexa)<- c('co_query','tabla','tipo','tabla_vista','orden')
  datosexa$co_query<- as.character(datosexa$co_query)
  datosexa$tabla   <- as.character(datosexa$tabla)
  datosexa$tipo    <- as.character(datosexa$tipo)
  datosexa$tabla_vista    <- as.character(datosexa$tabla_vista)
  datosexa$orden    <- as.character(datosexa$orden)
  #Tratamiento de Fechas
  datosexa[,2] <- unlist(mclapply(datosexa[,2],function(x) gsub('2020[0-9][0-9][0-9][0-9]','YYYYMMDD',x)))
  
  ##PROCESAMIENTO DE datosexa
  print("   PROCESO 3 de 6")
  # Cruzamos la tabla consigo misma 2 veces para crear la tabla de relaciones padre-hijo
  print("      PROCESO 3.1 de 3.2")
  datosexa_filt_rigth<- datosexa %>% count(co_query) %>% filter (n>1)
  print("      PROCESO 3.2 de 3.2")
  datosexa_filt_left <- datosexa %>% group_by(co_query) %>% filter(row_number()==1) %>% filter(tipo %in% c('create','insert','update','mload')) %>%
    inner_join (datosexa_filt_rigth)
  print("   PROCESO 4 de 6")
  print("      PROCESO 4.1 de 4.4")
  datosexa_filt_rigth_amp<- datosexa %>% inner_join (datosexa_filt_left, by='co_query') %>% group_by(co_query) %>% filter(row_number()>1)
  print("      PROCESO 4.2 de 4.4")
  datosexa_filt_salida<- datosexa_filt_left %>% inner_join(datosexa_filt_rigth_amp, by='co_query') %>% select(c('co_query', 'tabla.x', 'tabla', 'tipo.y')) %>%
    rename(tabla_in=tabla.x, tabla_out=tabla, tipo=tipo.y)
  print("      PROCESO 4.3 de 4.4")
  if(as.integer(datosexa %>% filter(tipo=='rename out') %>% count())!=0){
    datosexa_filt_ren_out <- datosexa %>% group_by(co_query) %>% filter(row_number()==1) %>% filter(tipo=='rename out') %>%
      inner_join (datosexa_filt_rigth)}
  print("   PROCESO 5 de 6")
  print("      PROCESO 5.1 de 5.1")
  datosexa_filt_ren_in  <- datosexa %>% group_by(co_query) %>% filter(row_number()==2) %>% filter(tipo=='rename in') %>%
    inner_join (datosexa_filt_rigth)
  print("   PROCESO 6 de 6")
  print("      PROCESO 6.1 de 6.4")
  datosexa_filt_ren     <- datosexa_filt_ren_out %>% inner_join(datosexa_filt_ren_in, by='co_query') %>% select (c('co_query','tabla.x','tabla.y')) %>%
    bind_cols(as.data.frame(rep('rename',dim(datosexa_filt_ren_out)[1]), stringsAsFactors = FALSE)) %>% rename(tabla_in=tabla.x, tabla_out=tabla.y, tipo=`rep("rename", dim(datosexa_filt_ren_out)[1])`)
  # Eliminando el CO_QUERY
  print("      PROCESO 6.2 de 6.4")
  # datosexa_filt_tot<- datosexa_filt_salida %>% bind_rows(datosexa_filt_ren) %>% ungroup() %>% select(-c('co_query')) %>% distinct()
  datosexa_filt_tot<- datosexa_filt_salida %>% ungroup() %>% select(-c('co_query')) %>% distinct()
  # Quitamos Arcos Repetidos
  print('      PROCESO 6.3 de 6.4')
  edges<- as.vector(t(datosexa_filt_tot[,1:2]))
  edges_lab<- as.vector(t(datosexa_filt_tot[,3]))
  print("      PROCESO 6.4 de 6.4")
  ## GRAFO
  # Creamos el grafo y le añadimos los los Arcos anteriores
  t<- make_empty_graph() + vertices(unique(edges))
  t <- add_edges(t,edges)
  
  E(t)$label<- unlist(edges_lab)
  V(t)$name<- as_ids(V(t))
  # Borrado de vertices con tablas conflictivas
  
  
  t<- delete_vertices(t, which(!is.na(str_match(V(t)$name, cadena_tablas_borrar))))
  t<- delete_vertices(t, which(!is.na(str_match(V(t)$name,'.*\\.dwcar(s|t)tt'))))
  t<- delete_vertices(t, which(V(t)$name=='dwcarttt$'))
  
}else {
  "HAS ELEGIDO NO REFRESCAR LOS datosexa"
}

