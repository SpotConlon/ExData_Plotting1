library(lubridate)
##Replace file path with the correct path for your environment---

file <- "~/Coursera/Exploratory Data Analysis/Project1/household_power_consumption.txt"
testdata <- read.csv(file,sep=";",stringsAsFactors = F,na.strings="?")
testdata$DateTime <- dmy_hms(paste(testdata$Date,testdata$Time))
testdata$Date <- dmy(testdata$Date)
testdata$Time <- hms(testdata$Time)
testdata_subset <- with(testdata,testdata[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

hist(testdata_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,file='Plot1.png', width=480,height=480)
dev.off()