# Project Assignment Exploratory Data Analysis - Plot3
# set working directory to "../Exploratory_Data_Analysis"

# read in data filtered by date combining data and time columns and dropping the separate columns
hp <- read.csv.sql("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dt <- paste(hp$Date, hp$Time)
newdt <- strptime(dt, "%d/%m/%Y %H:%M:%S")
hp <- cbind(DateTime=newdt, hp)
hp$Date <- NULL
hp$Time <- NULL

# open PNG graphics device
png("./ExData_Plotting1/plot3.png", width=480, height=480)

# create xy plot of data
with(hp, plot(Sub_metering_1 ~ DateTime, type="n", xlab="", ylab="Energy sub metering"))
with(hp, lines(Sub_metering_1 ~ DateTime, type="l", col="black"))
with(hp, lines(Sub_metering_2 ~ DateTime, type="l", col="red"))
with(hp, lines(Sub_metering_3 ~ DateTime, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

# close graphics device
dev.off()