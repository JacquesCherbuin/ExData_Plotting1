# Read data from text file
data <- read.delim('household_power_consumption.txt', sep = ";",na.strings="?" )

# Convert Date column from character class to date class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Extract subset from dates 2007-02-01 and 2007-02-02
data_subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


# Convert Date and Time to Date/Time format
date_time <- strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

# Create plot and save as PNG
png(filename="plot2.png")
plot(date_time,data_subset$Global_active_power,
   type='l',

   xlab = "",
  
   ylab = "Global Active Power (kilowatts)",)
dev.off()
