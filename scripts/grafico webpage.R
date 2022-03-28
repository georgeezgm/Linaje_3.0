#install.packages("visNetwork")
#t_arbol_m_out_<-t_arbol_m_out_bck

# devtools::install_github("datastorm-open/visNetwork") for development version

#require(visNetwork)
#?visNetwork

#library(visNetwork)
#p = visNetwork::visNetwork(nodes = t_arbol_m_out$nodes, edges = t_arbol_m_out$edges)
#p = visNetwork::visIgraphLayout(p, layout = "layout_with_sugiyama")
#p # plot is empty

 rm(tabla_analisis)
 
for (xvalor in grupo_tablas_analisis) {
  print(paste0("   GRAFO DE LA TABLA ",xvalor))
  
  tabla_analisis<- xvalor 

  # INCIDENCIA DEL igraph
  

  # CREAR CARPETAS #
  nombre_carpeta<- str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE))
  ruta_actual<-getwd()
  rutacarpeta<-paste0(rutadatossalida,"/",nombre_carpeta)
  setwd(rutadatossalida)
  
  if(ruta_actual==rutadatossalida){
    break
  }else{
    setwd(rutadatossalida)
  }
  if(dir.exists(rutacarpeta)==FALSE){
    
    dir.create(paste(rutadatossalida,"/",nombre_carpeta,sep=""),showWarnings=FALSE)
  }
  
  setwd(rutacarpeta)
  
   
  
  # Montamos grafo
  
  dt <- decompose.graph(t)
  
  for (i in 1:length(dt)){
    if (length(V(dt[[i]]))>0 & length(which(V(dt[[i]])$name== tabla_analisis))>0) {comp_conxa_tabla_t<- i; print(i)}
  }
  
  x <- c(2,3,4,5)
  y <- c("in","out")
  
  
  x_arbol<- function(ni1,ni2){
    
    return( paste0(ni1,ni2))
  }
  
  
  x_make_arbol<- function(ni_x,ni_y){
    if( ni_y == "in"){
      print(paste0("ni=",ni_y))
    x_make<-make_ego_graph(
      dt[[comp_conxa_tabla_t]],
      order = ni_x,
      nodes = which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
      mode = c("in"),
      mindist = 0 )[[1]]
    }
    if( ni_y == "out"){
      print(paste0("ni=",ni_y))
      x_make<-make_ego_graph(
        dt[[comp_conxa_tabla_t]],
        order = ni_x,
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
      
      t_arbol_m_out<-x_make_arbol(x_val,y_val)
      

patron0<-'\\.carga|\\.pro|\\.aux|\\.pr_'
patron1<-'dwbasep0'
patron2<-'dwturm'
patron3<-'pryv|ract|proy|pmpy'
patron4<-'tebasep0'
patron5<-'oputp0'
patron6<-'dwgra|dwgrb|d9gra|d9grb'


V(t_arbol_m_out)$group  <- ifelse(is.na(as_ids(V(t_arbol_m_out))),'-','intermedias')
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron1)))]<- 'dwbasep0'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron2)))]<- 'dwturmp0'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron3)))]<- 'proyectos'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron4)))]<- 'tebasep0'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron5)))]<- 'oputp0'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron6)))]<- 'gra o grb'
V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron0)))]<- 'intermedias'
V(t_arbol_m_out)$group[which(V(t_arbol_m_out)$name==tabla_analisis)]<-'tabla del Linaje'

## CREACION DEL GRAFO


  #print(paste0("igraph_",y_val,"_",x_val))
name_igraph<-paste0("igraph_",y_val,"_",x_val) 
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
    
  visLayout(
              improvedLayout = FALSE
          
            ) %>%
  visHierarchicalLayout(
              direction = "LR", # direction = "RL", 
             
             #parentCentralization=TRUE, 
             levelSeparation = 300, 
             nodeSpacing=200,
              edgeMinimization = TRUE
              
            ) %>%
  visLegend(
              useGroups=TRUE,
              width=0.2, 
              
              position="left" , 
              main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
              zoom=TRUE
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
                zoomSpeed = 1
              )%>% 
  visSave( 
    file = paste0(rutacarpeta,"/",str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE)),"_",x_val,"_",y_val,".html")
  )

igraph<-visIgraph(
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
  
  visLayout(
    improvedLayout = FALSE
    
  ) %>%
  visHierarchicalLayout(
    direction = "LR", # direction = "RL", 
    
    #parentCentralization=TRUE, 
    levelSeparation = 300, 
    nodeSpacing=200,
    edgeMinimization = TRUE
    
  ) %>%
  visLegend(
    useGroups=TRUE,
    width=0.2, 
    
    position="left" , 
    main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
    zoom=TRUE
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
    zoomSpeed = 1
  )
assign(name_igraph,igraph)
vertices<-data.frame(igraph[["x"]][["edges"]][["from"]],igraph[["x"]][["edges"]][["to"]],igraph[["x"]][["edges"]][["label"]], ifelse(igraph[["x"]][["edges"]][["from"]]==tabla_analisis,1,0))

 names(vertices)<-c("tabla1","tabla2","label","vecindad")

#   visSave(igraph,file = paste0(rutacarpeta,"/",str_to_upper(sub('.','_',tabla_analisis,ignore.case = FALSE, perl = FALSE,fixed = TRUE, useBytes = FALSE)),"_",x_val,"_",y_val,".html"))
  
#  visNetwork-igraph("igraph")
  
    }
    
    
  }
}

