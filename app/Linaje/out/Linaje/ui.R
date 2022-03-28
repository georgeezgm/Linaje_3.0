#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
install.packages("VOSONDash")
install.packages("https://github.com/vosonlab/VOSONDash/releases/download/v0.5.7/VOSONDash-0.5.7.tar.gz", repo = NULL, type = "fuente")

library(shiny)
library(shinyjs)
library(shinythemes)
library(VOSONDash)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(
  
  dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody()
  )
  
)
