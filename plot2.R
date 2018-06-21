##Load Data
library(readtext)
hpc<-unzip(household_power_consumption)
hpcdata<-read.table(hpc,header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subhpcdata<- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

##Plot
globalactivepower<-as.numeric(subhpcdata$Global_active_power)
datetime <- strptime(paste(subhpcdata$Date, subhpcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
