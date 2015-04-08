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
#Check if the data was loaded correctly
head(data)
#We only need data between dates 2007-02-01 and 2007-02-02
#Replace all the data with our subset
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
#Just checking
head(data)
#Histogram, Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
