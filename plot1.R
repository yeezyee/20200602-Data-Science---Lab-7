library(data.table)

DT<-fread("./household_power_consumption.txt",na.strings = "?")

DT$strDate <- as.Date(DT$Date,"%d/%m/%Y")

DT.filter<-DT[DT$strDate=="2007-02-01" | DT$strDate=="2007-02-02",]
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
rm(DT)

png(filename="plot1.png", width=480, height = 480)
hist(DT.filter$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

