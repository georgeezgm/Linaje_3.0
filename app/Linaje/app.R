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
setwd(rutaapp)

includeCSS(paste0(rutaapp,"/www/R.css"))
# Define UI for application that draws a histogram

header <- dashboardHeader(title = "Linaje"
                      #   ,t sidebarMenu(
                      #      menuItem("Sub-item OUT", tabName = "subitem1", icon = icon("line"))
                      #    )
                          )
sidebar <- dashboardSidebar(  
                    sidebarMenu(
                                menuItem(
                                         tabla_analisis, 
                                         tabName = "myNetworkid", 
                                         icon = icon("table")
                                         )
                                 )
)


ui <- dashboardPage(
  header,
  sidebar,
 # dashboardSidebar(
    
   
             #   sidebarMenuOutput("menu")
                
  #menuItem(tabla_analisis, tabName = "myNetworkid", icon = icon("table"))
  #    menuSubItem("Sub-item OUT", tabName = "subitem1", icon = icon("line")),        
  #    menuSubItem("Sub-item IN", tabName = "subitem2")

      dashboardBody(    
                  fluidRow(
                          valueBoxOutput("progressBox"),
                          valueBoxOutput("progressBox2"),
                          valueBoxOutput("approvalBox")
                           ),
                  fluidRow(
                          box(
                              title = paste0("Salida ",y_val," con ",x_val," niveles."), 
                              width = 12, 
                              status = "primary", 
                              solidHeader = TRUE,
                              collapsible = TRUE,
                              visNetworkOutput(
                                              outputId="myNetworkid",
                                              height = "600"
                                              )
                              )
                          )
                                            
                      )  
)
                                     
                                        
                      
              
    
  


# Define server logic required to draw a histogram
server <- functionserver <- functionserver <- function(input, output) {

  output$myNetworkid <- renderVisNetwork({image_igraph})
  
  output$progressBox <- renderValueBox({
    valueBox(
      as.integer(app_tablas_teradata), "Teradata", icon = icon("database"),color="orange"    )
  })
  output$progressBox2 <- renderValueBox({
    valueBox(
      as.integer(app_tablas_exadata), "Exadata", icon = icon("database"),color="red"    )
  })
  output$approvalBox <- renderValueBox({
    valueBox(
      
      as.integer(app_tablas_bda_prod), "BDA produccón", icon = icon("database"),color="blue"    )
    
  })
  
 # output$menu<-renderMenu({
#    for(xvalor in grupo_tablas_analisis){
      
 #     menuItem(xvalor, icon = icon("table"))
      
      
  #  }
  #})
  
}

# Run the application 
shinyApp(ui = ui, server = server)

