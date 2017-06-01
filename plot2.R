library(lubridate)
##Replace file path with the correct path for your environment---

file <- "~/Coursera/Exploratory Data Analysis/Project1/household_power_consumption.txt"
testdata <- read.csv(file,sep=";",stringsAsFactors = F,na.strings="?")
testdata$DateTime <- dmy_hms(paste(testdata$Date,testdata$Time))
testdata$Date <- dmy(testdata$Date)
testdata$Time <- hms(testdata$Time)
testdata_subset <- with(testdata,testdata[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

plot(testdata_subset$DateTime,testdata_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file='Plot2.png',width=480,height=480)
dev.off()