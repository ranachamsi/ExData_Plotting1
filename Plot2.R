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


# Creating the plot2:
png("plot2.png", width=480, height= 480)
plot(subData$DateTime, subData$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
