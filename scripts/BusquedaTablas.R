
##BUSQUEDA DE TABLAS POR PATRON

xvalor<- str_to_lower(".*D99TGOVT$")

!is.na(str_match(datos_1_vistas$tabla,xvalor))
estalatabla<-which(!is.na(str_match(datos_1_vistas$tabla,xvalor)))
datos_1_vistas[which(!is.na(str_match(datos_1_vistas$tabla,xvalor))),"tabla"]
print(latablaencontrada)