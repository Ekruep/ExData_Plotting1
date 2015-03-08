## Estimate the file size for the dataset - 9 columns and 2,075,259 rows

# 2,075,259 * 9 * 8 bytes/numeric = 149,418,648
# 149,418,648 / 2^20 bytes/MB = 142.49672 MB
# 0.142 GB

## Read in the full dataset and subset to 2 dates
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, colClasess="character", dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Build the line plots for the sub-metering data by day of the week (plot3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(datetime, subMetering3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       lty=1, lwd=2.5, col = c("black", "blue", "red"))
dev.off()