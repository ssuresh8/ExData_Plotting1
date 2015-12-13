## read in the text file
## since it is a semicolon delimited file use sep as semi colon and headings are in first row
dat <- read.csv("household_power_consumption.txt", head = TRUE, sep= ";", na.strings ="?")

#convert the date and time columns in to the date and time classes in R
dat$Date <-as.Date(dat$Date, format = "%d/%m/%Y")

##index the data frame for the required dates of 2007-02-01 and 2007-02-02
dat2 <- dat[(dat$Date=="2007-2-1" | dat$Date=="2007-2-2" ), ]
##convert global active power column to numeric
dat2$Global_active_power <- as.numeric(as.character(dat2$Global_active_power))


#Combine the date and the time 
dat2$DateTime <- strptime(paste(dat2$Date, dat2$Time), "%Y-%m-%d %H:%M:%S")

#send the plot to PNG

png('plot2.png', width=480, height=480, bg='transparent')

##
plot(dat2$DateTime, dat2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##complete plot
dev.off()