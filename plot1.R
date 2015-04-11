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
    
#create plot, copy in png file and close device
    hist(y$Global_active_power,main="Global Active Power",
         xlab="Global Active Power (kilowatts)",col="red")
    dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
    dev.off()
