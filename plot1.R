#Read data
HPC_Data <- read.table("household_power_consumption.txt",skip=1,sep=";",stringsAsFactors=FALSE)

#Rename Columns
names(HPC_Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset the data
library(dplyr)
Filtered_HPC_Data <- filter(HPC_Data,HPC_Data$Date=="1/2/2007" | HPC_Data$Date =="2/2/2007")


#Plot 
setwd("C:/Users/mwhitford/Desktop/General Deloitte Materials/Coach Materials/Analytics Proficiency/ExData_Plotting1")
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(Filtered_HPC_Data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()  
