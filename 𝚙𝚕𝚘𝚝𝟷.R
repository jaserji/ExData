# Read input
data <- read.csv("/home/cloudera/Desktop/household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors=FALSE)
# Modify Date column to Date type
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
# Filter only data from 2007-02-01 and 2007-02-02
data2 <- filter(data,Date == "2007-02-01" | Date == "2007-02-02")
# Save the png
png(filename="/home/cloudera/Desktop/Course_Project_1/plot1.png")
hist(as.numeric(data2$Global_active_power),col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()