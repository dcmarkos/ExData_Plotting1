plot4 <- function(){
    # read in file
    pc_file<-"exdata-data-household_power_consumption/household_power_consumption.txt"
    col.names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
    pc_df<-read.table(pc_file,  sep = ";", col.names = col.names, na.strings = "?", nrows = 43200, skip = 43200, stringsAsFactors = FALSE)
    #subset df
    pc_df$datetime<-strptime(paste(pc_df$Date,pc_df$Time), format = "%d/%m/%Y %H:%M:%S")
    pc_df<-subset(pc_df, pc_df$datetime >= "2007-02-01" & pc_df$datetime < "2007-02-03", select = 3:10 )
    pc_df<- pc_df[c(8,1,2,3,4,5,6,7)]
    
    #plot plot4 to png
    png("plot4.png")
    par(mfcol = c(2,2))
    with(pc_df,{
        #upper left
        par(font.lab = 2, font.axis = 2)
        plot(datetime,Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
        #lower left
        plot(datetime,sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
        points(datetime,sub_metering_2,type="l",col="red")
        points(datetime,sub_metering_3,type="l",col="blue")
        legend("topright", col = c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n")
        #upper right
        plot(datetime,Voltage, type = "l")
        #lower right
        plot(datetime,Global_reactive_power, type = "l")
    })
    dev.off()
    
    #plot plot4 to screen
    par(mfcol = c(2,2))
    with(pc_df,{
        #upper left
        par(font.lab = 2, font.axis = 2)
        plot(datetime,Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
        #lower left
        plot(datetime,sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
        points(datetime,sub_metering_2,type="l",col="red")
        points(datetime,sub_metering_3,type="l",col="blue")
        legend("topright", col = c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n")
        #upper right
        plot(datetime,Voltage, type = "l")
        #lower right
        plot(datetime,Global_reactive_power, type = "l")
    })
}