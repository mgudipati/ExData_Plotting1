plot4 <- function() {
  # Read 69,516 rows until the last data point for 2007-02-02
  data = read.csv("household_power_consumption.txt", sep=";", nrows=69516, na.strings=c("?"))
  
  # Conversion to Time class
  data[,2] = as.POSIXct(strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S"))
  
  # Conversion to Date class
  data[,1] = as.Date(data[,1], "%d/%m/%Y")
  
  # Subset 2007-02-01 and 2007-02-02 data
  data = data[data$Date == as.Date("2007-02-01", "%Y-%m-%d") | data$Date == as.Date("2007-02-02", "%Y-%m-%d"),]
  
  # Open the PNG device
  png(filename="plot4.png", width=480, height=480, units="px")
  
  # Create a 2X2 layout
  par(mfrow = c(2,2))
  
  # Plot Global Active Power
  plot(data$Time, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(data$Time, data$Global_active_power, pch=".")

  # Plot Voltage
  plot(data$Time, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
  lines(data$Time, data$Voltage, pch=".")
  
  # Plot Energy sub metering
  plot(data$Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_1, pch=".", col="black")
  lines(data$Time, data$Sub_metering_2, pch=".", col="red")
  lines(data$Time, data$Sub_metering_3, pch=".", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), lwd=c(2.5, 2.5, 2.5), bty="n")
  
  # Plot Global Reactive Power
  plot(data$Time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(data$Time, data$Global_reactive_power, pch=".")
  
  # Close the PNG device
  dev.off()
}