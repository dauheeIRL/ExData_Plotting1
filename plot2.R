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


dat <- fread(fullfile, select = c("Date", "Global_active_power"), colClasses = c("character", "character","number","number","number","number","number","number","number"))
dat$Date<-dmy(dat$Date)
dat <- dat[dat$Date %in% c(dmy("01/02/2007"),dmy("02/02/2007"))]
#dat$Global_active_power<-as.numeric(dat$Global_active_power)

plot(dat$Global_active_power, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=seq(0,nrow(dat),by=nrow(dat)/2), labels=c("Thu", "Fri", "Sat") )

#the following is unused - generated from attempting to generate chart
#dat<- dat[wday(dat$Date) %in% c("Thurs", "Fri")]
#object.size(dat)[1]/1024/1024 #get mb of data
#plot(wday(dat$Date, label=TRUE), dat$Global_active_power, type="n")
#lines(wday(dat$Date, label=TRUE), dat$Global_active_power, type="l")

#plot(c(wday(dat$Date, label=TRUE), dat$Global_active_power), type="l")
#plot(dat$Global_active_power, type="l", xlab=c("Thurs", "Fri", "Sat"))
