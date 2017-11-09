#down load files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudtront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/Dataset.zip", method="curl")

#unzip files
unzip(zipfile="./data/Dataset.zip", exdir="./data")

dt <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", nrow=2075259, check.names=FALSE,
stringsAsFactors=FALSE, comment.char="", quote='\"')

#change date
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

#subset data sets
dt_subset <- subset(dt, Date=="2007-02-01"|Date=="2007-02-02")

#plot1
hist(dt_subset$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatt)", ylab="Frequency")

#save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
