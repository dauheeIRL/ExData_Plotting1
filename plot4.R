library(data.table)
library(lubridate) 

#locations specific to my directories
fullfile="C:\\Per\\_Courseara_Data_Science\\4-Exploratory Data Analysis\\week1project\\household_power_consumption\\household_power_consumption.txt"
zipdata="C:\\Per\\_Courseara_Data_Science\\4-Exploratory Data Analysis\\week1project\\household_power_consumption.zip"

if(!file.exists(zipdata)){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile=zipdata,
                method="auto")
  unzip(zipfile=zipdata,exdir="../household_power_consumption")
}


dat <- fread(fullfile, select = c("Date", "Global_active_power", "Global_reactive_power", "Voltage", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character","number","number","number","number","number","number","number"))
dat$Date<-dmy(dat$Date)
dat <- dat[dat$Date %in% c(dmy("01/02/2007"),dmy("02/02/2007"))]
#dat$Global_active_power<-as.numeric(dat$Global_active_power)


par(mfrow = c(2,2), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))
#1
plot(dat$Global_active_power, type="l", xaxt = "n", xlab="", ylab="Global Active Power")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )

#2
plot(dat$Voltage, type="l", xaxt = "n", xlab="datetime", ylab="Voltage")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )


#3
plot(dat$Sub_metering_1, type="n", xaxt = "n", xlab="", ylab="Energy sub metering")
lines(dat$Sub_metering_1, type="l", col="black")
lines(dat$Sub_metering_2, type="l", col="red")
lines(dat$Sub_metering_3, type="l", col="blue")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )
legend("topright", bty="n", pch = "", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(dat$Global_reactive_power, type="l", xaxt = "n", yaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )
axis(2, at=seq(0,0.5,by=0.1), labels=seq(0,0.5,by=0.1))
