require ("sqldf")
Sys.setlocale("LC_TIME","English")

hpc = "./household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
subData <- read.csv2.sql(hpc, Sql, filter=NULL)
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))

# Creating the plot2:
png("plot2.png", width=480, height= 480)
plot(subData$DateTime, subData$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
