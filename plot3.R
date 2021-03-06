#Read data
setwd("C:/Users/mwhitford/Desktop/General Deloitte Materials/Coach Materials/Analytics Proficiency/ExData_Plotting1")
HPC_Data <- read.table("household_power_consumption.txt",skip=1,sep=";",stringsAsFactors=FALSE)

#Rename Columns
names(HPC_Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset the data
library(dplyr)
Filtered_HPC_Data <- filter(HPC_Data,HPC_Data$Date=="1/2/2007" | HPC_Data$Date =="2/2/2007")

#Create Datetime column
Filtered_HPC_Data$datetimevar <- strptime(paste(Filtered_HPC_Data$Date, Filtered_HPC_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create Plot
png("plot3.png", width=480, height=480)
with(Filtered_HPC_Data, plot(datetimevar, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(Filtered_HPC_Data$datetimevar, Filtered_HPC_Data$Sub_metering_2,type="l", col= "red")
lines(Filtered_HPC_Data$datetimevar, Filtered_HPC_Data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
