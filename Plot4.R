a<-read.table("a.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
b<-dmy(a[,1])
a[,1]<-b
c<-subset(a, Date=="2007-02-01" | Date=="2007-02-02")
c[,10]<-paste(c[,1], c[,2], sep=" ")
c[,10]<-ymd_hms(c[,10])
c[,11]<-as.numeric(c[,3])
c[,12]<-as.numeric(c[,7])
c[,13]<-as.numeric(c[,8])
c[,14]<-as.numeric(c[,9])




png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(c, plot(V10, V11, type="l", ylab="Global Active Power(kilowattes)", xlab=""))
with(c, plot(V10, Voltage, type="l", ylab="voltage", xlab="datetime"))
plot(c$V10, c$V12, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(c$V10, c$V13, type="l", col="red")
lines(c$V10, c$V14, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(c$V10, c$Global_reactive_power , type="l", ylab="Global_reactive_power", xlab="datetime", col="black")
dev.off()

