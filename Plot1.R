a<-read.table("a.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
b<-dmy(a[,1])
a[,1]<-b
c<-subset(a, Date=="2007-02-01" | Date=="2007-02-02")

png(file="plot1.png", width=480, height=480)
c$Global_active_power<-as.numeric(c$Global_active_power)
hist(c$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()