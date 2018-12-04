## Exploratory Data Analysis
## Course Project 1

## Code for Plot 2


# Reading the data

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")



# Subsetting and converting plot data

power <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


# Creating plot

plot(power$datetime, power$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


# Creating PNG file

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
