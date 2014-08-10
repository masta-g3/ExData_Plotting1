plot1 <- function() {
  #Load Data (assuming each script is independant)
  consumption <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                            stringsAsFactors = F, skip = 66240+397, nrow = 1440*2)
  header <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?",
                       stringsAsFactors = F, nrow = 1)
  names(consumption) <- header

##Manipulate Columns
  consumption$Date = as.Date(consumption$Date, "%d/%m/%Y")
  
  #Create Histogram
  png(filename = "plot1.png")
  hist(consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}