#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Area under a Standard Normal Distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderX",
                  "boundaries", -3, 3, value=c(-1,1), step=0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Norm"),
      h3("Shaded Area:"),
      textOutput("area")
    )
  )
))

