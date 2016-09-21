#Plot1
if(!file.exists('plot')) dir.create('plot')
png(filename = './plot/plot1.png', width = 480, height = 480, units = 'px')
with(data, hist(Global_active_power, xlab = "Global Activity Power(kilowatts)", ylab = "frequency", col = "red", main = "Global Activity Power"))
dev.off()
