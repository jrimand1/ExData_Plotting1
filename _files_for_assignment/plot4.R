## Read the data
power<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Filter the needed dates
power2<-filter(power, Date == "1/2/2007" | Date == "2/2/2007")

## Convert the date and time to date/time objects
power2$datetime<-strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")

## Convert global active power to a numeric object
power2$Global_active_power<-as.numeric(power2$Global_active_power)

## Convert the sub_metering objects to numeric objects
power2$Sub_metering_1<-as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2<-as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3<-as.numeric(power2$Sub_metering_3)

## Convert global reactive power to a numeric object
power2$Global_reactive_power<-as.numeric(power2$Global_reactive_power)

## Set up the window
par(mfrow=c(2,2))

## Create the upper left plot: Global active power as a function of time
plot(power2$datetime, power2$Global_active_power, xlab=" ", 
     ylab="Global Active Power", type="l")

## Create the upper right plot: Voltage as a function of time
plot(power2$datetime, power2$Voltage, xlab="datetime", 
     ylab="Voltage", type="l")

## Create the lower left plot: Sub metering as a function of time
plot(power2$datetime, power2$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="n")
points(power2$datetime, power2$Sub_metering_1, type="l", col="black")
points(power2$datetime, power2$Sub_metering_2, type="l", col="red")
points(power2$datetime, power2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, bty="n", cex=0.75, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create the lower right plot: Global reactive power as a function of time
plot(power2$datetime, power2$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", type="l")

## Copy the plot to a PNG file
dev.copy(png, file="plot4.png")
dev.off()