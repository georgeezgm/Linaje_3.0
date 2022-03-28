
drvv<-function(n){
  if(n==1){
  drvvv <- JDBC("com.teradata.jdbc.TeraDriver",paste0(rutajdbc,"/terajdbc4.jar"))
  }
  if(n==2){
    drvvv <- JDBC("oracle.jdbc.driver.OracleDriver",paste0(rutajdbc,"/ojdbc8.jar:",rutajdbc,"/orai18n.jar"))
    }
  return(drvvv)
}

conexion_teradata<-function(){
  drvvv<- drvv(1)
  connn <- dbConnect(drvvv,"jdbc:teradata://teradata.tsm.inet/dwgobdp0",'USBGODA','trgr0620')
  return(connn)
}


conexion_exadata<-function(){
  drvvv<- drvv(2)
  connn <- dbConnect(drvvv, "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol033.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol034.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol035.tesa)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=vip-ephol036.tesa)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=PT2BI0_DIRECTO_ODS)))",user="USBGODA", password="oragodatemp1",database="dwgobdp0")
return(connn)
}

