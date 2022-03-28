#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(visNetwork)
library(shiny)


ui <- navbarPage("LINAJE",
                 navbarMenu("OUT",         
                            tabPanel("2",value=="OUT2")),
                           
                 navbarMenu("IN",
                            tabPanel("2",visNetworkOutput("igraphin2")),
                            tabPanel("3",visNetworkOutput("igraphin3")))
 ,mainPanel(
            tabsetPanel(id="OUT",
                      tabPanel(title="tab 2","igraphout 2")),
                      ),
            tabsetPanel(id="IN",
                        tabPanel(title="tab 2","igraphout 2"),
                        tabPanel(title="tab 3","igraphout 3"),
                        tabPanel(title="tab 4","igraphout 4")
            ), VisNetworkOut("data")
                 )
 
 
 
 server <- function(input, output) {
   output$data <- renderVisNetwork({visNetwork(igraph) })
     
 }
shinyApp(ui = ui, server = server)
