library(sqldf)

# reading general information
setwd("/Users/thaissb1/Desktop/DSCert/ExAnal")
data <- read.csv.sql("household_power_consumption.txt", sep = ';', header = T, sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
hist(data[[3]], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,'plot1.png')
dev.off()