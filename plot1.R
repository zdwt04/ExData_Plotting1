# Project Assignment Exploratory Data Analysis - Plot1
# set working directory to "../Exploratory_Data_Analysis"

# read in data
hp <- read.csv.sql("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
hp <- transform(hp, Date = as.Date(Date, "%d/%m/%Y"))

# open PNG graphics device
png("./ExData_Plotting1/plot1.png", width=480, height=480)

# create histogram of data
with(hp, hist(Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)", ylim=c(0,1200), cex.axis=0.9))

# close graphics device
dev.off()