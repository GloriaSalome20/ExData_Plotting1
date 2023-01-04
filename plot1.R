## read data
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## change class of all columns to correct class
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)

## subset data from 2007-02-01 and 2007-02-02
sub_data <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## plot to png
png("plot1.png", width=480, height=480)
hist(sub_data$Global_active_power, col="red", 
     border="black", main ="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()