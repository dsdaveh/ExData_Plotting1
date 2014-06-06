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


plot(data2$Rtime, data2$Global_active_power, type="l" 
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,cex.lab = .8
     ,cex.main = .8
     ,cex.axis = .8
     )

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
