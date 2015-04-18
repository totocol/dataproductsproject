library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Popular names for babies in South Australia for period 2009-2013"),
  
  # Sidebar with a slider input for the mean, sd and obs
  sidebarLayout(
    sidebarPanel(
      
      
      p("You can find the top 100 most popular names for babies in South Australia between 2009 and 2013. 
        Select the gender, year, and rank. You will see the name in that position for that year and gender. 
        You will also see how that name has changed between 2009 and 2013"),
      
      sliderInput("year",
                  "Year:",
                  min = 2009,
                  max = 2013,
                  value = 2013),
      
      sliderInput("number",
                  "Number:",
                  min = 1,
                  max = 100,
                  value = 1),
      
      selectInput(inputId = "gender",
                  label = "Gender:",
                  choices = c("Male" = "boys", 
                              "Female" = "girls"),
                  selected = "boys"),
      
      p("Data obtained from ",
        a("South Australian Government Open Data Website.", 
          href = "https://data.sa.gov.au/dataset/popular-baby-names"))
           
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
#       verbatimTextOutput("year"),
#       verbatimTextOutput("gender"),
#       verbatimTextOutput("number")
    )
  )
))