dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

##str(subSetData) 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power) 
Voltage <- as.numeric(subSetData$Voltage) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subSetData, {
  plot(datetime,globalActivePower , type="l", 
       ylab="Global Active Power", xlab="")
  plot(datetime,Voltage, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="") 
  lines(datetime, subMetering2, type="l", col="red") 
  lines(datetime, subMetering3, type="l", col="blue") 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,globalReactivePower, type="l", 
       ylab="Global_Rective_Power",xlab="datetime")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
