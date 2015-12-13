## read in the text file
## since it is a semicolon delimited file use sep as semi colon and headings are in first row
dat <- read.table("household_power_consumption.txt", header = T, sep= ";")

#convert the date and time columns in to the date and time classes in R
dat$Date <-as.Date(dat$Date, format = "%d/%m/%Y")

##index the data frame for the required dates of 2007-02-01 and 2007-02-02
dat2 <- dat[(dat$Date=="2007-2-1" | dat$Date=="2007-2-2" ), ]
##convert global active power column to numeric
dat2$Global_active_power <- as.numeric(as.character(dat2$Global_active_power))

#send the plot to PNG

png('plot1.png', width=480, height=480)

##plot the histogram
#Title:Global Active Power
#x-ais Global Activer Power (kilowatts)
# column color red
hist(dat2$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col ='red')
##complete plot
dev.off()
