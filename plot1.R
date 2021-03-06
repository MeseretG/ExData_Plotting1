plot1 <- function(){
    ## Read the data 
    initial <- read.table("Data/household_power_consumption.txt", nrow = 100, header=T, sep = ";")
    classes <- lapply(initial, class) 
    data <- read.table("Data/household_power_consumption.txt", header=TRUE, sep = ";", colClasses = classes, na.strings="?")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
    feb <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ] 
    png("plot1.png")
    hist(feb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") 
    dev.off()
    
}
    