#Daniel Piper Plot1.R

#Reading and subsetting power consumption data
power_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_data) <- c("Date","Time","Global_active_power_data","Global_reactive_power_data","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

#creating/ opening png file
png(file="plot1.png",
    width=480, height=480)

#basic plot
hist(as.numeric(as.character(subpower_data$Global_active_power_data)),col="red",main="Global Active power_data",xlab="Global Active power_data(kilowatts)")

# title of graph
title(main="Global Active power_data")

dev.off()
