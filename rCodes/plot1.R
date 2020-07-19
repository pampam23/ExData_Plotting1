library(foreign)
setwd("~/Desktop/p4e/ExData_Plotting1/rCodes")
data_full <- read.csv("~/Desktop/Data_Science_Toolbox/Exploratory_data_analysis/First_assignment/household_power_consumption.txt", sep=";",
                      na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#show the plot 1 first
hist(as.numeric(dat$Global_active_power), col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power", breaks = 20)
#save the plot as png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(as.numeric(dat$Global_active_power), col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power", breaks = 20)
dev.off()

