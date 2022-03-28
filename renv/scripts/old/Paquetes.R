.GlobalEnv 
is.environment(.GlobalEnv)
install.packages("crayon")
library(crayon)
install.packages("devtools")
library(devtools)
install.packages("easypackages")
library("easypackages")
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
  library("data.table")
  library("easypackages")
  library("remotes")
  library("crayon")
  library("devtools")
  paquetes <- read.table(file = paste0(rutascripts,"/paquetes.txt"),header=TRUE,sep = ";",quote="~")

  
  install_packages(paquetes[,1])
  libraries(paquetes[,1])
