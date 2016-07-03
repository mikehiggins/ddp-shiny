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
                   sep=""),
       h4("How to use this app"),
       p("The plot shows the numbers of female and male births per year. Drag the slider to update the
         plot and see how the ratio changes from one year to the next.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("barPlot"),
       p("Data source: Hong Kong Government Data.One Portal - https://goo.gl/F9XJtN")
    )
  )
))
