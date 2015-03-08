## Estimate the file size for the dataset - 9 columns and 2,075,259 rows

# 2,075,259 * 9 * 8 bytes/numeric = 149,418,648
# 149,418,648 / 2^20 bytes/MB = 142.49672 MB
# 0.142 GB

## Read in the full dataset and subset to 2 dates
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, colClasess="character", dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Build the 2x2 set of plots for the following output (plot4):
## Global Access Power by day of week, 
## Date and time by voltage
## Energy sub metering, and
## Global relative power by datetime 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

globalActivePower <- as.numeric(subSetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

voltage <- as.numeric(subSetData$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(datetime, subMetering3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", lty=1, lwd=2.5, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"),
       bty = "n")

globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
