require ("sqldf")
Sys.setlocale("LC_TIME","English")

hpc = "./household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
subData <- read.csv2.sql(hpc, Sql, filter=NULL)

# creating plot1
png("plot1.png", width=480, height= 480)
hist(subData$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
