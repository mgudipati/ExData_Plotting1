plot1 <- function() {
  # Read 69,516 rows until the last data point for 2007-02-02
  data = read.csv("household_power_consumption.txt", sep=";", nrows=69516, na.strings=c("?"))
  
  # Conversion to Time class
  data[,2] = as.POSIXct(strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S"))
  
  # Conversion to Date class
  data[,1] = as.Date(data[,1], "%d/%m/%Y")
  
  # Subset 2007-02-01 and 2007-02-02 data
  data = data[data$Date == as.Date("2007-02-01", "%Y-%m-%d") | data$Date == as.Date("2007-02-02", "%Y-%m-%d"),]
  
  # Open the PNG device
  png(filename="plot1.png", width=480, height=480, units="px")
  
  # Plot histogram
  hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  # Close the PNG device
  dev.off()
}