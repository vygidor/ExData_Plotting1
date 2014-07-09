#set working directory
setwd("~/Documents/ExData_Plotting1/")

#check if working directory is set correctly
getwd()
list.files()

plot2_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#date and time variables covertion (POSIXlt)
plot2_data$DateTime <- paste(plot2_data$Date, plot2_data$Time)
plot2_data$Date <- as.Date(plot2_data$Date, format = "%d/%m/%Y")
plot2_data$DateTime <- strptime(plot2_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#apply interval FROM TO
plot2_data_subset <- subset(plot2_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#set png config
png(file = "plot2.png", width = 480, height = 480, antialias = "default")
par(col = "black")

#make plot | color = black | type = l for lines
#IMPORTANT!
#my default local settings are Slovak so DateTime will return slovak abbreviated names of days on x axis
with(plot2_data_subset, 
     plot(x = DateTime, y = Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = NULL, col = "black",
          type = "l"))
dev.off()
