
plot1 <- function(){
    # read in file
    pc_file<-"exdata-data-household_power_consumption/household_power_consumption.txt"
    col.names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
    pc_df<-read.table(pc_file,  sep = ";", col.names = col.names, na.strings = "?", nrows = 43200, skip = 43200, stringsAsFactors = FALSE)
    #subset df
    pc_df$datetime<-strptime(paste(pc_df$Date,pc_df$Time), format = "%d/%m/%Y %H:%M:%S")
    pc_df<-subset(pc_df, pc_df$datetime >= "2007-02-01" & pc_df$datetime < "2007-02-03", select = 3:10 )
    pc_df<- pc_df[c(8,1,2,3,4,5,6,7)]
    
    #plot plot1 to png
    png("plot1.png")
    par(lwd = 2, font.main = 2, font.lab = 2, font.axis = 2)
    hist(pc_df$Global_active_power, col = "#990000",xlab = "Global Active Power (kilowatts)", main = "")
    title("Global Active Power")
    dev.off()
    
    #plot plot1 to screen
    par(lwd = 2, font.main = 2, font.lab = 2, font.axis = 2)
    hist(pc_df$Global_active_power, col = "#990000",xlab = "Global Active Power (kilowatts)", main = "")
    title("Global Active Power")
}    
    