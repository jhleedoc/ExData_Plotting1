file <- "./data/household_power_consumption.txt"
data1 <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

DATE <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(data2$Global_active_power)
GRP <- as.numeric(data2$Global_reactive_power)
Voltage <- as.numeric(data2$Voltage)
sub_Metering1 <- as.numeric(data2$Sub_metering_1)
sub_Metering2 <- as.numeric(data2$Sub_metering_2)
sub_Metering3 <- as.numeric(data2$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(DATE, GAP, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)

plot(DATE, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(DATE, sub_Metering1, type = "l", ylab = "Energy Submetering", xlab="")
lines(DATE, sub_Metering2, type = "l",  col = "red")
lines(DATE, sub_Metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1 , lwd = 2.5,
       col = c("black", "red", "blue"), bty = "n")

plot(DATE, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
