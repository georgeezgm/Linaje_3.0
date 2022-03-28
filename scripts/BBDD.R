
library(DBI)
library(tdplyr)
library(odbc)
library(teradatasql)
library(RODBC)
### CREAMOS LA TABLA TEMPORAL EN TERADATA ###

## Conexión ##

con <- DBI::dbConnect(odbc::odbc(),teradatasql::TeradataDriver(), host="teradata.tsm.inet", user="USBGODA", password="trgr0520",database="dwgobdp0")
con <- DBI::dbConnect(teradatasql::TeradataDriver(), host="teradata.tsm.inet", user="USBGODA", password="trgr0520",database="dwgobdp0")
mi_tabla
Existe_tabla<- dbExistsTable(con,"god_parser_fin")

if (Existe_tabla == "TRUE"){
  print ("Existe tabla dwgobp0.god_parser_fin")
} else {
  print ("NO existe tabla dwgobp0.god_parser_fin")
}

date_maxima<- DBI::dbGetQuery(con,sql("select max(it_ini_consulta)(date) from god_parser_fin"),immediate=TRUE)
date_min<- DBI::dbGetQuery(con,sql("select (max(it_ini_consulta)(date))-10 from god_parser_fin"),immediate=TRUE)
dbColumnInfo(con,"god_parser_fin");

VAR_SQL<- paste0("SELECT DISTINCT co_query_amp,tabla,tipo,tabla_vista,orden FROM god_parser_fin WHERE it_ini_consulta(date) BETWEEN '", as.character.Date(date_min),"'(date) and '",  as.character.Date(date_maxima), "'(date) ORDER BY co_query_amp, orden  ASC ")

rs <- dbSendQuery(con,VAR_SQL)
DBI::dbFetch(rs)
DBI::show_query(rs)

# select * from  dwgobdp0.god_parser_fin
# SELECT distinct 
# trim(cast(co_query_amp as varchar(22))) as co_query,
# trim(tabla) as tabla,
# trim(tipo) as tipo,
# trim(tabla_vista) as tabla_vista,
# trim(cast(orden as varchar(3))) as orden
# 
# 
# FROM dwgobdp0.god_parser_fin
# where it_ini_consulta(date) between date-10 and date 
# 
# order by 
# co_query, orden  asc 
# 
# CREATE TABLE as 
# SELECT distinct 
# *
#   FROM dwgobdp0.god_parser_fin
# where it_ini_consulta(date)=date-30
# ]]]

## Creamos Tabla Vacia en Teradata ##

DBI::dbCreateTable(con, databasename="dwgobdp0", nombre_tabla , fields= c(procesoR="varchar(20) NOT NULL", fechaR="date",tabla_analisis = "varchar(50) NOT NULL",tabla_resultado = "varchar(50) NOT NULL",database_name = "varchar(30) NOT NULL",tabla_name = "varchar(50) NOT NULL",INOUT = "varchar(3)", nivelesR="varchar(2) NOT NULL"))

# LEER TABLA-> DBI::dbReadTable(con, databasename="dwgobdp0", nombre_tabla)
#rm(TT)
TT<-as.data.frame(matrix(ncol=7))
names(TT)<-c("Tabla","DatabaseName","TableName","TablaAnalisis","Fecha","IN/OUT","Niveles")


## Leer una Tabla ##

DBI::dbReadTable(con, databasename="dwgobdp0", nombre_tabla)

## Crear tabla TT que subiremos al final a Teradata
var_sql <- SQL("
SELECT distinct 
trim(cast(co_query_amp as varchar(22))) as co_query,
trim(tabla) as tabla,
trim(tipo) as tipo,
trim(tabla_vista) as tabla_vista,
trim(cast(orden as varchar(3))) as orden


FROM dwgobdp0.god_parser_fin
where it_ini_consulta(date) between date-10 and date 

order by 
co_query, orden  asc ")
dbExistsTable(con,"god_parser_fin") #Existe la tabla?
q<- DBI::dbGetQuery(con,sql("
SELECT distinct 
trim(cast(co_query_amp as varchar(22))) as co_query,
trim(tabla) as tabla,
trim(tipo) as tipo,
trim(tabla_vista) as tabla_vista,
trim(cast(orden as varchar(3))) as orden
FROM dwgobdp0.god_parser_fin
where it_ini_consulta(date) between date-10 and date 
order by co_query, orden  asc "),immediate = TRUE)

t<- collect(q)

DBI::dbReadTable(con, databasename="dwgobdp0", sql("SELECT TOP 1 * FROM god_parser_fin"))
DBI::dbListTables(con)

con %>% tbl(sql("SELECT * FROM JEG_GDUSGETT"))
library(dplyr.teradata)
mi_tabla <- tbl(con, 'god_parser_fin')
q<- mi_tabla %>%
  filter(between(it_ini_consulta, to_date("2020-05-14"),   to_date("2020-05-24")))%>%
  arrange (co_query_amp ,orden) 

show_query(q)
df <- q %>% collect
vars_campos<- c("trim(cast(co_query_amp as varchar(22)))","trim(tabla)","trim(tipo)","trim(tabla_vista)","trim(cast(orden as varchar(3)))" )
vars_campos<- c("co_query_amp","tabla","tipo","tabla_vista","orden" )

vars_order<-c('co_query','orden')
# consulta
DBI::dbBegin(con)
DBI::dbExecute(con,"BT")
DBI::dbExecute(con,var_sql)
DBI::dbExecute(con,sql("SELECT  * FROM god_parser_fin"))
q <- mi_tabla %>% 
  select(vars_campos)
filter(between(it_ini_consulta, this_day-10, this_day)) %>%
  arrange(asc(vars_order))
show_query(q)
