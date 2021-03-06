#setwd("R/ExploratoryDataAnalysis/CourseProject1")

# Read in the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Clean up the date and time formats
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
times <- strptime(data$Time, format = "%H:%M:%S")
data$Time <- strftime(times, "%H:%M:%S")

# Subset the dataset into one containing only
# 2007-02-01, 2007-02-02
narrow <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Plot a histogram of Global Active Power
plot(as.numeric(paste(narrow$Global_active_power)), 
     ylab="Global Active Power (kilowatts)",
     xlab="",
     xaxt="n",
     type="l")

# Add X axis labels for days of the week
axis(1, at = c(1,1500,2900), labels = c("Thu","Fri","Sat"))

# Write the histogram to a PNG
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
plot(as.numeric(paste(narrow$Global_active_power)), 
     ylab="Global Active Power (kilowatts)",
     xlab="",
     xaxt="n",
     type="l")
axis(1, at = c(1,1500,2900), labels = c("Thu","Fri","Sat"))
dev.off()