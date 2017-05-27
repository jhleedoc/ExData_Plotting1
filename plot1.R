file <- "./data/household_power_consumption.txt"
data1 <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

data3 <- as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data3, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
