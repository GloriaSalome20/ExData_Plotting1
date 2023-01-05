## read data
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, 
                 header = TRUE, sep =";"  )

## Create column in table with date and time merged together
FullDate <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(df, FullDate)

## change class of all columns to correct class
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

## subset data 
df <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## plot to png
png("plot2.png", width=480, height=480)
with(df, plot(FullDate, Global_active_power, type="l",
              xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

