library(dplyr)

# Cologne
cologne <- read.csv("./Data/Cologne.csv", 
                    header = TRUE,
                    sep = ";")
names(cologne) <- c("Year", "Population")
cologne$city <- "Cologne"

# Berlin
berlin <- read.csv("./Data/Berlin.csv", 
                   header = TRUE,
                   sep = ";")
names(berlin) <- c("Year", "Population")
berlin$city <- "Berlin"

# Hamburg
hamburg <- read.csv("./Data/Hamburg.csv", 
                    header = TRUE,
                    sep = ";")
names(hamburg) <- c("Year", "Population")
hamburg$city <- "Hamburg"

# Munich
munich <- read.csv("./Data/Munich.csv", 
                   header = TRUE,
                   sep = ";")
names(munich) <- c("Year", "Population")
munich$city <- "Munich"

data <- rbind(cologne, berlin, hamburg, munich)

write.csv(data, 'data.csv')