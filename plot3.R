setwd ("C:/!MANUALS/R/Coursera/Exploratory data analysis")
library(psych)
library(graphics)
library(grDevices)

#################################################################################################

#read DB

db <- read.csv('household_power_consumption.txt',sep=';',header = T, na.strings = "?")

#convert Dates to data format

db$Date <- strptime(db$Date,format="%d/%m/%Y",tz="") 
db$Date <- as.Date(db$Date)

# filter out dates needed

db <- db[db$Date == "2007-02-01" | db$Date == "2007-02-02",]


# convert variables into numeric format

for (i in 3:9)
{
  db[,i] <- as.numeric(db[,i])
}


# create the graph and export it to png  

png(file="plot3.png",width = 480,height = 480)
plot(db$Sub_metering_1,type="l",ann=F,axes=F,ylim = range(0,40),col="black")
lines(db$Sub_metering_2,type="l",col="red")
lines(db$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(0,10,20,30), lab=c("0", "10","20","30"))
title(ylab="Energy sub metering")
legend("topright",pch=c(151,151,151),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
box()
dev.off()

