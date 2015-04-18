library(ggplot2)

# load the data sets
boys  <- read.csv("data/boys.csv")
girls <- read.csv("data/girls.csv")

# Function to pre-process the data
preProcess <- function(sex){
  
  # extract the relevant information based on user choice
  if (sex == "boys"){
    data <- boys
  }
  if (sex == "girls"){
    data <- girls
  }
  


# pre-process both the data sets
boys_data <- preProcess("boys")
girls_data <- preProcess("girls")

getNames <- function(sex, n, year) {
  
  # extract the relevant information based on user choice
  if (sex == "boys"){
    data <- boys_data
  }
  if (sex == "girls"){
    data <- girls_data
  }
  
  # get the names for the top n ranks for a specific year
  DF <- with(data, subset(data, Year == year & Rank == n))
  names <- DF$Name
  
  # subset all years with this filter
  DF1 <- with(data, subset(data, Name %in% names))
  
  # Plot the graph
  p1 <- ggplot(data = DF1, aes(x = Year, y = Number, fill = Name))
  
  # This is necessary since you want one line per samples rather than for each data point
  p1 + geom_line(aes(colour = Name, group = Name)) + 
    labs(title = 'Most Popular Baby Names 2009 - 2013',
         y = 'Number of babies', x = 'Year', fill = 'Name')
}
}