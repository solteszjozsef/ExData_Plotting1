library(ggplot2)
library(data.table)

rawdata <- data.table(read.table("household_power_consumption.txt",
                                 header=T,sep=";",
                                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                                 na.strings="?"))

dt<-rawdata              
dt$Global_active_power<-as.numeric(dt$Global_active_power)
subdt<-dt[Date=="1/2/2007" | Date=="2/2/2007",]

png('plot1.png',width = 480, height = 480)
hist(subdt$Global_active_power,
     main="Global Active Power",
     ylab="Frequency",
     xlab="Global Active Power (kilowatts)",
     col="red",
     ylim=c(0,1200)
     ) 
dev.off()
