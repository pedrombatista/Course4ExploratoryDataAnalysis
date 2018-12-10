plot4 <- function(){
  
  ## 1. Read data
  ## 2. Subset days
  ## 3. Generate histogram
  ## 4. Plot histograma
  ## 5. Saving file
  
  ## 1. Read data
  setwd("~/Dropbox/DATA SCIENCE/COURSE 4 WEEK 1 PROJECT")
  data_full <- read.csv("./household_power_consumption.txt", 
                        header=T, sep=';', na.strings="?",
                        nrows=2075259, check.names=F, 
                        stringsAsFactors=F, comment.char="", quote='\"')
  data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

  ## 2. Subset days
  data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(data_full)

  ## 3. Generate histogram
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)

  ## 4. Plot histograma
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Activity", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
    lines(data$Datetime, data$Sub_metering_2, col="orange")
    lines(data$Datetime, data$Sub_metering_3, col="pink")
    legend("topright", col=c("black", "orange", "pink"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l",ylab="Global Reactivity",xlab="")
  })
  
  ## 5. Saving file
  dev.copy(png, file="Plot4.png", height=480, width=480)
  dev.off()
  }