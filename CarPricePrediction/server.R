
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  #read the the dataset into a dataframe
  dfCars <- read.csv("data/Automobile.csv", na.strings="?")
  
  
  #Data Cleanup
  dfCars <- dfCars[-c(1,2)] 
  
  dfCars <- dfCars[complete.cases(dfCars),]
  
  
  smake = dfCars$make
  sprice = dfCars$price

  #Linear regression
  mod <- lm(price ~ make + body_style + engine_size + horsepower + highway_mpg, data=dfCars)

  
  #inital prediction and subsequent predictions  
  output$prediction <- renderPrint({
  
    make = input$make
    body_style = input$body_style
    engine_size = input$engine_size
    horsepower = input$horsepower
    highway_mpg = input$highway_mpg
    
    newCar <- data.frame(make, body_style, engine_size, horsepower, highway_mpg) 
    
    predict(mod, newCar, interval = "prediction")
    
  })
  
  # Generate an HTML table view of the variables
  output$selectedVariables <- renderTable({
  
    make = input$make
    body_style = input$body_style
    engine_size = input$engine_size
    horsepower = input$horsepower
    highway_mpg = input$highway_mpg
    
    newCar <- data.frame(make, body_style, engine_size, horsepower, highway_mpg) 
    data.frame(x=newCar)
  })

  # Generate an HTML table view of the data filtered by make
  output$filteredCars <- renderTable({
    
    filter_dfCars <- subset(dfCars, make == input$make, select=c("make", "body_style", "engine_size", "horsepower", "highway_mpg", "price"))
    data.frame(x=filter_dfCars)
    
  })
  
  # Generate a summary of the data
  output$modelsummary <- renderPrint({
    summary(mod)
  })

  output$distPlot <- renderPlot({
    # draw the plot of the data
    plot(smake, sprice, ylab="Price ($)", xlab="Car Manufacturer")

  })

  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(dfCars)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(x=dfCars)
  })
  
  
})
