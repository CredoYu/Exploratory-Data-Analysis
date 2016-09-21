#Plot2
#change time format
data$Date <- as.Date(data$Date, format = '%d/%m/%y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
#plot
if(!file.exists('plot')) dir.create('plot')
png(filename = './plot/plot2.png', width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()
