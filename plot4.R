# read in the text file
# since it is a semicolon delimited file use sep as semi colon and headings are in first row

dat <- read.csv("household_power_consumption.txt", head = TRUE, sep= ";", na.strings ="?")

#convert the date and time columns in to the date and time classes in R
dat$Date <-as.Date(dat$Date, format = "%d/%m/%Y")

#index the data frame for the required dates of 2007-02-01 and 2007-02-02
dat2 <- dat[(dat$Date=="2007-2-1" | dat$Date=="2007-2-2" ), ]
#convert global active power column to numeric
dat2$Global_active_power <- as.numeric(as.character(dat2$Global_active_power))


#Combine the date and the time 
dat2$DateTime <- strptime(paste(dat2$Date, dat2$Time), "%Y-%m-%d %H:%M:%S")


#send the plot to PNG


png(filename='plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))

##top left graph for active power
plot(dat2$DateTime, dat2$Global_active_power, type = "l",ylab="Global Active Power",xlab="")

##top right grapf for voltage
plot(dat2$DateTime, dat2$Voltage, type = "l",ylab="Voltage",xlab="datetime")

##bottom left graph for metering
plot(dat2$DateTime, as.numeric(as.character(dat2$Sub_metering_1)), type = "l",ylab="Energy sub metering",xlab="")
lines(dat2$DateTime,as.numeric(as.character(dat2$Sub_metering_2)), type="l", col="red")
lines(dat2$DateTime,as.numeric(as.character(dat2$Sub_metering_3)), type="l", col="blue")
legend("topright", legend=names(dat2[7:9]), lty=1, col=c("black","red","blue"), cex=0.4)

##bottom right for reacive power
plot(dat2$DateTime, as.numeric(as.character(dat2$Global_reactive_power)), type = "l",ylab="Global_reactive_power",xlab="datetime")

dev.off()