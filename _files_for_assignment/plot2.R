## Read the data
power<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Filter the needed dates
power2<-filter(power, Date == "1/2/2007" | Date == "2/2/2007")

## Convert the date and time to date/time objects
power2$datetime<-strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")

## Convert global active power to a numeric object
power2$Global_active_power<-as.numeric(power2$Global_active_power)

## Create the plot (Global active power as a function of time)
plot(power2$datetime, power2$Global_active_power, xlab=" ", 
     ylab="Global Active Power (Kilowatts)", type="l")

## Convert the plot into a PNG file
dev.copy(png, file="plot2.png")
dev.off()