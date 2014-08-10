plot3 <- function() {
  #Load Data (assuming each script is independant)
  consumption <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                            stringsAsFactors = F, skip = 66240+397, nrow = 1440*2)
  header <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                       stringsAsFactors = F, nrow = 1)
  names(consumption) <- header
  
  ##Manipulate Columns
  consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")  
  
  #Create Overlay of Time Series Plot
  png(filename = "plot3.png", width = 480, height = 480)
  with(consumption, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
  with(consumption, lines(DateTime, Sub_metering_1, col = "black"))
  with(consumption, lines(DateTime, Sub_metering_2, col = "red"))
  with(consumption, lines(DateTime, Sub_metering_3, col = "blue"))
  dev.off()
}