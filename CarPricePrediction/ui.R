
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Car Price Prediction"),

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
      
      sliderInput("engine_size", "Engine Size:",
                  min=60, max=330, value=128),
      
      sliderInput("horsepower", "Horsepower:",
                  min=48, max=280, value=105),
      
      sliderInput("highway_mpg", "Highway MPG:",
                  min=16, max=60, value=30)

      
    ),

    # Show tabs
    mainPanel(
      
      tabsetPanel(type = "tabs", 
                  tabPanel("Prediction",
                           h2("Predicted Value:"),
                           h3(verbatimTextOutput("prediction")),
                           h4("Selected Variables:"),
                           tableOutput("selectedVariables"),
                           h4("Filtered Make:"),
                           tableOutput("filteredCars")       
                           ), 
                  tabPanel("Model Summary Statistics", 
                           verbatimTextOutput("modelsummary")), 
                  tabPanel("Make vs Price Plot", 
                           plotOutput("distPlot")), 
                  tabPanel("Vehicle Summary Statistics", verbatimTextOutput("summary")),
                  tabPanel("Help", 
                            tags$p("Depending on the size of your screen you may need to scroll down to see the showcase data and help. A slide summary can be found in the below link:"), 
                            tags$a(href = "http://rpubs.com/ChrisMBenson/120766", "Click Here!")
                           )
            )
))))
