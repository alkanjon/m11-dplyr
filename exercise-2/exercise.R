# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# Install (if you haven't already) and load the `dplyr`package
library(dplyr)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
wheel.20.cty <- filter(vehicles.1997, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
filtered.worst.mpg <- filter(wheel.20.cty, hwy == min(hwy))
worst.id <- select(filtered.worst.mpg, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
BestMPG <- function(year, make){
  filterd <- filter(vehicles$year == year, vehicles$make == make)
  answer <- select(filter, hwy == max(hwy))
  return(answer)
}

# What was the most efficient honda model of 1995?
BestMPG(1995, 'Honda')

