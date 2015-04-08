setwd("~/Box Sync/Coursera/Exploratory Data Analysis/Project1")
#Download the data
if(!file.exists("HouseholdPowerComsumption.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url = fileUrl, destfile = "HouseholdPowerComsumption.zip", method = "curl")
        downloadDate <- date()
}
#Load the data
data <- read.table(file = "household_power_consumption.txt",
                   header = T, sep = ";", na.strings = "?")
#Subset the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
#Formatting the date and time
Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %T")
##Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#1
with(data, plot(Date_Time, data$Global_active_power, xlab = "",
                ylab = "Global Active Power (kilowatts)", type = 'l'))
#2
plot(Date_Time, data$Voltage, xlab = "datetime", ylab = "voltage", type = 'l')
#3
plot(Date_Time, data$Sub_metering_1, xlab = "",
                ylab = "Energy sub metering", type = 'l')
lines(Date_Time, data$Sub_metering_2, col = 'red')
lines(Date_Time, data$Sub_metering_3, col = 'blue')
legend("topright", col = c('black', 'red', 'blue'), lty = 1, xjust = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(Date_Time, data$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = 'l')
dev.off()
