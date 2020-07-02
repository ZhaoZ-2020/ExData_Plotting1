
## Read in the data (with the txt file in the working directory)
## for Dates 1/2/2007 and 2/2/2007 only 

tempdata <- read.table("household_power_consumption.txt", header=T, sep=";", nrows = 5)
colna<-colnames(tempdata)
classes <- sapply(tempdata, class)

data<-read.table("household_power_consumption.txt", sep=";", col.names=colna,
                 colClasses=classes, skip=66637, nrows=2880)


## Create a new variable contains the date and time, 
## and change its class to Date

data$DT <- paste(data$Date, data$Time)
data$DT[1:5]
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
data$DT[1:5]
class(data$DT)


## Construct the 2nd plot and 
## save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(file="plot2.png", width=480, height=480)

with(data, plot(DT, Global_active_power, type="l", 
                xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

