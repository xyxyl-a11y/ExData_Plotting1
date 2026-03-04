data <- read.table(
  "C:/Users/DR.PADWAL/Downloads/household_power_consumption.txt",
  sep=";",
  header=TRUE,
  na.strings="?",
  stringsAsFactors=FALSE
)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(
  data,
  Date == "2007-02-01" | Date == "2007-02-02"
)
datetime <- as.POSIXct(paste(data2$Date, data2$Time))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# Plot 1
plot(datetime,
     data2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
# Plot 2
plot(datetime,
     data2$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
# Plot 3
plot(datetime,
     data2$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(datetime, data2$Sub_metering_2, col="red")
lines(datetime, data2$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)
# Plot 4
plot(datetime,
     data2$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()

