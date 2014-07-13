#project 1 Exploratory Data Analysis
#plot 3

#*************************************************************************
#reading the file
tab5rows <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", sep=";",header = TRUE, colClasses = classes, na.strings="?")

#subsetting the data to get the required date range
requiredData<- subset(tabAll, Date=="1/2/2007" |Date=="2/2/2007")
rm(tabAll)
#making the data types of Data and Time
requiredData$Date<-as.Date(requiredData$Date, format="%d/%m/%Y")
requiredData$datetime<-strptime(paste(requiredData$Date, requiredData$Time), format="%Y-%m-%d %H:%M:%S")

#**************************************************************************


#**************************************************************************
#ploting to a png file
png(filename = "plot3.png",    width = 480, height = 480, units = "px")

with(requiredData, plot(datetime,Sub_metering_1,type="l", xlab="", ylab="Energy Sub metering"))
with(requiredData, lines(datetime,Sub_metering_2,type="l", xlab="", ylab="Energy Sub metering", col="red"))
with(requiredData, lines(datetime,Sub_metering_3,type="l", xlab="", ylab="Energy Sub metering", col="blue"))
legend("topright",pch=NA,lty=1,col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
#**************************************************************************
