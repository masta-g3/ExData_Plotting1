plot4 <- function() {
  #Load Data (assuming each script is independant)
  consumption <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                            stringsAsFactors = F, skip = 66240+397, nrow = 1440*2)
  header <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                       stringsAsFactors = F, nrow = 1)
  names(consumption) <- header
  
  ##Manipulate Columns
  consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")  
  
  #Create Multiple Plots
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow = c(2,2))      
  with(consumption, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
  with(consumption, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
  with(consumption, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
  with(consumption, lines(DateTime, Sub_metering_1, col = "black"))
  with(consumption, lines(DateTime, Sub_metering_2, col = "red"))
  with(consumption, lines(DateTime, Sub_metering_3, col = "blue"))
  with(consumption, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")) 
  dev.off()
}