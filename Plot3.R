plot3 <- function(){
  
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
  
  ## 4. Plot histograma
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)

  ## 4. Plot histograma
  Plot3.png <- plot(data$Datetime, data$Sub_metering_1, 
       type="l", ylab="Energy sub meeting", xlab="")
  lines(data$Datetime, data$Sub_metering_2, col="orange")
  lines(data$Datetime, data$Sub_metering_3, col="pink")
  legend("topright", lty=1, col = c("black", "orange", "pink"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

  ## 5. Saving file
  dev.copy(png, file="Plot3.png", height=400, width=400)
  dev.off()
  }
  