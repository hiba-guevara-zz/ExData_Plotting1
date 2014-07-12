Plot2 <- function(directory) {
    setwd(directory)
    
    data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
    
    data_sub <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]
    data_sub[,1] = as.Date(data_sub[,1],"%d/%m/%Y")
    data_sub[,3] = as.numeric(as.character(data_sub[,3]))
    data_sub$datetime = paste(data_sub$Date, data_sub$Time)
    data_sub$datetime = as.POSIXct(data_sub$datetime)
    
    library(datasets)
    
    png(file = "plot2.png", width=480, height=480)
    par(bg=NA)
    
    plot(data_sub$datetime, data_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

    dev.off()
}