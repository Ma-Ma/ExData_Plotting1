data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,format="%e/%m/%Y %H:%M:%S")
data<-data[datetime$year==107&datetime$mon==1&(datetime$mday==1|datetime$mday==2),3:9]
datetime<-datetime[datetime$year==107&datetime$mon==1&(datetime$mday==1|datetime$mday==2)]

png('plot2.png',width=480,height=480,units="px",bg = "transparent")
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()