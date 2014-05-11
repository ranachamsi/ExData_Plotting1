require ("sqldf")
Sys.setlocale("LC_TIME","English") 

hpc = "./household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
subData <- read.csv2.sql(hpc, Sql, filter=NULL)
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))


# Creating the plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(subData$DateTime, subData$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power", xlab="")
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
plot(subData$DateTime, subData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subData$DateTime, subData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
