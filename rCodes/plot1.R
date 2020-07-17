library(foreign)
setwd("~/Desktop/p4e/ExData_Plotting1/rCodes")
dat <- read.csv("~/Desktop/Data_Science_Toolbox/Exploratory_data_analysis/First_assignment/household_power_consumption.txt", sep=";")
#show the plot first
hist(as.numeric(dat$Global_active_power), col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power", breaks = 20)
#save the plot as png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(as.numeric(dat$Global_active_power), col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power", breaks = 20)
dev.off()

