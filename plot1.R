## Estimate the file size for the dataset - 9 columns and 2,075,259 rows

# 2,075,259 * 9 * 8 bytes/numeric = 149,418,648
# 149,418,648 / 2^20 bytes/MB = 142.49672 MB
# 0.142 GB

## Read in the full dataset and subset to 2 dates
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, colClasess="character", dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Build the histogram of Global Active Power and output to png file (plot1)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()