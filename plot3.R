library(lubridate)
##Replace file path with the correct path for your environment---

file <- "~/Coursera/Exploratory Data Analysis/Project1/household_power_consumption.txt"
testdata <- read.csv(file,sep=";",stringsAsFactors = F,na.strings="?")
testdata$DateTime <- dmy_hms(paste(testdata$Date,testdata$Time))
testdata$Date <- dmy(testdata$Date)
testdata$Time <- hms(testdata$Time)
testdata_subset <- with(testdata,testdata[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

plot(testdata_subset$DateTime,testdata_subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(testdata_subset$DateTime,testdata_subset$Sub_metering_2,col="red")
lines(testdata_subset$DateTime,testdata_subset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))
dev.copy(png,file='Plot3.png',width=480,height=480)
dev.off()