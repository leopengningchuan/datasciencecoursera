setwd("/Users/LeoPeng/Desktop/JHU Data Science/Course Material/C4_Exploratory Data Analysis/Course Project 1")

rawdata <- read.table("./household_power_consumption.txt", sep = ";", header=T)
rawdata$Date <- as.Date(strptime(rawdata$Date,format= "%d/%m/%Y"))
rawdata <- subset(rawdata, Date == "2007-02-01"| Date == "2007-02-02")
dateTime <- paste(rawdata$Date, rawdata$Time)
dateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
rawdata$Global_active_power <- as.numeric(rawdata$Global_active_power)
rawdata$Global_reactive_power <- as.numeric(rawdata$Global_reactive_power)
rawdata$Voltage <- as.numeric(rawdata$Voltage)

rawdata$Sub_metering_1 <- as.numeric(rawdata$Sub_metering_1)
rawdata$Sub_metering_2 <- as.numeric(rawdata$Sub_metering_2)
rawdata$Sub_metering_3 <- as.numeric(rawdata$Sub_metering_3)

dateTime <- setNames(dateTime, "DateTime")
t <- cbind(dateTime, rawdata)
t$dateTime <- as.POSIXct(dateTime)


# Plot 1
hist(rawdata$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Gloabl Active Power (kilowatts)",
     col = "red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


# Plot 2
plot(t$dateTime, 
     t$Global_active_power, 
     type="l", 
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


# Plot 3
with(t, {plot(Sub_metering_1~dateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()


# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(t, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

