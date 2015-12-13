# setwd("D:\\Munka\\R")
# dir()
library(ggplot2)
library(data.table)

rawdata <- data.table(read.table("household_power_consumption.txt",
                                 header=T,sep=";",
                                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                                 na.strings="?"))

dt<-rawdata              
subdt<-dt[Date=="1/2/2007" | Date=="2/2/2007",]

#subdt$Global_active_power<-as.numeric(dt$Global_active_power)
subdt$Date <- as.Date(subdt$Date , "%d/%m/%Y")
#subdt$DateTime <- strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


yrange = range(c(subdt$Sub_metering_1, subdt$Sub_metering_2, subdt$Sub_metering_3))

png('plot4.png',width = 480, height = 480)

par(mfrow = c(2, 2))

plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l",ylim=yrange,  col = "black")
par(new=TRUE)
plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Sub_metering_2, xlab = "", ylab = "", type = "l", ylim=yrange, col = "red")
par(new=TRUE)
plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Sub_metering_3, xlab = "", ylab = "", type = "l", ylim=yrange, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
       #bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue")
)

plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l",ylim=c(0,0.5))

dev.off()


