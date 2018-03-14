library(sqldf)

# reading general information
setwd("/Users/thaissb1/Desktop/DSCert/ExAnal")
data <- read.csv.sql("household_power_consumption.txt", sep = ';', header = T, sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,'plot2.png')
dev.off()


plot(data$Sub_metering_1 ~ data$Date, type="l", ylab = "Energy sub metering", 
	xlim = c(min(data$Date), max(data$Date)),
	ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)))
lines(data$Sub_metering_2, type = "l", col = "red")
lines(data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))