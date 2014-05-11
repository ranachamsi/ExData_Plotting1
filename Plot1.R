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



# creating plot1
png("plot1.png", width=480, height= 480)
hist(subData$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
