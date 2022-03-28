
.GlobalEnv
 #VARIABLES----

is.environment(.GlobalEnv)

##FUNCIONES
x_arbol<- function(ni1,ni2)
{
   return( paste0(ni1,ni2))
}
x_make_arbol<- function(ni_x,ni_y)
{
  if( ni_y == "in")
  {
      print(paste0("X=",ni_x,"Y=",ni_y))
      x_make<-make_ego_graph(
      dt[[comp_conxa_tabla_t]],
      ni_x,
      nodes=which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
      mode=c("in"),
      mindist=0 )[[1]]
   }
  if( ni_y == "out")
    {
    print(paste0("X=",ni_x,"Y=",ni_y))
      x_make<-make_ego_graph(
      dt[[comp_conxa_tabla_t]],
      ni_x,
      nodes=which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
      mode=c("out"),
      mindist=0 )[[1]]
     }
  return(x_make)
}
Existe_Vertice<-function(z)
{
  Existe<-length(as.integer(which(!is.na(str_match(V(t_arbol_m_out)$name, z)))))
  if(Existe!=0){
    return(("SI"))
  }
  if(Existe==0){
    return(("NO"))
  }
}
##FIN FUNCIONES

x <- c(3,6)
y <- c("in","out")
 #FIN VARIABLES----

setwd(rutadatossalida)
 #EJECUCION SCRIPT----
rm(grupo_tablas_analisis)
rm(xvalor)
rm(tabla_analisis)

    grupo_tablas_analisis<-c("1.dwbasep0.dwiprltt")
   xvalor<-"1.dwbasep0.dwiprltt"

    for (xvalor in grupo_tablas_analisis) {
                print(paste0("   GRAFO DE LA TABLA ",xvalor))
         tabla_analisis<- xvalor
  
  # CREAR CARPETAS #
     setwd(rutadatossalida)
     ruta_actual<-getwd()
     print(ruta_actual)
     nombre_carpeta<- str_to_upper(sub(".","_",tabla_analisis,
                                       ignore.case=FALSE, 
                                       perl=FALSE,
                                       fixed=TRUE, 
                                       useBytes=FALSE))
     print(paste0("nombre carpeta:",nombre_carpeta))
     rutacarpeta<-paste0(rutadatossalida,"/",nombre_carpeta,sep="")
  
 # rutaigraphs<-paste0(rutacarpeta,"/Igraphs")
  if(dir.exists(rutacarpeta)==FALSE){
    dir.create(rutacarpeta)
  }
  if(dir.exists(rutacarpeta)==TRUE)
{
    ficheros<-list.files(path=rutacarpeta,pattern="html$",
                         all.files=FALSE,
                         full.names=FALSE,
                         recursive=FALSE,
                         include.dirs=FALSE)     
    
    if(length(ficheros)!=0)
  {
         subcarpeta<-as.character(Sys.time())
         setwd(rutacarpeta)
         rutasubcarpeta<-(paste0(rutacarpeta,"/",subcarpeta))
         ficheros<-list.files(path=rutacarpeta,pattern="html$",
                              all.files=FALSE,
                              full.names=FALSE,
                              recursive=FALSE,
                              include.dirs=FALSE)     
         dir.create(subcarpeta)
         for(xfile in ficheros)
          {
           filefrom<-paste0(rutacarpeta,"/",xfile)
           fileto<-paste0(rutasubcarpeta,"/",xfile)
           file.rename(from=filefrom,to=fileto)
          }
    }
}
  
# if(dir.exists(paste0(rutacarpeta,"/Igraphs"))==FALSE){
#   dir.create(rutaigraphs)
# 
     }
  
     
