## Script to construct Plot 4 from the 'Electric power consumption' data set
## of the UC Irvine Machine Learning Repository

## This script uses the "get_data()" function from the plot1.R script 
## to retrieve the data and populate the data frame

###############################################################################
#                       Retrieves the data set                                #
###############################################################################

## Checks if the data frame "hpc_data" is present in the working directory,
## if not it calls the get_data() function to create the data frame

if(!"hpc_data" %in% ls()) {
        source("plot1.R")
        hpc_data <- get_data()
}
###############################################################################
#               Constructs the plot                                           #
##############################################################################

png("plot4.png")
par(mfrow = c(2, 2))
with(hpc_data, {
        plot(Date_Time, Global_active_power, type = "l", 
             xlab = "", ylab = "Global Active Power")
        plot(Date_Time, Voltage, type = "l",
             xlab = "datetime", ylab = "Voltage")
        plot(Date_Time, Sub_metering_1, type = "n",
             xlab = "", ylab = "Energy sub metering")
        points(Date_Time, Sub_metering_1, type = "l")
        points(Date_Time, Sub_metering_2, type = "l", col = "red")
        points(Date_Time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date_Time, Global_reactive_power, type = "l", xlab = "dateTime")
     }
)
dev.off()
