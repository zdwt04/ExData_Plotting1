# Project Assignment Exploratory Data Analysis - Plot2
# set working directory to "../Exploratory_Data_Analysis"

# read in data filtered by date combining data and time columns and dropping the separate columns
hp <- read.csv.sql("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dt <- paste(hp$Date, hp$Time)
newdt <- strptime(dt, "%d/%m/%Y %H:%M:%S")
hp <- cbind(DateTime=newdt, hp)
hp$Date <- NULL
hp$Time <- NULL

# open PNG graphics device
png("./ExData_Plotting1/plot2.png", width=480, height=480)

# create xy plot of data
with(hp, plot(Global_active_power ~ DateTime, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(hp, lines(Global_active_power ~ DateTime, type="l"))

# close graphics device
dev.off()