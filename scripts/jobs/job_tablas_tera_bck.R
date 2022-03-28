.GlobalEnv
is.environment(.GlobalEnv)

print(paste0("Descargando datos día ",l))
###CONEXIONES
drvv <- JDBC("com.teradata.jdbc.TeraDriver","/Users/jorge/Library/RazorSQL/teradata/terajdbc4.jar")
connn <- dbConnect(drvv,"jdbc:teradata://teradata.tsm.inet/dwgobdp0",'USBGODA','trgr0620')
###FECHA MAXIMA
fx<-dbGetQuery(connn,paste0("select  (max(it_ini_consulta)(date))-",l," from dwgobdp0.god_parser_fin"))
###DATOS
resultado<-dbGetQuery(
connn,
paste0("SELECT distinct '",fx,"'(date) as fecha_query,
trim(cast(co_query_amp as varchar(22))) as co_query,
trim(tabla) as tabla,
trim(tipo) as tipo,
trim(tabla_vista) as tabla_vista,
trim(cast(orden as varchar(3))) as orden
FROM dwgobdp0.god_parser_fin
where it_ini_consulta(date) = '",fx,"'(date)
order by co_query asc, orden  asc "
))
##GUARDAR RESULTADOS LISTA
teradatatablasdia<-list(c(valor=l,resultado))
###GUARDAR RESULTADO POR SEPARADO
assign(paste0("teradia_",l),resultado)

#### MEZCLAR DATOS

if(l==0){
  teradatos<-resultados
}
if(l>0){
  
  
  teradatosunidos<-rbind(teradatos,resultados)
  teradatos<-teradatosunidos
  
}
  

