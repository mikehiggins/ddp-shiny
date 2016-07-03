#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# load data from csv file
# Original data source https://data.gov.hk/en-data/dataset/hk-dh-dh_ncdd-ncdd-birth-ratencdd/resource/63154e6f-9723-4fcf-bae2-9aa0c20a2a78
births <- read.csv("data/births-by-year.csv")

# Convert to numeric
births$Male.Births <- as.numeric(births$Male.Births)
births$Female.Births <- as.numeric(births$Female.Births)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$barPlot <- renderPlot({
    
    # subset values based on input$year from ui.R
    x <- subset(births, births$Year == input$year)
    
    plotData <- c(x$Female.Births, x$Male.Births)
    #format(plotData, scientific=FALSE)
    
    options(scipen=5)
    
    # draw the barplot with values from the select year
    barplot(plotData,
            names.arg = c("Female", "Male"),
            ylim = c(0,100000),
            xlab = "Gender",
            ylab = "No. of births",
            col = c("blue", "green"),
            cex.axis = 1.2)
    
  })
  
})
