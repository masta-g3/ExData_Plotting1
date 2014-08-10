plot2 <- function() {
  #Download File
  
  #Load Data (assuming each script is independant)
  consumption <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                            stringsAsFactors = F, skip = 66240+397, nrow = 1440*2)
  header <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                       stringsAsFactors = F, nrow = 1)
  names(consumption) <- header
  
  ##Manipulate Columns
  consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")  
  
  #Create Time Series Plot
  png(filename = "plot2.png", width = 480, height = 480)
  with(consumption, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
  dev.off()
}