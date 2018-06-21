##Load Data
library(readtext)
hpc<-unzip(household_power_consumption)
hpcdata<-read.table(hpc,header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subhpcdata<- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

##Plot
globalactivepower<-as.numeric(subhpcdata$Global_active_power)
datetime <- strptime(paste(subhpcdata$Date, subhpcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subhpcdata$Sub_metering_1)
submetering2 <- as.numeric(subhpcdata$Sub_metering_2)
submetering3 <- as.numeric(subhpcdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()