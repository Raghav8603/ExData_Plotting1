HPC<-read.table("household_power_consumption.txt",sep=";",header = T, na.strings = "?")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC<-subset(HPC, HPC$Date == "2007-02-01"| HPC$Date =="2007-02-02")
HPC$DateTime <- strptime(paste(HPC$Date, HPC$Time), "%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(HPC, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(DateTime,Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(DateTime, Sub_metering_2,col='Red')
  lines(DateTime, Sub_metering_3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", y.intersp = 0.5, cex = 0.9, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
   })
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()