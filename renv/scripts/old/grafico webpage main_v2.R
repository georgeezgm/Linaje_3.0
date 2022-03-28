#install.packages("visNetwork")
#t_arbol_m_out_<-t_arbol_m_out_bck
.GlobalEnv
# devtools::install_github("datastorm-open/visNetwork") for development version

#require(visNetwork)
#?visNetwork
setwd(rutadatossalida)
#library(visNetwork)
#p = visNetwork::visNetwork(nodes = t_arbol_m_out$nodes, edges = t_arbol_m_out$edges)
#p = visNetwork::visIgraphLayout(p, layout = "layout_with_sugiyama")
#p # plot is empty
grupo_tablas_analisis<-c('1.dwbasep0.d99toptt')
xvalor<-'1.dwbasep0.d99toptt'
 rm(tabla_analisis)
for (xvalor in grupo_tablas_analisis) {
  print(paste0("   GRAFO DE LA TABLA ",xvalor))
  
  tabla_analisis<- xvalor
  
  # CREAR CARPETAS #
  setwd(rutadatossalida)
  ruta_actual<-getwd()
  print(ruta_actual)
  
  nombre_carpeta<- str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE))
 print(paste0("nombre carpeta:",nombre_carpeta))
  rutacarpeta<-paste0(rutadatossalida,"/",nombre_carpeta,sep="")
  
 # rutaigraphs<-paste0(rutacarpeta,"/Igraphs")
  if(dir.exists(rutacarpeta)==FALSE){
    dir.create(rutacarpeta)
  }
  if(dir.exists(rutacarpeta)==TRUE){
    ficheros<-list.files(path=rutacarpeta,pattern="html$",all.files=FALSE,full.names=FALSE,recursive=FALSE,include.dirs=FALSE)     
    
    if(length(ficheros)!=0)
  {
     subcarpeta<-as.character(Sys.time())
     setwd(rutacarpeta)
     rutasubcarpeta<-(paste0(rutacarpeta,"/",subcarpeta))
     ficheros<-list.files(path=rutacarpeta,pattern="html$",all.files=FALSE,full.names=FALSE,recursive=FALSE,include.dirs=FALSE)     
     dir.create(subcarpeta)
     for(xfile in ficheros){
       filefrom<-paste0(rutacarpeta,"/",xfile)
       fileto<-paste0(rutasubcarpeta,"/",xfile)
       file.rename(from=filefrom,to=fileto)
     }
    }
  }
  
# if(dir.exists(paste0(rutacarpeta,"/Igraphs"))==FALSE){
#   dir.create(rutaigraphs)
# }
  
    setwd(rutacarpeta)
  
   
  
  # Montamos grafo
  
  dt <- decompose.graph(t)
  
  for (i in 1:length(dt)){
    if (length(V(dt[[i]]))>0 & length(which(V(dt[[i]])$name== tabla_analisis))>0) {comp_conxa_tabla_t<- i; print(i)}
  }
  
  x <- c(2,4,6)
  y <- c("in","out")
  
  
  x_arbol<- function(ni1,ni2){
    
    return( paste0(ni1,ni2))
  }
  

  
  x_make_arbol<- function(ni_x,ni_y){
    if( ni_y == "in"){
      print(paste0("ni=",ni_y))
    x_make<-make_ego_graph(
      dt[[comp_conxa_tabla_t]],
      ni_x,
      nodes = which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
      mode = c("in"),
      mindist = 0 )[[1]]
    }
      if( ni_y == "out"){
      print(paste0("ni=",ni_y))
      x_make<-make_ego_graph(
        dt[[comp_conxa_tabla_t]],
        ni_x,
        nodes = which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
        mode = c("out"),
        mindist = 0 )[[1]]
      }
    return(x_make)
  }
  
  
  
  
  for(y_val in y){
    
    print(paste0("       ",y_val))
    
    
    for (x_val in x) {
      
      print(paste0("          NIVEL: ",x_val))
      rm(t_arbol_m_out)
      t_arbol_m_out<-x_make_arbol(x_val,y_val)
      name_t_arbol<-paste0("t_arbol_m_",y_val,"_",x_val)
      assign(name_t_arbol,t_arbol_m_out)
patron_tera<-'1\\.'
patron_tera0<-'1\\.(.*\\.carga|.*\\.pro|.*\\.aux|.*\\.pr_)'
patron_tera1<-'1\\.dwbasep0|1\\.dwturm'
patron_tera2<-'1\\.dwtbjo'
patron_tera3<-'1.\\.(..pryv|..ract|..proy|..pmpy)'
patron_tera4<-'1\\.tebasep0'
patron_tera5<-'1\\.(..oputp0)'
patron_tera6<-'1\\.(dwgra|dwgrb|d9gra|d9grb)'
patron_exa<-'2\\.'
patron_exa1<-'2\\.dwbasep0|2\\.dwturm'

grupos_teradata<-c('Tabla de teradata','Tablas de Producción Teradata','Tablas de Arquitectura','Tablas de Proyectos','Tablas de TELCO','Tablas de dato','Tablas de usuario','Tablas de proceso')
grupos_exadata<-c('Tabla de exadata','Tablas de Producción Exadata')
#V(t_arbol_m_out)$group  <- ifelse(is.na(as_ids(V(t_arbol_m_out))),'-','intermedias')
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]<- 'Tabla de teradata'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa)))]<- 'Tabla de exadata'

V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera1)))]<- 'Tablas de Producción Teradata'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa1)))]<- 'Tablas de Producción Exadata'

V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera2)))]<- 'Tablas de Arquitectura'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera3)))]<- 'Tablas de Proyectos'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera4)))]<- 'Tablas de TELCO'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera5)))]<- 'Tablas de dato'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera6)))]<- 'Tablas de usuario'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera0)))]<- 'Tablas de proceso'
V(t_arbol_m_out)$group[which(V(t_arbol_m_out)$name==tabla_analisis)]<-'Tabla del Linaje'

## CREACION DEL GRAFO


  #print(paste0("igraph_",y_val,"_",x_val))
name_igraph<-paste0("igraph_",y_val,"_",x_val) 
#igraph<-visIgraph(
visIgraph(
            t_arbol_m_out, 
            physics = TRUE, 
            smooth=FALSE
            ) %>% 
  visIgraphLayout(
   # layout = "layout_nicely", 
    layout = "layout_with_sugiyama"
           ) %>% 
  visNodes(
         x=10,y=10, 
         physics = TRUE,   # physics = FALSE,
    borderWidth=1,
    borderWidthSelected=1,
    labelHighlightBold=TRUE,
    font = list(size=10,face="arial")
    
    
  )  %>% 
  visEdges(
            arrows = "to" ,
            length=1,
              width=1,
            physics = TRUE,
            font= list(size=10,face="arial"),
        smooth= list(
                      enabled=TRUE,
                      type="cubicBezier",#  type="curvedCW",
                      roundness=0.55
                    )
          )  %>%            
   
    visGroups(groupname = "dwbasep0" , color= "skyblue",  shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "dwturmp0", color= "green", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "proyectos", color= "coral", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "tebasep0", color= "cyan", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "oputp0", color= "gold", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "gra o grb", color= "aquamarine", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "intermedias", color= "darkcyan", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "tabla del Linaje", color= "blueviolet", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "tabla teradata", color= "darkcyan", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname = "tabla exadata", color= "red", shape = "box", shadow = list(enabled = TRUE)) %>% 
    visClusteringByGroup(groups = grupos_teradata, label="Cluster: ",shape = "squart",color="Orange", force= TRUE) %>% 
    visClusteringByGroup(groups = grupos_exa, label="Cluster: ",shape = "squart",color="Red", force= TRUE) %>% 
  
  visLayout(
              improvedLayout = FALSE,
              hierarchical=TRUE
            ) %>%
  visHierarchicalLayout(
              direction = "LR", # direction = "RL", 
             
             parentCentralization=TRUE, 
             levelSeparation = 300, 
             nodeSpacing=200,
              edgeMinimization = TRUE

            ) %>%
  visLegend(
              useGroups=TRUE,
              width=0.2, 
              
              position="left" , 
              main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
              zoom=FALSE
            ) %>% 
    visOptions(
                width="350%",
                height="350%", 
                selectedBy = list(variable="group",multiple=TRUE), 
                autoResize=FALSE,
                clickToUse=TRUE
              )%>%
    visPhysics(              
                enable =TRUE,
                repulsion= list(damping = 1),
                hierarchicalRepulsion = list(damping = 1)
                )%>%
  visInteraction( 
                dragNodes = TRUE,
                dragView = TRUE,
                hover = TRUE,
                hoverConnectedEdges = TRUE,
                hideEdgesOnDrag = NULL,
                hideNodesOnDrag = NULL,
                keyboard = TRUE,
                multiselect = TRUE,
                navigationButtons = TRUE,
                selectable = TRUE,
                selectConnectedEdges = TRUE,
                tooltipDelay = TRUE,
                tooltipStay = 300,
                tooltipStyle = TRUE,
                zoomView = TRUE,
                zoomSpeed = 0.75
              )%>% 
  visSave( 
    file = paste0(rutacarpeta,"/",str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE)),"_",x_val,"_",y_val,".html")
  )



#assign(name_igraph,igraph)

 
#visSave(igraph,file = paste0(rutacarpeta,"/",str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE)),"_",x_val,"_",y_val,".html"))
#save(name_igraph, file = paste0(rutaigraphs,"/",name_igraph,".RData") )
# visNetwork-igraph("igraph")
  
    }
    
    
  }
}

