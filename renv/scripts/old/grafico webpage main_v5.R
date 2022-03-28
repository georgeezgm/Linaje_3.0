
.GlobalEnv
is.environment(.GlobalEnv)

#require(visNetwork)
#?visNetwork
setwd(rutadatossalida)
#library(visNetwork)
#p=visNetwork::visNetwork(nodes=t_arbol_m_out$nodes, edges=t_arbol_m_out$edges)
#p=visNetwork::visIgraphLayout(p, layout="layout_with_sugiyama")
#p # plot is empty
grupo_tablas_analisis<-c("1.dwbasep0.d99toptt")
xvalor<-"1.dwbasep0.d99toptt"
 rm(tabla_analisis)
for (xvalor in grupo_tablas_analisis) {
  print(paste0("   GRAFO DE LA TABLA ",xvalor))
  
  tabla_analisis<- xvalor
  
  # CREAR CARPETAS #
  setwd(rutadatossalida)
  ruta_actual<-getwd()
  print(ruta_actual)
  
  nombre_carpeta<- str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE))
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
      nodes=which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
      mode=c("in"),
      mindist=0 )[[1]]
    }
      if( ni_y == "out"){
      print(paste0("ni=",ni_y))
      x_make<-make_ego_graph(
        dt[[comp_conxa_tabla_t]],
        ni_x,
        nodes=which(V(dt[[comp_conxa_tabla_t]])$name==tabla_analisis),
        mode=c("out"),
        mindist=0 )[[1]]
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

      V(t_arbol_m_out)$shape<-"box"
      
patron_tera<-'^1'
nombre_tera<-"Tablas_Teradata"
color_tera<-"#FF8C00" #darkorange
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]$group<- nombre_tera
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]$color<- color_tera

patron_exada<-'^2'
nombre_exada<-"Tablas_Exadata"
color_exada<- "#CD3700" #orangered3
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$group<- nombre_exada
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$color<-color_exada

patron_bdapr<-'^3'
nombre_bdapr<-"Tablas_BDA"
color_bdapr<- "#4169E1" #royalblue
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$group<- nombre_bdapr
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$color<-color_bdapr

nombre_linaje<-"Tabla_Linaje"
color_linaje<- "#CD69C9" #orchid3
V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$group<-nombre_linaje
V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$color<-color_linaje

patron_tera_prod<-'^1\\.(dwbasep0|dwturmp0)'
nombre_tera_prod<-"Tablas_Prod_Teradata"
color_tera_prod<-"#EE7600"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_prod)))]$group<- nombre_tera_prod
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_prod)))]$color<- color_tera_prod

patron_exad_prod<-'^2\\.dw(base|turm)'
nombre_exad_prod<-"Tablas_Prod_Exadata"
color_exad_prod<-"#FF4500"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exad_prod)))]$group<- nombre_exad_prod
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exad_prod)))]$color<- color_exad_prod

patron_tera_arqu<-'^1\\.dwtbjop0'
nombre_tera_arqu<- "Tablas_Arquitectura"
color_tera_arqu<-"#FFD700"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_arqu)))]$group<- nombre_tera_arqu
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_arqu)))]$color<- color_tera_arqu

patron_tera_proy<-'^1\\.d.(pryv|ract|proy|pmpy)'
nombre_tera_proy<- "Tablas_Proyectos"
color_tera_proy<-"#79CDCD"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proy)))]$group<- nombre_tera_proy
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proy)))]$color<- color_tera_proy

patron_tera_telco<-'^1\\.tebasep0'
nombre_tera_telco<- "Tablas_TELCO"
color_tera_telco<-"#B22222"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_telco)))]$group<- nombre_tera_telco
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_telco)))]$color<- color_tera_telco

patron_tera_dato<-'^1\\...oputp0'
nombre_tera_dato<- "Tablas_Dato"
color_tera_dato<-"#008B8B"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_dato)))]$group<- nombre_tera_dato
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_dato)))]$color<- color_tera_dato

patron_tera_usurio<-'^1\\.d(w|9)gr(a|b)p0'
nombre_tera_usuario<- "Tablas_Usuario"
color_tera_usuario<-"#C1FFC1"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_usurio)))]$group<- nombre_tera_usuario
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_usurio)))]$color<- color_tera_usuario

patron_tera_proceso<-'^1\\..*(\\.carga|\\.pro|\\.aux|\\.pr_)'
nombre_tera_proceso<- "Tablas_Proceso"
color_tera_proceso<-"#FFB90F"
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proceso)))]$group<- nombre_tera_proceso
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proceso)))]$color<- color_tera_proceso

#V(t_arbol_m_out)$group  <-"Tablas_Genericas"


V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$group.groupname<- nombre_exada
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$group.color<- color_exada
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$group.groupname<- nombre_bdapr
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$group.color<- color_bdapr
V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$group.groupname<-nombre_linaje
V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$group.color<-color_linaje
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera0)))]$group.groupname<- nombre_tera_proceso
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera0)))]$group.color<- color_tera_proceso
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera2)))]$group.groupname<- nombre_tera_arqu
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera2)))]$group.color<- color_tera_arqu
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera3)))]$group.groupname<- nombre_tera_proy
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera3)))]$group.color<- color_tera_proy
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera4)))]$group.groupname<- nombre_tera_telco
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera4)))]$group.color<- color_tera_telco
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera5)))]$group.groupname<- nombre_tera_dato
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera5)))]$group.color<- color_tera_dato
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera6)))]$group.groupname<- nombre_tera_usuario
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera6)))]$group.color<- color_tera_usuario

#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name,patron_tera1)))]<-nombre_tera_prod
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa1)))]<- "Tablas_Produccion_Exadata"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera2)))]<- "Tablas_Arquitectura"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera3)))]<- "Tablas_Proyectos"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera4)))]<- "Tablas_TELCO"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera5)))]<- "Tablas_Dato"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera6)))]<- "Tablas_Usuario"
#V(t_arbol_m_out)$group[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera0)))]<- "Tablas_Proceso"
#V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$group<-nombre_linaje

#V(t_arbol_m_out)$color  <- "azure3"
V(t_arbol_m_out)$shape<-"box"


delete_vertex_attr(t_arbol_m_out,"group")
vertex_attr(t_arbol_m_out)
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera1)))]<-"orange2"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa1)))]<- "indianred3"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera2)))]<- "green"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera3)))]<- "coral"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera4)))]<- "cyan"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera5)))]<- "gold"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera6)))]<- "aquamarine"
#V(t_arbol_m_out)$color[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera0)))]<- "cyan4"
V(t_arbol_m_out)$color[which(V(t_arbol_m_out)$group.groupname==nombre_linaje)]<-color_linaje

#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]<-"Custer Teradata"
#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]<-"Cluster Exadata"
#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]<-"Cluster BDA pro"

#grupos_teradata<-c("Tabla de teradata","Tablas de Producción Teradata","Tablas de Arquitectura","Tablas de Proyectos","Tablas de TELCO","Tablas de dato","Tablas de usuario","Tablas de proceso")
#grupos_exadata<-c("Tabla de exadata","Tablas de Producción Exadata")

## CREACION DEL GRAFO


  #print(paste0("igraph_",y_val,"_",x_val))
name_igraph<-paste0("igraph_",y_val,"_",x_val) 
#igraph<-visIgraph(
visIgraph(
            t_arbol_m_out, 
            physics=TRUE, 
            smooth=FALSE

                     ) %>% 
  visIgraphLayout(
   # layout="layout_nicely", 
    layout="layout_with_sugiyama"
           ) %>% 
  visNodes(
        x=10,y=10, 
    physics=TRUE,   # physics=FALSE,
  # borderWidth=1,
    #borderWidthSelected=1,
    #labelHighlightBold=TRUE,
    font=list(size=10,face="arial")
  )  %>% 
  visEdges(
            arrows="to" ,
            length=1,
              width=1,
            physics=TRUE,
            font= list(size=10,face="arial"),
        smooth= list(
                      enabled=TRUE,
                      type="cubicBezier",#  type="curvedCW",
                      roundness=0.55
                    )
          )  %>%     

  
  #visGroups(groupname="Tablas_Genericas", color="azure3", shape="box") %>% 
  visGroups(groupname=nombre_tera, color=color_tera, shape="box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname=nombre_exada,color=color_exada, shape="box", shadow = list(enabled = TRUE)) %>% 
     visGroups(groupname=nombre_bdapr,color=color_bdapr, shape="box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname=nombre_tera_prod,color=color_tera_prod, shape="box", shadow = list(enabled = TRUE)) %>% 
 visGroups(groupname=nombre_exad_prod ,color=color_exad_prod, shape="box", shadow = list(enabled = TRUE)) %>% 
  visGroups(groupname=nombre_tera_arqu,color=color_tera_arqu, shape="box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname=nombre_tera_proy, color=color_tera_proy, shape="box", shadow = list(enabled = TRUE)) %>% 
    visGroups(groupname=nombre_tera_telco, color=color_tera_telco, shape="box", shadow = list(enabled = TRUE)) %>% 
   visGroups(groupname=nombre_tera_dato, color=color_tera_dato, shape="box", shadow = list(enabled = TRUE)) %>% 
   visGroups(groupname=nombre_tera_usuario, color=color_tera_usuario, shape="box", shadow = list(enabled = TRUE)) %>% 
  visGroups(groupname=nombre_tera_proceso, color=color_tera_proceso, shape="box", shadow = list(enabled = TRUE)) %>% 
 visGroups(groupname=nombre_linaje, color=color_linaje, shape="box", shadow = list(enabled = TRUE)) %>% 

#    visClusteringByGroup(groups="Cluster Teradata", label="Cluster: ",shape="box",color="Orange3") %>% 
#    visClusteringByGroup(groups="Cluster Exadata", label="Cluster: ",shape="box",color=c(background="Red1") %>% 
#    visClusteringByGroup(groups="Cluster BDA pro", label="Cluster: ",shape="box",color=c(background="palegreen3") %>% 
   
    visLegend(
    useGroups=TRUE,
    width=0.2, 
    position="left" , 
    main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
    zoom=FALSE
  ) %>% 
  visLayout(
              improvedLayout=FALSE,
              hierarchical=TRUE
            ) %>%
  visHierarchicalLayout(                                         
              direction="LR", # direction="RL",
             parentCentralization=TRUE, 
             levelSeparation=300, 
             nodeSpacing=200,
              edgeMinimization=TRUE
            ) %>%
    visOptions(
                width="350%",
                height="350%", 
                selectedBy=list(variable="group",multiple=TRUE), 
                autoResize=FALSE,
                clickToUse=TRUE
              )%>%
    visPhysics(              
                enable =TRUE,
                repulsion= list(damping=1),
                hierarchicalRepulsion=list(damping=1)
                )%>%
  visInteraction( 
                dragNodes=TRUE,
                dragView=TRUE,
                hover=TRUE,
                hoverConnectedEdges=TRUE,
                hideEdgesOnDrag=NULL,
                hideNodesOnDrag=NULL,
                keyboard=TRUE,
                multiselect=TRUE,
                navigationButtons=TRUE,
                selectable=TRUE,
                selectConnectedEdges=TRUE,
                tooltipDelay=TRUE,
                tooltipStay=300,
                tooltipStyle=TRUE,
                zoomView=TRUE,
                zoomSpeed=0.75
              )%>% 
  visSave( 
    file=paste0(rutacarpeta,"/",str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE)),"_",x_val,"_",y_val,".html")
  )



#assign(name_igraph,igraph)

 
#visSave(igraph,file=paste0(rutacarpeta,"/",str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE)),"_",x_val,"_",y_val,".html"))
#save(name_igraph, file=paste0(rutaigraphs,"/",name_igraph,".RData") )
# visNetwork-igraph("igraph")
  
    }
    
    
  }
}

