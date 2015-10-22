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



# Multiple Linear Regression Example 
mod <- lm(price ~ make + body_style + engine_size + horsepower + highway_mpg, data=df)
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

predict(mod, newCar, interval = "prediction")