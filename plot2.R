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

png(file="plot2.png",width = 480,height = 480)
plot(db$Global_active_power,type="l",ann=F,axes=F)
axis(1, at=c(0,1440,2880), lab=c("Thu", "Fri","Sat"))
axis(2, at=c(0,2,4,6), lab=c("0", "2","4","6"))
title(ylab="Global Active Power (kilowatts)")
box()
dev.off()





