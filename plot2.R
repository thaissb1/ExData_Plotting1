library(sqldf)

# reading general information
setwd("/Users/thaissb1/Desktop/DSCert/ExAnal")
data <- read.csv.sql("household_power_consumption.txt", sep = ';', header = T, sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,'plot2.png')
dev.off()
