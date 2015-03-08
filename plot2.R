## Estimate the file size for the dataset - 9 columns and 2,075,259 rows

# 2,075,259 * 9 * 8 bytes/numeric = 149,418,648
# 149,418,648 / 2^20 bytes/MB = 142.49672 MB
# 0.142 GB

## Read in the full dataset and subset to 2 dates
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, colClasess="character", dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Build the line plot for the Global Active Power data by day of the week (plot2)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()