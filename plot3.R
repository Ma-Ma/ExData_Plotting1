data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,format="%e/%m/%Y %H:%M:%S")
data<-data[datetime$year==107&datetime$mon==1&(datetime$mday==1|datetime$mday==2),3:9]
datetime<-datetime[datetime$year==107&datetime$mon==1&(datetime$mday==1|datetime$mday==2)]

png('plot3.png',width=480,height=480,units="px",bg = "transparent")
plot(datetime,data$Sub_metering_1,col="black",ylab="Energy sub metering",type="l",xlab="")
lines(datetime,data$Sub_metering_2,col="red",type="l")
lines(datetime,data$Sub_metering_3,col="blue",type="l")
legend("topright",names(data)[5:7],lty=1,col=c("black","red","blue"))
dev.off()