plot1 <- function(){
  
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
  Plot1.png <- hist(data$Global_active_power, 
       main="Global Activity", 
       xlab="Global Active Power (kw)", 
       ylab="Freq", col="Blue")

  ## 5. Saving file
  dev.copy(png, file="Plot1.png", height=400, width=400)
  dev.off()
}