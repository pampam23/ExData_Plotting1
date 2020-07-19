data_full <- read.csv("~/Desktop/Data_Science_Toolbox/Exploratory_data_analysis/First_assignment/household_power_consumption.txt", sep=";",
                      na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#get the dataset for the requested period
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#transform the Date and Time -- tbh copypasted from some wesbite, still need ti figue out as.POSIXct() function
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#set up 4 plots at once
par(mfrow=c(2,2))
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
})

with(data1, {
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
})

with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data1, {
  plot(Global_reactive_power~Datetime, type="l", xlab="datetime")
})

# Plot 4 - save ong
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
