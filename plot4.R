#DAniel Piper plot4.R

# Reading and subsetting power_data consumption data

power_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

# Transforming the Date/ Time vars from chars to objects of type Date and POSIXlt respectively
subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
subpower_data$Time <- strptime(subpower_data$Time, format="%H:%M:%S")
subpower_data[1:1440,"Time"] <- format(subpower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_data[1441:2880,"Time"] <- format(subpower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Creating/ Opening png file
png(file="plot4.png",
    width=480, height=480)


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# R basic plot function WHICH calls different plot functions to build the 4 plots that form the graph
with(subpower_data,{
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Global_active_power)),type="l",  xlab="",ylab="Global Active power")  
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower_data$Time,subpower_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()

