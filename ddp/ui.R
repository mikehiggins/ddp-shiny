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
  titlePanel("Birth rate mix by birth year"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("year",
                   "Year of birth:",
                   min = 1961,
                   max = 2014,
                   value = 1980,
                   sep="")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("barPlot")
    )
  )
))
