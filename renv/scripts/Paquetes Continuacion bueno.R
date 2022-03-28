.GlobalEnv
is.environment(.GlobalEnv)
install.packages("crayon")
library(crayon)
install.packages("devtools")
library(devtools)
Lib<-function(xpa){
  .GlobalEnv
  
  print(paste0("¿Está el paquete ",xpa," instalado?  ",is.element(xpa, installed.packages()[,1])))
  
  if (is.element(xpa, installed.packages(lib.loc=NULL)[,1]))
  {
    print(paste0("PAQUETE INSTALADO ",xpa))
    
    print(paste0("¿Esta el paquete ",xpa," ACTUALIZADO?  ",(!is.element(xpa, new.packages()))))
    if (is.element(xpa, new.packages()))
    {
      print(paste0("ACTUALIZANDO PAQUETE ....",xpa))
      
      update.packages(xpaquete, logical.return= TRUE)
      print(paste0("ACTUALIZACION DE ",xpa,"FINALIZADA"))
    }
    print(paste0(xpa,"ESTÁ INSTALADO Y ACTUALIZADO")) 
  }
  else { 
    
    
    print(paste0("INSTALANDO ELEMENTO ...",xpa))
    
    
    install.packages(xpa,repo = "https://cloud.r-project.org")
    
    
    print(paste0("INSTALACION FINALIZADA DE ",xpa))
  }
  
  
  library(xpa,character.only = TRUE,verbose=TRUE,warn.conflicts = FALSE)
  
  
}
#devtools::install_github("r-lib/crayon")
  print("*************************")
  Lib("data.table")
  Lib("easypackages")
  Lib("remotes")
  Lib("crayon")
  Lib("devtools")
  paquetes <- read.table(file = paste0(rutascripts,"/paquetes.txt"),header=TRUE,sep = ";",quote="~")
  options("max.print"=2000)
  
  install_packages(paquetes[,1])
  libraries(paquetes[,1])
  
  for(xfila in 1:nrow(paquetes))
    
  {
  xpa<-paquetes[xfila,1]
 
  print(cat(green("¿Esta el paquete "), bold$green(toupper(xpa)), green(" instalado?  "), ifelse(is.element(xpa, installed.packages()[,1]),green$bold("SI"),red$bold("NO"))))
  
  if (is.element(xpa, installed.packages(lib.loc=NULL)[,1]))
  {
   
    
    print(paste0("¿Esta el paquete ",xpa," ACTUALIZADO?  ",(!is.element(xpa, new.packages()))))
    if (is.element(xpa, new.packages()))
    {
      print(paste0("ACTUALIZANDO PAQUETE ....",xpa))
      
      update_packages(xpa, logical.return= TRUE, warn.conflicts = FALSE)
      print(paste0("ACTUALIZACION DE ",xpa,"FINALIZADA"))
    }
    print(paste0(xpa," está instalado y actualizado"))
  }
  else
 # {if(xrepo=="SOURCE"){install_local(paste0(rutainicial,xfuente))}else
  {
    xpaquetes<- c(paste0("\"", xpa, "\""))
   # install_packages(xpaquetes,repo = "https://cloud.r-project.org",logical.return=TRUE, warn.conflicts = FALSE)
    install_packages(xpa,logical.return=TRUE, warn.conflicts = FALSE)
    
    }
  
  print(paste0("INSTALACION FINALIZADA DE ",xpa))
  
  xpaquetes<- c(paste0("\"", xpa, "\""))
  libraries(xpa)
  
print("FICHERO DE PAQUETES FINALIZADO")
}

  
Lib_file()
  xfuente<-"/LIBS/teradatasql_16.20.0.38.tar.gz"
install.packages(paste0(rutainicial,xfuente),repos = NULL, type = "source",logical.return=TRUE, warn.conflicts = FALSE)

install.packages("/Users/jorge/Documents/R/Linaje/LIB/teradatasql_17.10.0.4.tar",repos = NULL, type = "source")
install.packages("/Users/jorge/Documents/R/Linaje/LIB/tdplyr_17.00.00.01.tar",repos = NULL, type = "source")



load_package(paste0(rutainicial,xfuente))


#devtoolls::install_github("jakesherman/easypackages")


install.packages('teradatasql',repos=c('https://teradata-download.s3.amazonaws.com','https://cloud.r-project.org'))
#install.packages('tdplyr',repos=c('https://teradata-download.s3.amazonaws.com','https://cloud.r-project.org'))





