Plot3 <- function(directory) {
    setwd(directory)
    
    data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
    
    data_sub <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]
    data_sub[,1] = as.Date(data_sub[,1],"%d/%m/%Y")
    data_sub[,7] = as.numeric(as.character(data_sub[,7]))
    data_sub[,8] = as.numeric(as.character(data_sub[,8]))
    data_sub[,9] = as.numeric(as.character(data_sub[,9]))
    data_sub$datetime = paste(data_sub$Date, data_sub$Time)
    data_sub$datetime = as.POSIXct(data_sub$datetime)
    
    library(datasets)
    
    png(file = "plot3.png", width=480, height=480)
    par(bg=NA)
    
    with(data_sub, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))        
    lines(data_sub$datetime, data_sub$Sub_metering_1, type="l")
    lines(data_sub$datetime, data_sub$Sub_metering_2, type="l", col="red")
    lines(data_sub$datetime, data_sub$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

    dev.off()
}