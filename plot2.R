file <- "./data/household_power_consumption.txt"
data1 <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

DATE <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DATE, GAP, type="l", ylab="Global Active Power (kilowatts)")
dev.off()
