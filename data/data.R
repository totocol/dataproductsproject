library(ggplot2)

# load the data sets
boys_data  <- read.csv("data/boys.csv")
girls_data <- read.csv("data/girls.csv")

#Function to get the names based on the gender, n rank and year
getNames <- function(gender, n, year) {
  
  # extract the relevant information based on user choice
  if (gender == "boys"){
    data <- boys_data
  }
  if (gender == "girls"){
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
