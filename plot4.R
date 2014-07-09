#set working directory
setwd("~/Documents/ExData_Plotting1/")

#check if working directory is set correctly
getwd()
list.files()

plot4_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#date and time variables covertion (POSIXlt)
plot4_data$DateTime <- paste(plot4_data$Date, plot4_data$Time)
plot4_data$Date <- as.Date(plot4_data$Date, format = "%d/%m/%Y")
plot4_data$DateTime <- strptime(plot4_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#apply interval FROM TO
plot4_data_subset <- subset(plot4_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#set png config
png(file = "plot4.png", width = 480, height = 480, antialias = "default")
par(col = "black")
#make a plot 'matrix'
par(mfrow = c(2, 2))

#make 4 plots
#-----------------------------
#IMPORTANT!
#my default local settings are Slovak so DateTime will return slovak abbreviated names of days on x axis
#-----------------------------

#1st plot
with(plot4_data_subset, 
     plot(x = DateTime, y = Global_active_power, xlab = "", ylab = "Global Active Power", main = NULL, 
          col = "black", type = "l"))

#2nd plot
with(plot4_data_subset, 
     plot(x = DateTime, y = Voltage, xlab = "datetime", ylab = "Voltage", main = NULL, 
          col = "black", type = "l"))

#3rd plot
with(plot4_data_subset, 
     plot(x = DateTime, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = NULL,
          col = "black", type = "l"))
with(plot4_data_subset, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(plot4_data_subset, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#4th plot
with(plot4_data_subset, 
     plot(x = DateTime, y = Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", 
          main = NULL, col = "black", type = "l"))

dev.off()
