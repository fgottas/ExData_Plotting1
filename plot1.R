plot1<-function(){
  
  datat<-read.table("household_power_consumption.txt", dec = ".",sep=";",header=TRUE,na.strings = "?")
  dd<-subset(datat, Date == "1/2/2007" | Date == "2/2/2007")
  png(filename = "plot1.png", width = 480, height = 480)
  hist(dd$Global_active_power, breaks=12,
       col="red",
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)", ylab="Frequency")
  
  dev.off()
  
}
