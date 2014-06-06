#setwd(Sys.getenv('USERPROFILE'))
#setwd("Google Drive/Coursera/Exploratory Data Analysis/ExData_Plotting1")

fname ="household_power_consumption.txt" 
#scan(file=fname, what=character(), nlines = 10, sep="")
classes = c(rep("character", 2), rep("double", 7))

data <- read.table(file=fname, header=TRUE, colClasses = classes, sep=";", na.strings="?")
data2 <- subset(data, grepl("^[12]/2/2007", data$Date))

#convert the dates
data2$Rtime <- strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S") #faster

#subset the dates we are interested in
#data2 <- subset(data, Rtime >= "2007-02-01" & Rtime <= "2007-02-02")
rm(data)

par(cex=.8)
plot(data2$Rtime, data2$Sub_metering_1, type="n"
     ,xlab=""
     ,ylab="Energy sub metering" )

lines(data2$Rtime, data2[,7], col = "black" )
lines(data2$Rtime, data2[,8], col = "red")
lines(data2$Rtime, data2[,9], col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , legend=names(data2[7:9])
       , lty=c(1,1))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
