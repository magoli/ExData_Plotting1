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


png(file="plot4.png",width = 480,height = 480)

par(mfcol=c(2,2))

plot(db$Global_active_power,type="l",ann=F,axes=F)
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(0,2,4,6), lab=c("0", "2","4","6"))
title(ylab="Global Active Power (kilowatts)")
box()

plot(db$Sub_metering_1,type="l",ann=F,axes=F,ylim = range(0,40),col="black")
lines(db$Sub_metering_2,type="l",col="red")
lines(db$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(0,10,20,30), lab=c("0", "10","20","30"))
title(ylab="Energy sub metering")
legend("topright",bty = "n",pch=c(151,151,151),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
box()

plot(db$Voltage,type="l",ann=F,axes=F)
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(234,238,242,246), lab=c("234", "238","242","246"))
title(ylab="Voltage",xlab="datetime")
box()

plot(db$Global_reactive_power,type="l",ann=F,axes=F)
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), lab=c("0.0", "0.1","0.2","0.3","0.4","0.5"))
title(ylab="Global_reactive_power",xlab="datetime")
box()



dev.off()

