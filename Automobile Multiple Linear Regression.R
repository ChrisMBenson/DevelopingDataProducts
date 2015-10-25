
dfCars <- read.csv("CarPricePrediction/data/Automobile.csv", na.strings="?")

dfCars <- dfCars[-c(1,2)] 

dfCars <- dfCars[complete.cases(dfCars),]

levels(dfCars$make)
levels(dfCars$body_style)

dev.new(width=10, height=8)

make = dfCars$make
price = dfCars$price
plot(make, price, ylab="Price ($)", xlab="Car Manufacturer")
abline(lm(price~make))

carVars <- c("make", "body_style", "engine_size", "horsepower", "highway_mpg", "price" )
filter_dfCars <- dfCars[carVars, "audi"]

newdata <- subset(dfCars, make == "audi",select=c("make", "body_style", "engine_size", "horsepower", "highway_mpg", "price")


summary(dfCars)

# Multiple Linear Regression Example 
mod <- lm(price ~ make + body_style + engine_size + horsepower + highway_mpg, data=dfCars)
summary(mod) # show results

# Other useful functions 
coefficients(mod) # model coefficients
confint(mod, level=0.95) # CIs for model parameters 
fitted(mod) # predicted values
residuals(mod) # residuals
anova(mod) # anova table 
vcov(mod) # covariance matrix for model parameters 
influence(mod) # regression diagnostics


layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(mod)


make = "nissan"
body_style = "sedan"
engine_size = 140
horsepower = 100
highway_mpg = 25

newCar <- data.frame(make, body_style, engine_size, horsepower, highway_mpg) 

pred <- predict(mod, newCar, interval = "prediction")

tabPanel("Help and About", 
         
         p("The dataset comes from the UCI Machine Learning Repository and can be downloaded here: https://archive.ics.uci.edu/ml/datasets/Automobile."
           "The application is fully reactive, reacting to a change in any of the input values. Initially default values are selected and a prediction is shown. Chaning any of the" 
           "inputs will create a new prediction and filter out records where necessary.")
         
)




