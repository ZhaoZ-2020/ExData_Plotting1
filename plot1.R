
## Read in the data (with the txt file in the working directory)
## for Dates 1/2/2007 and 2/2/2007 only 

tempdata <- read.table("household_power_consumption.txt", header=T, sep=";", nrows = 5)
colna<-colnames(tempdata)
classes <- sapply(tempdata, class)

data<-read.table("household_power_consumption.txt", sep=";", col.names=colna,
                 colClasses=classes, skip=66637, nrows=2880)



## Construct the 1st plot and 
## save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(file="plot1.png", width=480, height=480)

hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
