#set working directory
setwd("~/Documents/ExData_Plotting1/")

#check if working directory is set correctly
getwd()
list.files()

plot1_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#date and time variables covertion (POSIXlt)

plot1_data$DateTime <- paste(plot1_data$Date, plot1_data$Time)
plot1_data$Date <- as.Date(plot1_data$Date, format = "%d/%m/%Y")
plot1_data$DateTime <- strptime(plot1_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#apply interval FROM TO
plot1_data_subset <- subset(plot1_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#set png config
png(file = "plot1.png", width = 480, height = 480, antialias = "default")

#make plot / color = red
with(plot1_data_subset, 
     hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
          col = "red"))
dev.off()
