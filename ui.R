library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Names of babies in South Australia for period 1944-2013"),
  
  # Sidebar with a slider input for the mean, sd and obs
  sidebarLayout(
    sidebarPanel(
      
      
      p("You can find what the most popular names for babies were for the years between 1944 and 2013."),
      
      sliderInput("year",
                  "Year:",
                  min = 2009,
                  max = 2013,
                  value = 2013),
      
      sliderInput("number",
                  "Number:",
                  min = 1,
                  max = 20,
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
#       verbatimTextOutput("sex"),
#       verbatimTextOutput("number")
    )
  )
))