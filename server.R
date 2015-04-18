library(shiny)
library(ggplot2)

source('data/data.R')

# Define server logic required to draw a histogram
shinyServer(
  
  function(input, output) {
    
    # Expression that generates a histogram. The expression is
    # wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should re-execute automatically
    #     when inputs change
    #  2) Its output type is a plot
    
    output$distPlot <- renderPlot({
      
      # Extract input values
      year <- input$year
      gender  <- input$gender
      number    <- input$number
      
      output$year <- renderPrint(year)
      output$gender <- renderPrint(gender)
      output$number <- renderPrint(number)
      
      getNames(gender, number, year) 
    })
  })
