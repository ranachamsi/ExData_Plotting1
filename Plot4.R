require ("sqldf")
# I have a french computer so I'm setting the system local to english
# in order to display day names in english 
Sys.setlocale("LC_TIME","English" )  

# Reading data file
hpc = "./household_power_consumption.txt"
# the SQL statement for selecting these two dates only
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
# Read the only the needed data
subData <- read.csv2.sql(hpc, Sql, filter=NULL)
# Get the data in the proper format
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
