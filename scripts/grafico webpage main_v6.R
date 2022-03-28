
.GlobalEnv
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

##VARIABLES
x <- c(3,6)
y <- c("in","out")
##FIN VARIABLES

setwd(rutadatossalida)

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
  if(dir.exists(rutacarpeta)==TRUE)
{
    ficheros<-list.files(path=rutacarpeta,pattern="html$",all.files=FALSE,full.names=FALSE,recursive=FALSE,include.dirs=FALSE)     
    
    if(length(ficheros)!=0)
  {
         subcarpeta<-as.character(Sys.time())
         setwd(rutacarpeta)
         rutasubcarpeta<-(paste0(rutacarpeta,"/",subcarpeta))
         ficheros<-list.files(path=rutacarpeta,pattern="html$",all.files=FALSE,full.names=FALSE,recursive=FALSE,include.dirs=FALSE)     
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
# }
  
  setwd(rutacarpeta)
  

  # Montamos grafo
  
  dt <- decompose.graph(t)
  
  for (i in 1:length(dt))
  {
    if (length(V(dt[[i]]))>0 & length(which(V(dt[[i]])$name== tabla_analisis))>0) {comp_conxa_tabla_t<- i; print(i)}
  }
  
for(y_val in y)
  {
     print(paste0("       ",y_val))
    
    for (x_val in x) 
    {
      
      print(paste0("          NIVEL: ",x_val))
      rm(t_arbol_m_out)
      t_arbol_m_out<-x_make_arbol(x_val,y_val)
      name_t_arbol<-paste0("t_arbol_m_",y_val,"_",x_val)
      assign(name_t_arbol,t_arbol_m_out)
##ASIGNACION DE ATRIBUTOS ESTATICOS DEL IGRAPH
  #FORMA
      V(t_arbol_m_out)$shape<-"box"
  #PATRON,COLOR Y GRUPO
   
     patron_tera<-'^1'
    nombre_tera<-"Tablas_Teradata"
    color_tera<-"#FF8C00" #darkorange
    if(Existe_Vertice(patron_tera)=="SI"){
    print(paste0("Existen ",nombre_tera))
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]$group<- nombre_tera
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]$color<- color_tera
}else{print(paste0(" No Existen ",nombre_tera))}
    
    patron_exada<-'^2'
    nombre_exada<-"Tablas_Exadata"
    color_exada<- "#B22222" #firebrick
    if(Existe_Vertice(patron_exada)=="SI"){
      print(paste0("Existen ",nombre_exada))
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$group<- nombre_exada
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]$color<-color_exada
 }else{print(paste0(" No Existen ",nombre_exada))}
    
    patron_bdapr<-'^3'
    nombre_bdapr<-"Tablas_BDA"
    color_bdapr<- "#4169E1" #royalblue
    if(Existe_Vertice(patron_bdapr)=="SI"){
      print(paste0("Existen ",nombre_bdapr))
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$group<- nombre_bdapr
    V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]$color<-color_bdapr
    }else{print(paste0(" No Existen ",nombre_bdapr))}
    
    

patron_tera_prod<-'^1\\.dwbasep0'
nombre_tera_prod<-"Tablas_Prod_Teradata"
color_tera_prod<-"#D2691E" #chocolate3
if(Existe_Vertice(patron_tera_prod)=="SI"){
  print(paste0("Existen ",nombre_tera_prod))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_prod)))]$group<- nombre_tera_prod
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_prod)))]$color<- color_tera_prod
}else{print(paste0(" No Existen ",nombre_tera_prod))}

patron_exad_prod<-'^2\\.dwbasep0'
nombre_exad_prod<-"Tablas_Prod_Exadata"
color_exad_prod<-"#B22222" #Coral
if(Existe_Vertice(patron_exad_prod)=="SI"){
  print(paste0("Existen ",nombre_exad_prod))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exad_prod)))]$group<- nombre_exad_prod
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exad_prod)))]$color<- color_exad_prod
}else{print(paste0(" No Existen ",nombre_exad_prod))}

patron_tera_arqu<-'^1\\.dwtbjop0'
nombre_tera_arqu<- "Tablas_Arquitectura_Teradata"
color_tera_arqu<-"#FFB90F" #darkGoldenrod1
if(Existe_Vertice(patron_tera_arqu)=="SI"){
  print(paste0("Existen ",nombre_tera_arqu))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_arqu)))]$group<- nombre_tera_arqu
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_arqu)))]$color<- color_tera_arqu
}else{print(paste0(" No Existen ",nombre_tera_arqu))}

patron_exa_arqu<-'^2\\.dwtbjop0'
nombre_exa_arqu<- "Tablas_Arquitectura_Exadata"
color_exa_arqu<-"#FFA07A" #lightsalmon1
if(Existe_Vertice(patron_exa_arqu)=="SI"){
  print(paste0("Existen ",nombre_exa_arqu))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa_arqu)))]$group<- nombre_exa_arqu
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exa_arqu)))]$color<- color_exa_arqu
}else{print(paste0(" No Existen ",nombre_exa_arqu))}

patron_tera_proy<-'^1\\.d.(pryv|ract|proy|pmpy)'
nombre_tera_proy<- "Tablas_Proyectos"
color_tera_proy<-"#87CEFA" #lightSkyBlue
if(Existe_Vertice(patron_tera_proy)=="SI"){
  print(paste0("Existen ",nombre_tera_proy))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proy)))]$group<- nombre_tera_proy
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proy)))]$color<- color_tera_proy
}else{print(paste0(" No Existen ",nombre_tera_proy))}

patron_tera_telco<-'^1\\.tebasep0'
nombre_tera_telco<- "Tablas_TELCO"
color_tera_telco<-"#B22222"
if(Existe_Vertice(patron_tera_telco)=="SI"){
  print(paste0("Existen ",nombre_tera_telco))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_telco)))]$group<- nombre_tera_telco
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_telco)))]$color<- color_tera_telco
}else{print(paste0(" No Existen ",nombre_tera_telco))}

patron_tera_dato<-'^1\\...oputp0'
nombre_tera_dato<- "Tablas_Dato"
color_tera_dato<-"#008B8B"
if(Existe_Vertice(patron_tera_dato)=="SI"){
  print(paste0("Existen ",nombre_tera_dato))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_dato)))]$group<- nombre_tera_dato
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_dato)))]$color<- color_tera_dato
}else{print(paste0(" No Existen ",nombre_tera_dato))}

#patron_tera_usuario<-'^1\\.d(w|9)gr(a|b)(v|t)p0'
patron_tera_usuario<-'dwgravp0|d9gravp0|dwgratp0|d9gratp0'
nombre_tera_usuario<- "Tablas_Usuario"
color_tera_usuario<-"#C1FFC1"
if(Existe_Vertice(patron_tera_usuario)=="SI"){
  print(paste0("Existen ",nombre_tera_usuario))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name,patron_tera_usuario)))]$group<- nombre_tera_usuario
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_usuario)))]$color<- color_tera_usuario
}else{print(paste0(" No Existen ",nombre_tera_usuario))}

nombre_linaje<-"Tabla_Linaje"
color_linaje<- "#CD69C9" #orchid3

V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$group<-nombre_linaje
V(t_arbol_m_out)[V(t_arbol_m_out)$name==tabla_analisis]$color<-color_linaje

patron_tera_proceso<-'carga|pro|aux|pr_'
nombre_tera_proceso<- "Tablas_Proceso"
color_tera_proceso<-"#EEE5DE" #seashell2
if(Existe_Vertice(patron_tera_proceso)=="SI"){
  print(paste0("Existen ",nombre_tera_proceso))
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proceso)))]$group<- nombre_tera_proceso
V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera_proceso)))]$color<- color_tera_proceso
}else{print(paste0(" No Existen ",nombre_tera_proceso))}



#delete_vertex_attr(t_arbol_m_out,"group")
#vertex_attr(t_arbol_m_out)
#
#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))]<-"Custer Teradata"
#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))]<-"Cluster Exadata"
#V(t_arbol_m_out)$cluster[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))]<-"Cluster BDA pro"

#grupos_teradata<-c("Tabla de teradata","Tablas de Producción Teradata","Tablas de Arquitectura","Tablas de Proyectos","Tablas de TELCO","Tablas de dato","Tablas de usuario","Tablas de proceso")
#grupos_exadata<-c("Tabla de exadata","Tablas de Producción Exadata")

## CREACION DEL GRAFO


#print(paste0("igraph_",y_val,"_",x_val))
name_igraph<-paste0("igraph_",y_val,"_",x_val) 
name_image_igraph<-paste0("igraph_image_",y_val,"_",x_val) 

igraph<-visIgraph(
#visIgraph(
            t_arbol_m_out, 
            physics=TRUE, 
            smooth=FALSE
                     ) %>% 
  visIgraphLayout(
    layout="layout_nicely", 
    #layout="layout_with_sugiyama"
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
  addFontAwesome(name = "font-awesome-visNetwork")%>% 
  addIonicons()%>% 

#    visClusteringByGroup(groups="Cluster Teradata", label="Cluster: ",shape="box",color="Orange3") %>% 
#    visClusteringByGroup(groups="Cluster Exadata", label="Cluster: ",shape="box",color=c(background="Red1") %>% 
#    visClusteringByGroup(groups="Cluster BDA pro", label="Cluster: ",shape="box",color=c(background="palegreen3") %>% 
   
  #visLegend(
  #  useGroups=TRUE,
  #  width=0.2, 
  #  position="left" , 
  #  main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
  #  zoom=FALSE
  #) %>% 
  visLayout(
              improvedLayout=FALSE,
              hierarchical=TRUE
            ) %>%
  visHierarchicalLayout(                                         
            direction="LR",
            parentCentralization=TRUE, 
           levelSeparation=300, 
          nodeSpacing=300,
            edgeMinimization=TRUE
            ) %>%
  visOptions(
             #  width="200%",
            #  height="200%", 
               
                #selectedBy=list(variable="group",multiple=TRUE), 
                autoResize=TRUE,
                clickToUse=TRUE,
                collapse=TRUE
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
                hideEdgesOnDrag=TRUE,
                hideNodesOnDrag=NULL,
                keyboard=TRUE,
                multiselect=TRUE,
                navigationButtons=TRUE,
                selectable=TRUE,
                selectConnectedEdges=TRUE,
                tooltipDelay=FALSE,
                tooltipStay=FALSE,
                tooltipStyle=TRUE,
                zoomView=TRUE,
                zoomSpeed=0.5
              )




  visSave( 
              igraph,file=paste0(rutacarpeta,"/",str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE)),"_",x_val,"_",y_val,".html")
         )
  
  image_igraph<-igraph
  image_igraph[["x"]][["options"]][["interaction"]][["navigationButtons"]]= FALSE
  image_igraph[["x"]][["byselection"]][["enabled"]]=FALSE
  #jpeg(file = paste0(name_igraph,".jpeg"))
#  plot(image_igraph)
 # dev.off()
  #visSave(image_igraph,file=paste0(rutacarpeta,"/",str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE)),"_",x_val,"_",y_val,".jpg"))

app_tablas_teradata<-length(V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_tera)))])
app_tablas_exadata<-length(V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_exada)))])
app_tablas_bda_prod<-length(V(t_arbol_m_out)[which(!is.na(str_match(V(t_arbol_m_out)$name, patron_bdapr)))])
name_app_tablas_teradata<-paste0("app_tablas_teradata_",y_val,"_",x_val) 
name_app_tablas_exadata<-paste0("app_tablas_exadata_",y_val,"_",x_val) 
name_tapp_tablas_bda_prod<-paste0("app_tablas_bda_prod_",y_val,"_",x_val) 

assign(name_igraph,igraph)
assign(name_image_igraph,image_igraph)
assign(name_app_tablas_teradata,app_tablas_teradata)
assign(name_app_tablas_exadata,app_tablas_exadata)
assign(name_tapp_tablas_bda_prod,app_tablas_bda_prod)

 
#visSave(igraph,file=paste0(rutacarpeta,"/",str_to_upper(sub(".","_",tabla_analisis,ignore.case=FALSE, perl=FALSE,fixed=TRUE, useBytes=FALSE)),"_",x_val,"_",y_val,".html"))
#save(name_igraph, file=paste0(rutaigraphs,"/",name_igraph,".RData") )
# visNetwork-igraph("igraph")
      
    }
    
    
  }
}

