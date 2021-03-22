## Script to construct Plot 1 from the 'Electric power consumption' data set
## of the UC Irvine Machine Learning Repository

###############################################################################
#                       Retrieves the data set                                #
###############################################################################

## Creates a function to download the data, if necessarry, 
## and populates a data frame with the data from the required data

get_data <- function() {
file_name <- "household_power_consumption.txt"

## Download the file if not present in the working directory
if(!file.exists(file_name)) {
        download.file(paste("https://d396qusza40orc.cloudfront.net/",
                    "exdata%2Fdata%2Fhousehold_power_consumption.zip", sep = ""), 
                    "household_power_consumption.zip", 
                     method = "curl")
unzip("household_power_consumption.zip")
}

## Create a vector of column names as first line will be skipped when data read in
col_names <- names(read.table(file_name, header = TRUE, nrows = 5, sep = ";"))

## Creates a data frame of only the data for the required dates
hpc_data <- read.table(file_name,
                  header = FALSE, na.strings = "?", sep = ";",
                  skip = grep("1/2/2007", readLines(file_name)) - 1, 
                  # first row of date 1/2/2007 data skipped 
                  # hence: -1
                  nrows = sum(grepl("^[1 - 2]/2/2007", readLines(file_name))),
                  stringsAsFactors = FALSE,
                  col.names = col_names,
                  colClasses = c("character", "character", rep("numeric", 7))
                  # Date and time will be coerced into correct classes later
)

## Converts the Date and Time variables to the correct R classes
if("chron" %in% rownames(installed.packages()) == FALSE) install("chron")
library(chron)
hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")
hpc_data$Time <- times(hpc_data$Time)
}

###############################################################################
#               Constructs the plot                                           #
##############################################################################

png("plot1.png", 
    width = 480, height = 480, units ="px")
hist(hpc_data$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts")
dev.off()

