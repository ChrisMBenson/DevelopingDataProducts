
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Car Manufacturers"),

  sidebarLayout(
    sidebarPanel(
      
      selectInput("make", "Choose a make:", 
                  choices = c("alfa-romero","audi","bmw","chevrolet","dodge"
                              ,"honda","isuzu","jaguar","mazda","mercedes-benz"
                              ,"mercury","mitsubishi","nissan","peugot","plymouth"     
                              ,"porsche","renault","saab","subaru","toyota"
                              ,"volkswagen","volvo" )),
      selectInput("body_style", "Choose a body style:", 
                  choices = c("convertible","hardtop","hatchback","sedan","wagon")),
      engine_size = 140
      horsepower = 100
      highway_mpg = 25
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
