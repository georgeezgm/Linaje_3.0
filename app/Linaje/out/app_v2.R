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
library(visNetwork)

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
  output$myNetworkid <- renderVisNetwork({
    visIgraph(
      t_arbol_m_out, 
      physics = TRUE, 
      smooth=FALSE
    ) %>% 
      visIgraphLayout(
        # layout = "layout_nicely", 
        layout = "layout_with_sugiyama"
      ) %>% 
      visNodes(
        x=10,y=10, 
        physics = TRUE,   # physics = FALSE,
        borderWidth=1,
        borderWidthSelected=1,
        labelHighlightBold=TRUE,
        font = list(size=10,face="arial")
        
        
      )  %>% 
      visEdges(
        arrows = "to" ,
        length=1,
        width=1,
        physics = TRUE,
        font= list(size=10,face="arial"),
        smooth= list(
          enabled=TRUE,
          type="cubicBezier",#  type="curvedCW",
          roundness=0.55
        )
      )  %>%            
      
      visGroups(groupname = "dwbasep0" , color= "skyblue",  shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "dwturmp0", color= "green", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "proyectos", color= "coral", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "tebasep0", color= "cyan", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "oputp0", color= "gold", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "gra o grb", color= "aquamarine", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "intermedias", color= "darkcyan", shape = "box", shadow = list(enabled = TRUE)) %>% 
      visGroups(groupname = "tabla del Linaje", color= "blueviolet", shape = "box", shadow = list(enabled = TRUE)) %>% 
      
      visLayout(
        improvedLayout = FALSE
        
      ) %>%
      visHierarchicalLayout(
        direction = "LR", # direction = "RL", 
        
        #parentCentralization=TRUE, 
        levelSeparation = 300, 
        nodeSpacing=200,
        edgeMinimization = TRUE
        
      ) %>%
      visLegend(
        useGroups=TRUE,
        width=0.2, 
        
        position="left" , 
        main=list(text= "AGRUPACIONES DE BASES DE DATOS", style="font-family:Times New Roman;serif;font-weight:bold;font-size:14px;text-align:center"),
        #zoom=TRUE
        zoom=FALSE
      ) %>% 
      visOptions(
        width="350%",
        height="350%", 
        selectedBy = list(variable="group",multiple=TRUE), 
        autoResize=FALSE,
        clickToUse=TRUE
      )%>%
      visPhysics(              
        enable =TRUE,
        repulsion= list(damping = 1),
        hierarchicalRepulsion = list(damping = 1)
      )%>%
      visInteraction( 
        dragNodes = TRUE,
        dragView = TRUE,
        hover = TRUE,
        hoverConnectedEdges = TRUE,
        hideEdgesOnDrag = NULL,
        hideNodesOnDrag = NULL,
        keyboard = TRUE,
        multiselect = TRUE,
        navigationButtons = TRUE,
        selectable = TRUE,
        selectConnectedEdges = TRUE,
        tooltipDelay = TRUE,
        tooltipStay = 300,
        tooltipStyle = TRUE,
        zoomView = TRUE,
        zoomSpeed = 0.75
      )
    
  })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
