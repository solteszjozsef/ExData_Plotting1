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


png('plot2.png',width = 480, height = 480)
plot(strptime(paste(subdt$Date, subdt$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), subdt$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()


