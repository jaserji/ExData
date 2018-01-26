# Read input
data <- read.csv("/home/cloudera/Desktop/household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors=FALSE)
# Modify Date column to Date type
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
# Filter only data from 2007-02-01 and 2007-02-02
data2 <- subset(data, data$Date > '2007-02-01 00:00:00' & data$Date < '2007-02-02 23:59:59')
# Save the png
png(filename="/home/cloudera/Desktop/Course_Project_1/plot2.png")
plot(data2$Date,data2$Global_active_power,type="l",xlab = "Date",ylab="Global Active Power (kilowatts)")
dev.off()