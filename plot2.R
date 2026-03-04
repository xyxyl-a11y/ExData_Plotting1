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
png("plot2.png", width=480, height=480)
plot(datetime,
     data2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

