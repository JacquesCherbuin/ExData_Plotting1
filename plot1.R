# Read data from text file
data <- read.delim('household_power_consumption.txt', sep = ";",na.strings="?" )

# Convert Date column from character class to date class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Extract subset from dates 2007-02-01 to 2007-02-02
data_subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Create plot and save as PNG
png(filename="plot1.png")
hist(data_subset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()