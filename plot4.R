# Read data from text file
data <- read.delim('household_power_consumption.txt', sep = ";",na.strings="?" )

# Convert Date column from character class to date class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Extract subset from dates 2007-02-01 and 2007-02-02
data_subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


# Convert Date and Time to Date/Time format
date_time <- strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S")


# Create plot and save as PNG

png(filename="plot4.png")
par(mar=c(5.1,4.1,4.1,2.1))
par(mfrow= c(2,2))
plot(date_time,data_subset$Global_active_power,
     type='l',
     
     xlab = "",
     
     ylab = "Global Active Power (kilowatts)",)
plot(date_time,data_subset$Voltage,
     type='l',
     
     xlab = "datetime",
     
     ylab = "Voltage",)

plot(date_time,data_subset$Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(date_time,data_subset$Sub_metering_1,col = "black")
lines(date_time,data_subset$Sub_metering_2,col = "red")
lines(date_time,data_subset$Sub_metering_3,col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(date_time,data_subset$Global_reactive_power,
     type='l',
     
     xlab = "datetime",
     
     ylab = "Global_reactive_power",)
dev.off()