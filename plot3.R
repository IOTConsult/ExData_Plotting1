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

##fulldatetime
epc$fulldate <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")
##Create a subset of two days
plot1 <- subset(epc, epc$Date == "2007-02-01" | epc$Date == as.Date("2007-02-02"))
##Convert plot1$Global_active_power to numeric
plot1$Sub_metering_1 <- as.numeric(plot1$Sub_metering_1)
plot1$Sub_metering_2 <- as.numeric(plot1$Sub_metering_2)
plot1$Sub_metering_3 <- as.numeric(plot1$Sub_metering_3)


##Create a png file
png (file="plot3.png", width=480, height=480)

##Create a basic plot with multiple variables on seperate lines.
with(plot1, plot(fulldate,Sub_metering_1,type="l",ylab="Energry sub metering",xlab=""))
with(plot1,lines(fulldate,Sub_metering_2,type="l",col="red"))
with(plot1,lines(fulldate,Sub_metering_3,col="blue"))

##Add a legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col=c("black","red", "blue"), lwd=1,lty=c(1,1,1),pch=c(NA,NA,NA,NA),merge=FALSE)

##Close the png file
dev.off()
