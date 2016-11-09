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

PowerData$date_time<-strptime(paste(PowerData$Date, PowerData$Time), "%Y-%m-%d %H:%M:%S")

#subset of data
PowerData2017Feb<-PowerData[PowerData$Date==as.Date("2007-02-01")|PowerData$Date==as.Date("2007-02-02"),]

#Plot the data
png("plot3.png", width=480, height=480)
plot(PowerData2017Feb$date_time,PowerData2017Feb$, type="s",xlab="", ylab="Energy sub metering)")
lines(PowerData2017Feb$date_time,PowerData2017Feb$Sub_metering_2, type="s", col="red")
lines(PowerData2017Feb$date_time,PowerData2017Feb$Sub_metering_3, type="s", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()


