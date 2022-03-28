### NOMBRE DE LA TABLA ###

hoy <- today()
ahora <- now()
year <- year(hoy)
m <- month(hoy)
d <-day(hoy)
hr <- hour(ahora)
minu <- minute(ahora)
sec <- second(ahora)
cadena_tabla <- c("temp_R_parser_", toString(year),toString(m),toString(d),"_",toString(hr),toString(minu))
nombre_tabla <-paste(cadena_tabla,collapse = "")


#TT$tablas_resultado<-tablas
#tabla_teradata$DatabaseName<-separar_bbdd[1:1]
#tabla_teradata$TableName<-separar_bbdd$TableName
#tabla_teradata$fechaR<-this_day
#tabla_teradata$procesoR<-tabla_analisis
#tabla_teradata$nivelesR<-x_val
#View(tabla_teradata)

print("CARGAMOS TABLA CON DATOS EN TERADATA")
dbWriteTable(con, databasename="dwgobdp0", nombre_tabla , TT, overwrite = TRUE)
dbDisconnect(con)
imax<- as.numeric(10)



### CREAMOS LA TABLA TEMPORAL EN TERADATA ###

## Conexión ##

con <- DBI::dbConnect(teradatasql::TeradataDriver(), host="teradata.tsm.inet", user="USBGODA", password="trgr0520",database="dwgobdp0")


date_maxima<- DBI::dbGetQuery(con,sql("select max(it_ini_consulta)(date) from god_parser_fin"),immediate=TRUE)

vector_fechas<- c()
for(i in 1:imax){
  vector_fechas[i] <- date_maxima+1-i
  VAR_SQL[i]<- paste0("SELECT DISTINCT co_query_amp,tabla,tipo,tabla_vista,orden FROM god_parser_fin WHERE it_ini_consulta(date) = '", vector_fechas[i],"'(date) ORDER BY co_query_amp, orden  ASC ")
}

l0<- "library(data.table)"
l1<-"con <- DBI::dbConnect(teradatasql::TeradataDriver(), host=\"teradata\", user=\"USBGODA\", password=\"trgr0520\",database=\"dwgobdp0\")"
l2<-VAR_SQL[i]
l3<- rs <- dbSendQuery(con,VAR_SQL)
l2<- paste0("source('",ruta,"/parseador.R')")
l3<- paste0(c("datos_q_log_file<- fread('god_datos_q_log_f",proc_lanzados,var_dia,'.tmp',"',sep =';',strip.white=TRUE, encoding='Latin-1',colClasses=list(character=1:5))"),collapse = '')
l4<- "result<- parseador(datos_q_log_file)"
l5<- paste0(c("fwrite(result,'god_result_f",proc_lanzados,var_dia,'.tmp',"',sep =';')"), collapse ='')
l6<- 'quit(save = "no")'
