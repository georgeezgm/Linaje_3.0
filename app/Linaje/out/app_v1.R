#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
.GlobalEnv
library(stringr)
library(shiny)
library(shinythemes)

setwd(rutadatossalida)

carpetastablasfull <- list.dirs(
  path=rutadatossalida,
  full.names=TRUE,
  recursive=FALSE
)
carpetasficherosfull<-list.files(
  path=c(carpetastablasfull),
  all.files=FALSE,
  full.names=TRUE,
  recursive=FALSE,
  include.dirs = FALSE,
  no.. = FALSE
)

archivos<-data.frame(
  paste0("/",carpetasficherosfull),
  dirname(carpetasficherosfull),
  str_remove(dirname(carpetasficherosfull), pattern=paste0(rutadatossalida,"/")),
  basename(carpetasficherosfull),
  str_remove(basename(carpetasficherosfull), pattern="\\...(..|.)$")
)
names(archivos)<- c('ficherofull','carpetafull','directorio','fichero','ficheroname')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Linaje"),

  
        # Show a plot of the generated distribution
        mainPanel(
           visNetworkOutput(outputId="myNetworkid")
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$mynetworkid <- renderVisNetwork({
    toVisNetworkData(igraph_in_2)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
