require ("sqldf")
Sys.setlocale("LC_TIME","English") 
hpc = "./household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
subData <- read.csv2.sql(hpc, Sql, filter=NULL)
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))



# Creating the plot3:
png("plot3.png", width = 480, height = 480)
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

