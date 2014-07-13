plot4<-function(){
  
  datat<-read.table("household_power_consumption.txt", dec = ".",sep=";",header=TRUE,na.strings = "?")
  
  dd<-subset(datat, Date == "1/2/2007" | Date == "2/2/2007")
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  with(dd, {
    
    mid=median(c(0,length(dd$Sub_metering_1)))
    maxim=length(dd$Sub_metering_1)
    
    plot(dd$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    
    plot(dd$Voltage,type="l",ylab="Voltage",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    mtext("datetime",side=1,line=3,outer = FALSE)
    
    plot(dd$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="black")
    lines(dd$Sub_metering_2,type="l",yaxt="n",xaxt="n",col="red")
    lines(dd$Sub_metering_3,type="l",yaxt="n",xaxt="n",col="blue")
    box()
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    legend("topright", bty="n",lty=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(dd$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    mtext("datetime",side=1,line=3,outer = FALSE)
  })
  dev.off()
  
}


