plot2 <- function(){
    ## Read the data 
    initial <- read.table("Data/household_power_consumption.txt", nrow = 100, header=T, sep = ";")
    classes <- lapply(initial, class) 
    data <- read.table("Data/household_power_consumption.txt", header=TRUE, 
                    sep = ";", colClasses = classes, na.strings="?")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
    feb <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ] 
    feb <- within(feb, DateTime <- as.POSIXlt(paste(as.character(Date), 
                    as.character(Time), format = "%Y %m %d %H %M $S")))
    
    png("plot2.png")
    plot(feb$DateTime, as.numeric(as.character(feb$Global_active_power)), type = "n")
    plot(feb$DateTime, as.numeric(as.character(feb$Global_active_power)), type = "l", 
                    ylab = "Global Active Power (kilowatt)", xlab = "")
    dev.off()
}
