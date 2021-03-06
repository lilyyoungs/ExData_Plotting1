setwd("C:/Users/li.yang/Documents/Projects/Data Scientist/R")

#Downloan file
if(!file.exists("PowerData.zip")) {
   download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="PowerData.zip")
}

#Unzipfile
unzip("PowerData.zip")

#read txt file
PowerData<-read.table("household_power_consumption.txt", header = TRUE,nrow=2075260, sep = ";", na.string="?")
PowerData$Date<-as.Date(PowerData$Date, format="%d/%m/%Y")

#subset of data
PowerData2017Feb<-PowerData[PowerData$Date==as.Date("2007-02-01")|PowerData$Date==as.Date("2007-02-02"),]

#Plot the data
png("plot1.png", width=480, height=480)
hist(PowerData2017Feb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()


