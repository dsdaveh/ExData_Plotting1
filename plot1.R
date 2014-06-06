#setwd(Sys.getenv('USERPROFILE'))
#setwd("Google Drive/Coursera/Exploratory Data Analysis/ExData_Plotting1")

fname ="household_power_consumption.txt" 
#scan(file=fname, what=character(), nlines = 10, sep="")
classes = c(rep("character", 2), rep("double", 7))

tic <- Sys.time()
data <- read.table(file=fname, header=TRUE, colClasses = classes, sep=";", na.strings="?")
data2 <- subset(data, grepl("^[12]/2/2007", data$Date))
toc <- Sys.time();tic-toc

#convert the dates
data2$Rtime <- as.Date(strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")) #faster
#data$Rtime <- as.Date(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")) 
toc <- Sys.time();tic-toc

#subset the dates we are interested in
#data2 <- subset(data, Rtime >= "2007-02-01" & Rtime <= "2007-02-02")
rm(data)


hist(data2$Global_active_power 
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)"
     ,col="red"
     ,cex.lab = .8
     ,cex.main = .8
     ,cex.axis = .8
     )

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
