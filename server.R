
#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$Norm <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2] 
    bins <- seq(-3, 3, 0.01)
    
    a<-input$sliderX[1]
    b<-input$sliderX[2]
    
    
    cord.x <- c(a,seq(a,b,0.01),b) 
    cord.y <- c(0,dnorm(seq(a,b,0.01)),0) 
    
    # Make a curve
    curve(dnorm(x,0,1), xlim=c(-3,3), main='Standard Normal Distribution') 
    
    # Add the shaded area.
    polygon(cord.x,cord.y,col='skyblue')
    
  })
  
  AreaInt<-reactive({
    a<-input$sliderX[1]
    b<-input$sliderX[2]
    pnorm(b)-pnorm(a)
  })
  
  output$area<-renderText({AreaInt()})
  
  
})
