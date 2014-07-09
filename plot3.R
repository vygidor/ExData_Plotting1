#set working directory
setwd("~/Documents/ExData_Plotting1/")

#check if working directory is set correctly
getwd()
list.files()

plot3_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#date and time variables covertion (POSIXlt)
plot3_data$DateTime <- paste(plot3_data$Date, plot3_data$Time)
plot3_data$Date <- as.Date(plot3_data$Date, format = "%d/%m/%Y")
plot3_data$DateTime <- strptime(plot3_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#apply interval FROM TO
plot3_data_subset <- subset(plot3_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#set png config
png(file = "plot3.png", width = 480, height = 480, antialias = "default")
par(col = "black")

#make plot | type = l for lines
#IMPORTANT!
#my default local settings are Slovak so DateTime will return slovak abbreviated names of days on x axis
with(plot3_data_subset, 
     plot(x = DateTime, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = NULL, col = "black",
          type = "l"))
with(plot3_data_subset, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(plot3_data_subset, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=1)
dev.off()
