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

