#plot4

#down load data

data_full <-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#subset data
data <- subset(data_full, Date=="2007-02-01"|Date=="2007-02-02")
rm(data_full)

#Converting dates
#add weekdays
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plotting
par(mfcol=c(2,2))
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

with(data,{plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime, col="red")
lines(Sub_metering_3~Datetime, col="blue")})

plot(data$Voltage~data$Datetime, type="l",ylab="Voltage", xlab="datetime")

plot(data$Global_reactive_power~data$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")

#save to png
dev.copy(png, file="plot4.png",height=480, width=480)
dev.off()
