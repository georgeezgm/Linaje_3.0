.GlobalEnv
is.environment(.GlobalEnv)



lecturafichero<- function(n1,n2,n3,n4){
  print(n2)
  separador<-ifelse(n2 == "tabulador","\t",n2)
  print(separador)
  print(paste(n1,n2,n3,sep=" -> ",collapse=NULL))
    datos2 <- fread(file = n1, sep = separador, header = FALSE, verbose=TRUE,skip=1 ,data.table=TRUE, col.names=n4,colClasses = "character", showProgress = TRUE)
   
  
  return(datos2)
}   

  ## FICHERO DE DATOS ##
  #LECTURA DE DATOS
  print("   1 Cargamos Datos de entrada")
  
  print("   1.1 Cargamos fichero principal de tablas")
 # datos_1_fichero<- lecturafichero(paste0(rutadatosentrada,nombre_fichero_datos),'\t','\"',c('co_query','tabla','tipo','tabla_vista','orden'))
  datos_1_fichero<- read_delim(paste0(rutadatosentrada,nombre_fichero_datos), delim=separador_datos,quote=quote_datos, col_names = c('co_query','tabla','tipo','tabla_vista','orden'))
  names(datos_1_fichero)<- c('co_query','tabla','tipo','tabla_vista','orden')
  #datos <- read.table(file = paste0(rutaoriginal,"/extraccion_20200521.csv"), header = TRUE, sep = "\t",quote="\"", colClasses = "character")
  vistas_cargadas<-"ANALIZANDO"

  if (cargar_vistas == 1){
    print("   1.2 Cargamos fichero vistas")
   # datos_0_vistas<- lecturafichero(paste0(rutadatosentrada,nombre_fichero_vistas),
    if(num_row == 1){
    datos_0_vistas<- read_delim(paste0(rutadatosentrada,nombre_fichero_vistas),delim=separador_vistas,quote=quote_vistas,col_names = c("num","co_query","tabla","tipo","tabla_vista","orden"),skip=1)
    }else{
      datos_0_vistas<- read_delim(paste0(rutadatosentrada,nombre_fichero_vistas),delim=separador_vistas,quote=quote_vistas,col_names = c("co_query","tabla","tipo","tabla_vista","orden"),skip=1)
    }
    # names(datos_0_vistas)<-c("num","co_query","tabla","tipo","tabla_vista","orden")
    datos_1_vistas<- datos_0_vistas %>% select("co_query","tabla","tipo","tabla_vista","orden") 
    print("   1.3 Juntamos ficheros")
    datos_1_juntos<-rbind(datos_1_vistas,datos_1_fichero)
    names(datos_1_juntos)<-c('co_query',"tabla","tipo","tabla_vista","orden")
    vistas_cargadas<-"OK"
  }else
  {
    print("   1.2 No Cargamos fichero vistas")
    print("   1.3 Juntamos ficheros")
    datos_1_juntos<-datos_1_fichero
    vistas_cargadas<-"NO ES NECESARIO"
  }               
  
  attach(datos_1_juntos)
  datos<- datos_1_juntos[order(co_query,orden),]
  rm(datos_1_juntos)
  rm(datos_1_fichero)
  rm(datos_1_vistas)
  rm(datos_0_vistas)
  {#  EXADATA-> datos <- read.table(file = paste0(rutaoriginal,"/SQLsExadataLog_v5.txt"), header = TRUE, sep = "~",quote="\"",fill=TRUE) 
  #datos2 <- str_to_lower(read.table(file = "/Users/jorge/Documents/TRABAJO/Estructurales/R/V1/extraccion_20200317_3.csv", header = TRUE, sep = "   ",quote = "\"", colClasses = "character"))
  #CARGAR NOMBRE DE CAMPOS
  }
  
  print("   2 Definimos nombres de campos y tratamos fechas")
  
  names(datos)<- c('co_query','tabla','tipo','tabla_vista','orden')
  datos$co_query<- as.character(datos$co_query)
  datos$tabla   <- as.character(datos$tabla)
  datos$tipo    <- as.character(datos$tipo)
  datos$tabla_vista    <- as.character(datos$tabla_vista)
  datos$orden    <- as.character(datos$orden)
  
  #Tratamiento de Fechas
  datos[,2] <- unlist(mclapply(datos[,2],function(x) gsub('202[0-9][0-9][0-9][0-9][0-9]','YYYYMMDD',x)))
  
  ##PROCESAMIENTO DE DATOS
  print("   3 Procesamiento de la información")
  # Cruzamos la tabla consigo misma 2 veces para crear la tabla de relaciones padre-hijo
  print("      3.1")
  datos_filt_rigth<- datos %>% count(co_query) %>% filter (n>1)
  print("      3.2")
  datos_filt_left <- datos %>% group_by(co_query) %>% filter(row_number()==1) %>% filter(tipo %in% c('create','insert','update','mload')) %>%
    inner_join (datos_filt_rigth)

  print("      3.3")
  datos_filt_rigth_amp<- datos %>% inner_join (datos_filt_left, by='co_query') %>% group_by(co_query) %>% filter(row_number()>1)
  print("      3.4")
  datos_filt_salida<- datos_filt_left %>% inner_join(datos_filt_rigth_amp, by='co_query') %>% select(c('co_query', 'tabla.x', 'tabla', 'tipo.y')) %>%
    rename(tabla_in=tabla.x, tabla_out=tabla, tipo=tipo.y)
  print("      3.5")
  if(as.integer(datos %>% filter(tipo=='rename out') %>% count())!=0){
    datos_filt_ren_out <- datos %>% group_by(co_query) %>% filter(row_number()==1) %>% filter(tipo=='rename out') %>%
      inner_join (datos_filt_rigth)}
  print("      3.6")
  
  datos_filt_ren_in  <- datos %>% group_by(co_query) %>% filter(row_number()==2) %>% filter(tipo=='rename in') %>%
    inner_join (datos_filt_rigth)
  print("      3.7")
  
  datos_filt_ren     <- datos_filt_ren_out %>% inner_join(datos_filt_ren_in, by='co_query') %>% select (c('co_query','tabla.x','tabla.y')) %>%
    bind_cols(as.data.frame(rep('rename',dim(datos_filt_ren_out)[1]), stringsAsFactors = FALSE)) %>% rename(tabla_in=tabla.x, tabla_out=tabla.y, tipo=`rep("rename", dim(datos_filt_ren_out)[1])`)
  # Eliminando el CO_QUERY
  print("      3.8")
   datos_filt_tot<- datos_filt_salida %>% bind_rows(datos_filt_ren) %>% ungroup() %>% select(-c('co_query')) %>% distinct()
  #datos_filt_tot<- datos_filt_salida %>% ungroup() %>% select(-c('co_query')) %>% distinct()
  # Quitamos Arcos Repetidos
   
   datos_filt_teradata<- datos_filt_tot
   datos_filt_teradata$tabla_in<-as.character(paste0("1.",datos_filt_teradata$tabla_in))
   datos_filt_teradata$tabla_out<-as.character(paste0("1.",datos_filt_teradata$tabla_out))

  print("   TRASPASOS")
  datos_traspasos_in<- read_delim(paste0(rutadatosentrada,nombre_fichero_traspasos),delim=separador_traspasos,quote=quote_traspasos,col_names = c('tabla_in','tabla_out','tipo','co_tipo_traspaso'),skip=1)
  datos_traspasos<-(datos_traspasos_in[,1:3])
  datos_filt_total<-bind_rows(datos_filt_teradata,datos_traspasos)
  
  
  print("   4 Creamos el grafo")
  
  edges<- as.vector(t(datos_filt_total[,1:2]))
  edges_lab<- as.vector(t(datos_filt_total[,3]))
  
  ## GRAFO
  # Creamos el grafo y le añadimos los los Arcos anteriores
  t<- make_empty_graph() + vertices(unique(edges))
  t <- add_edges(t,edges)
  
  E(t)$label<- unlist(edges_lab)
  V(t)$name<- as_ids(V(t))
  # Borrado de vertices con tablas conflictivas
  print("   5 Borramos tablas conflictivas")
  #cadena_tablas_borrar<-'\\.error|\\.old|(\\.d.cart.t$)|(\\.d.cars.t$)'
    
  vertices_borrar<-as.integer(which(!is.na(str_match(V(t)$name, cadena_tablas_borrar))))
#  t<- delete_vertices(t, matrix(which(!is.na(str_match(V(t)$name, cadena_tablas_borrar)))))
  total_vertices<-vcount(t)
  print(paste0("Total de Vertices: ",total_vertices))
  numero_vertices_borrar<-length(vertices_borrar)
  print(paste0("Total de Vertices: ",numero_vertices_borrar))
  tinicial<-t
  j<-0
  for(i in vertices_borrar){
  h<-i-j
 #+ print(as.character(V(t)[h]))
  t<-delete_vertices(t,V(t)[h])
  n<-(j/numero_vertices_borrar)*100
  if(porcentaje!=round(n,2)){
  porcentaje<-round(n,2)
  print(paste0(porcentaje," %"))
  }
  j<-j+1
  }

  
  print("   FIN DE LA CARGA Y PROCESAMIENTO DE LOS DATOS DE ENTRADA")

