Plot4 <- function(directory) {
    setwd(directory)
    
    data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
    
    data_sub <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]
    data_sub[,1] = as.Date(data_sub[,1],"%d/%m/%Y")
    data_sub[,3] = as.numeric(as.character(data_sub[,3]))
    data_sub[,4] = as.numeric(as.character(data_sub[,4]))
    data_sub[,5] = as.numeric(as.character(data_sub[,5]))
    data_sub[,7] = as.numeric(as.character(data_sub[,7]))
    data_sub[,8] = as.numeric(as.character(data_sub[,8]))
    data_sub[,9] = as.numeric(as.character(data_sub[,9]))
    data_sub$datetime = paste(data_sub$Date, data_sub$Time)
    data_sub$datetime = as.POSIXct(data_sub$datetime)
    
    library(datasets)
    
    png(file = "plot4.png", width=480, height=480)
    par(mfcol=c(2,2), mar=c(5,5,1,1), bg=NA)
    
    plot(Global_active_power ~ datetime, data_sub, type="l", xlab="", ylab="Global Active Power")
    
    with(data_sub, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))        
    lines(Sub_metering_1 ~ datetime, data_sub, type="l")
    lines(Sub_metering_2 ~ datetime, data_sub, type="l", col="red")
    lines(Sub_metering_3 ~ datetime, data_sub, type="l", col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")
    
    plot(Voltage ~ datetime, data_sub, type="l")
    
    plot(Global_reactive_power ~ datetime, data_sub, type="l")
    
    dev.off()
}