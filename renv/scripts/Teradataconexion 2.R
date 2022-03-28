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
