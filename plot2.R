# Download data
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link,destfile = "data.zip", method = "libcurl") 
unzip("data.zip")

# Read date
data1 <- read.delim(file = "household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)


# Join Date and Time column
DataTime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data1 <- cbind(data1, DataTime)

# Change Date Column to Date Type
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- format(data1$Time, format="%H:%M:%S")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)
data1$Voltage <- as.numeric(data1$Voltage)
data1$Global_intensity <- as.numeric(data1$Global_intensity)
data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

# Filter Dates for 2007-02-01 and 2007-02-02
data1 <- data1 %>%
        filter(Date == "2007-02-01" | Date == "2007-02-02")

# plot 2
png("plot2.png", width=480, height=480)
with(data1, plot(DataTime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
