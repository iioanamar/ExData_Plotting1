## Exploratory Data Analysis
## Course Project 1

## Code for Plot 4


# Reading the data

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")



# Subsetting and converting plot data

power <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


# Creating plot

par(mfrow = c(2, 2))
with(power, {
    plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power")
    plot(datetime, Voltage, type = "l", ylab = "Voltage")
    plot(power$datetime, power$Sub_metering_1,
         type = "l", col = "black",
         xlab = "",
         ylab = "Energy sub metering")
    lines(power$datetime, power$Sub_metering_2, col = "red")
    lines(power$datetime, power$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1, bty = "n")
    plot(datetime, Global_reactive_power, type = "l")
})


# Creating PNG file

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
