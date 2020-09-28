#
setwd("D:/Ciencia de datos/r/Exploratory Data Analysis")
electric <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
electric$day <- strptime(paste(electric$Date,electric$Time, sep = ":"), format = '%d/%m/%Y:%H:%M:%S')
subElectric <- electric[as.Date(electric$day)<"2007-02-03"&as.Date(electric$day)>="2007-02-01", ]

png(filename = "plot1.png", width = 480, height = 480)
hist(subElectric$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")	 # plot 1
dev.off()
