library(tidyverse)
library(lubridate)

# Download data
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link,destfile = "data.zip", method = "libcurl") 
unzip("data.zip")

# Read date
data1 <- read.delim(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

# Change Date Column to Date Type
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
data1_clean <- data1 %>%
        filter(Date == "2007-02-01" | Date == "2007-02-02")

# plot 1
png("plot1.png", width=480, height=480)
hist(data1_clean$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
