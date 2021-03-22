## Script to construct Plot 2 from the 'Electric power consumption' data set
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

png("plot2.png", width = 480, height = 480, units = "px")
with(hpc_data, plot(Date_Time, Global_active_power, type = "l", 
                    xlab = "", ylab = "Global Active Power (kilowatts)" ))
dev.off()


     
