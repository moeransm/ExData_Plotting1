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
#Plot 3
png(filename = "plot3.png", width = 480, height = 480)
with(data, plot(Date_Time, data$Sub_metering_1, xlab = "",
                ylab = "Energy sub metering", type = "l"))
lines(Date_Time, data$Sub_metering_2, col = 'red')
lines(Date_Time, data$Sub_metering_3, col = 'blue')
legend("topright", col = c('black', 'red', 'blue'), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
