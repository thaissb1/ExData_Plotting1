library(sqldf)

# reading general information
setwd("/Users/thaissb1/Desktop/DSCert/ExAnal")
data <- read.csv.sql("household_power_consumption.txt", sep = ';', header = T, sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$DateTime, data$Sub_metering_1, type="l", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(data$DateTime, data$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="")

dev.copy(png,'plot4.png')
dev.off()
