##Set Working dir
setwd ("\\\\UPLCI084736/USERS$/gjf510/MyCloudDrive/Documents/Coursera/exdata-012/ExData_Plotting1")

##Set local language to English (to use English Names)
Sys.setlocale("LC_TIME", "English")  
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")

##Convert Date 
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

##Convert the epc$Time factor to a times object
library(chron)
epc$Time <- chron(times=epc$Time)

##Create a subset of two days
plot1 <- subset(epc, epc$Date == "2007-02-01" | epc$Date == as.Date("2007-02-02"))

##Convert Global_active_power to numeric
plot1$Global_active_power <- as.numeric(plot1$Global_active_power)

##Create a png file
png (file="plot1.png", width=480, height=480)
##Create a Histogram.
hist(plot1$Global_active_power, col ="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")
##Close the file
dev.off()
