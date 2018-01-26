library(scales)
# Read input
data <- read.csv("/home/cloudera/Desktop/household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors=FALSE)
# Modify Date column to Date type
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
# Filter only data from 2007-02-01 and 2007-02-02
data2 <- subset(data, data$Date > '2007-02-01 00:00:00' & data$Date < '2007-02-02 23:59:59')
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

png(filename="/home/cloudera/Desktop/Course_Project_1/plot3.png")
# plot 3 variables using plot and lines funtion
plot(data2$Date, data2$Sub_metering_1,type="l",xlab ="",ylab = "Energy Sub metering")
lines(data2$Date, data2$Sub_metering_2,col="red")
lines(data2$Date, data2$Sub_metering_3,col="blue")
# Add legend
legend("topright",col=c("black","red","blue"),lty = c(1, 1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
