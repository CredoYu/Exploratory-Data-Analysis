#download the zip
setwd("/Users/yuyan/Desktop/CLass Notes/Others/R")
if(!file.exists('data')) dir.create('data')
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/Power_Consumption.zip')

#unzip data
unzip('Power_Consumption.zip',exdir = './data')

#read data into R
files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value = TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Submetering_1", "Submetering_2", "Sub_metering_3"), na.string = '?')

#Plot1
if(!file.exists('plot')) dir.create('plot')
png(filename = './plot/plot1.png', width = 480, height = 480, units = 'px')
with(data, hist(Global_active_power, xlab = "Global Activity Power(kilowatts)", ylab = "frequency", col = "red", main = "Global Activity Power"))
dev.off()

#Plot2
#change time format
data$Date <- as.Date(data$Date, format = '%d/%m/%y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
#plot
png(filename = './plot/plot2.png', width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()

#Plot3
png(filename = './plot/plot3.png', width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Submetering_1, ylab = "Energy sub metering",type = 'l')
lines(data$DateTIme, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c("black", "red", "blue"), legend = c("Submetering_1", "Submetering_2", "Submetering_3"), lwd = 1)
dev.off()

#Plot4
png(filename = './plot/plot4.png', width = 480, height = 480, units = 'px')
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()