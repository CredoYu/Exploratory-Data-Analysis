#Plot3
if(!file.exists('plot')) dir.create('plot')
png(filename = './plot/plot3.png', width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Submetering_1, ylab = "Energy sub metering",type = 'l')
lines(data$DateTIme, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c("black", "red", "blue"), legend = c("Submetering_1", "Submetering_2", "Submetering_3"), lwd = 1)
dev.off()
