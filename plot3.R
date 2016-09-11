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


dat <- fread(fullfile, select = c("Date", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character","number","number","number","number","number","number","number"))
dat$Date<-dmy(dat$Date)
dat <- dat[dat$Date %in% c(dmy("01/02/2007"),dmy("02/02/2007"))]
#dat$Global_active_power<-as.numeric(dat$Global_active_power)

plot(dat$Sub_metering_1, type="n", xaxt = "n", xlab="", ylab="Energy sub metering")
lines(dat$Sub_metering_1, type="l", col="black")
lines(dat$Sub_metering_2, type="l", col="red")
lines(dat$Sub_metering_3, type="l", col="blue")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )
legend("topright", pch = "", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

