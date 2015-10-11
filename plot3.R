dataFile <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?")
dataSubset <- dataFile[dataFile$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- paste(dataSubset$Date, dataSubset$Time)
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
dataSubset <- cbind(dateTime, dataSubset)

plot(dataSubset$dateTime, dataSubset$Sub_metering_1, type="l", xlab = "", ylab="Energy Sub Metering")
lines(dataSubset$dateTime, dataSubset$Sub_metering_2, type="l", col="red")
lines(dataSubset$dateTime, dataSubset$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red","blue"), lty=c(1,1,1))

dev.copy(png, "plot3.png")
dev.off()