getwd()
setwd("C:/Users/Yamuni/Desktop/Data science specialisation/Exploratory data analysis/course project1")
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

##str(subData)

globalActivePower <- as.numeric(subData$Global_active_power) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency") 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() 