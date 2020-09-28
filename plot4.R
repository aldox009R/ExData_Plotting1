#
setwd("D:/Ciencia de datos/r/Exploratory Data Analysis")
electric <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
electric$day <- strptime(paste(electric$Date,electric$Time, sep = ":"), format = '%d/%m/%Y:%H:%M:%S')
subElectric <- electric[as.Date(electric$day)<"2007-02-03"&as.Date(electric$day)>="2007-02-01", ]

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(subElectric$day, subElectric$Global_active_power, type = 'l',xlab="" ,ylab = "Global Active Power")  #4.1
plot(subElectric$day, subElectric$Voltage, type = 'l',xlab="datetime" ,ylab = "Voltage")				  #4.2

plot(subElectric$day, subElectric$Sub_metering_1, type='l',ylab = 'Energy sub metering', xlab = '', lwd = 1, col = 'black' ) # 4.3
points(subElectric$day, subElectric$Sub_metering_2, type='l', col = 'red' )
points(subElectric$day, subElectric$Sub_metering_3, type='l', col = 'blue' )
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 3, col = c('black','red','blue'))

plot(subElectric$day, subElectric$Global_reactive_power, type = 'l',xlab="datetime", ylab = "Global_reactive_power")        # 4.4

dev.off()
