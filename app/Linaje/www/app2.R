#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
.GlobalEnv 
library("stringr")

library("shiny")
library("shinyjs")
library("shinyBS")
library("shinythemes")
library("VOSONDash")
library("shinydashboard")
library("shinydashboardPlus")
library("igraph")
library("visNetwork")
library("htmltools")

includeCSS(paste0(rutaapp,"/www/R.css"))

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel(title = "Linaje"),

 
    
  mainPanel(    
    
    
  div( class="grafico",
   
    visNetworkOutput(outputId="myNetworkid", width="900px", height="700px")
  )
  ))
  
                                            
                                           
                                     
                                        
                      
              
    
  


# Define server logic required to draw a histogram
server <- functionserver <- functionserver <- function(input, output) {

 # grafo<-igraph[["x"]][["byselection"]][["enabled"]]=FALSE
  output$myNetworkid <- renderVisNetwork({igraph})
  
 
  
}

# Run the application 
shinyApp(ui = ui, server = server)

