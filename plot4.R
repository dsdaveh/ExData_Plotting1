#setwd(Sys.getenv('USERPROFILE'))
#setwd("Google Drive/Coursera/Exploratory Data Analysis/ExData_Plotting1")

fname ="household_power_consumption.txt" 
#scan(file=fname, what=character(), nlines = 10, sep="")
classes = c(rep("character", 2), rep("double", 7))

data <- read.table(file=fname, header=TRUE, colClasses = classes, sep=";", na.strings="?")
data2 <- subset(data, grepl("^[12]/2/2007", data$Date))

#convert the dates
data2$datetime <- strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S") #faster

#subset the dates we are interested in
#data2 <- subset(data, Rtime >= "2007-02-01" & Rtime <= "2007-02-02")
rm(data)

par(mfrow=c(2,2), mar=c(4, 4, 3, 2) +0.1,
    cex.lab=.8, cex.axis=.8) 
with(data2, {
     plot(datetime, Global_active_power, type="l" 
          ,xlab="" ,ylab="Global Active Power" )

     plot(datetime, Voltage, type="l" )
     
     plot(datetime, Sub_metering_1, type="n",xlab="" ,ylab="Energy sub metering" )
     lines(datetime, Sub_metering_1, col = "black" )
     lines(datetime, Sub_metering_2, col = "red")
     lines(datetime, Sub_metering_3, col = "blue")
     legend("topright", cex=.8, bty="n"
       , col=c("black","red","blue")
       , legend=names(data2[7:9])
       , lty=c(1,1))

     plot(datetime, Global_reactive_power, type="l" )
})

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
