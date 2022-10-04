a<-read.table("a.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
b<-dmy(a[,1])
a[,1]<-b
c<-subset(a, Date=="2007-02-01" | Date=="2007-02-02")
c[,10]<-paste(c[,1], c[,2], sep=" ")
c[,10]<-ymd_hms(c[,10])
c[,11]<-as.numeric(c[,3])

png(file="plot2.png", width=480, height=480)
with(c, plot(V10, V11, type="l", ylab="Global Active Power(kilowattes)", xlab=""))
dev.off()


