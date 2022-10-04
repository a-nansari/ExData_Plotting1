a<-read.table("a.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
b<-dmy(a[,1])
a[,1]<-b
c<-subset(a, Date=="2007-02-01" | Date=="2007-02-02")
c[,10]<-paste(c[,1], c[,2], sep=" ")
c[,10]<-ymd_hms(c[,10])
c[,11]<-as.numeric(c[,7])
c[,12]<-as.numeric(c[,8])
c[,13]<-as.numeric(c[,9])

png(file="plot3.png", width=480, height=480)
plot(c$V10, c$V11, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(c$V10, c$V12, type="l", col="red")
lines(c$V10, c$V13, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()


