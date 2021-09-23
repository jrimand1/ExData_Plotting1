## Read the data
power<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Filter the needed dates
power2<-filter(power, Date == "1/2/2007" | Date == "2/2/2007")

## Convert the date and time to date/time objects
power2$datetime<-strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")

## Convert the sub_metering objects to numeric objects
power2$Sub_metering_1<-as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2<-as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3<-as.numeric(power2$Sub_metering_3)

## Create the base plot without data added
plot(power2$datetime, power2$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="n")

## Add the data for sub metering 1-3
points(power2$datetime, power2$Sub_metering_1, type="l", col="black")
points(power2$datetime, power2$Sub_metering_2, type="l", col="red")
points(power2$datetime, power2$Sub_metering_3, type="l", col="blue")

## Create the legend
legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy the plot to a PNG file
dev.copy(png, file="plot3.png")
dev.off()