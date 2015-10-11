dataFile <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?")
dataSubset <- dataFile[dataFile$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- paste(dataSubset$Date, dataSubset$Time)
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
dataSubset <- cbind(dateTime, dataSubset)

hist(dataSubset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png")
dev.off()