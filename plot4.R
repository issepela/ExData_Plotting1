#define adress
    dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zip_file <- "dataset.zip"

#download zip, and unzip in working direcorty
    download.file(dataset_url, destfile = zip_file)
    unzip(zip_file)
    file.remove(zip_file)

#read table, convert the Date and Time, filter dates, and create date+time
    x<-read.table("household_power_consumption.txt",na.strings = "?",
                  header = TRUE, sep = ";")
    x$Date<-strptime(x$Date,"%d/%m/%Y")
    y<-x[which(x$Date %in% c('2007-02-01','2007-02-02')),]
    y$Date<-strptime(paste(y$Date,y$Time),"%Y-%m-%d %H:%M:%S")
    
    
    #set plot on 2x2
    
    
    
#create plot, add variables, add legend,copy in png file and close device
    png(file = "plot4.png")
    par(mfrow = c(2, 2))
    #plot11
    plot(y$Date,y$Global_active_power,
          ylab = "Global Active Power (kilowatts)",xlab="",type="l")
    #plot12
    plot(y$Date,y$Voltage,ylab="Voltage",xlab = "datetime",type="l")
    
    #plot21
    plot(y$Date,y$Sub_metering_1,
         ylab = "Energy Sub metering",xlab="",type="l")
    lines(y$Date,y$Sub_metering_2, type = "l",col="red")
    lines(y$Date,y$Sub_metering_3, type = "l",col="blue")
    legend("topright",
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lwd=c(1,1,1),col=c("black","red","blue"),y.intersp=1)

    #plot22
    plot(y$Date,y$Global_reactive_power,
         ylab="Global_reactive_power",xlab = "datetime",type="l")
    ##dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px")
    
    dev.off()
