plot3 <- function(){
    ## Read the data 
    initial <- read.table("Data/household_power_consumption.txt", nrow = 100, header=T, sep = ";")
    classes <- lapply(initial, class) 
    data <- read.table("Data/household_power_consumption.txt", header=TRUE, 
                       sep = ";", colClasses = classes, na.strings="?")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
    feb <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ] 
    feb <- within(feb, DateTime <- as.POSIXlt(paste(as.character(Date), 
                                                    as.character(Time), format = "%Y %m %d %H %M $S")))
    png("plot3.png")
    plot(feb$DateTime, feb$Sub_metering_1, type = "n", ylab = "Eneregy sub metering", xlab = "") 
    legend("topright", pch="-", col=c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lines(feb$DateTime, feb$Sub_metering_1, col="black")
    lines(feb$DateTime, feb$Sub_metering_2, col="red") 
    lines(feb$DateTime, feb$Sub_metering_3, col="blue") 
    dev.off()
}
