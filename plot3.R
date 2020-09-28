#
setwd("D:/Ciencia de datos/r/Exploratory Data Analysis")
electric <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
electric$day <- strptime(paste(electric$Date,electric$Time, sep = ":"), format = '%d/%m/%Y:%H:%M:%S')
subElectric <- electric[as.Date(electric$day)<"2007-02-03"&as.Date(electric$day)>="2007-02-01", ]

png(filename = "plot3.png", width = 480, height = 480)
plot(subElectric$day, subElectric$Sub_metering_1, type='l',ylab = 'Energy sub metering', xlab = '', lwd = 1, col = 'black' ) # plot 3
points(subElectric$day, subElectric$Sub_metering_2, type='l', col = 'red' )
points(subElectric$day, subElectric$Sub_metering_3, type='l', col = 'blue' )
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 3, col = c('black','red','blue'))	
dev.off()


