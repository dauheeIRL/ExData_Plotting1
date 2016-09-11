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


dat <- fread(fullfile)
dat <- dat[dmy(dat$Date) %in% c(dmy("01/02/2007"),dmy("02/02/2007"))]
#object.size(dat)[1]/1024/1024 #get mb of data
#acs<-as.data.frame(acs)

dat$Global_active_power<-as.numeric(dat$Global_active_power)
dat$Global_reactive_power<-as.numeric(dat$Global_reactive_power)
dat$Voltage<-as.numeric(dat$Voltage)
dat$Global_intensity<-as.numeric(dat$Global_intensity)
dat$Sub_metering_1<-as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2<-as.numeric(dat$Sub_metering_2)

hist(dat$Global_active_power, col = "red", xlab="Global Active Power (killowatts)", ylab="Frequency", main="Global Active Power")