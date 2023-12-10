library("data.table")

# Set the working directory with corrected file path
setwd("C:/Users/chira/Downloads/exdata_data_household_power_consumption")

# Reads in data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

# Prevents histogram from printing in scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type (adjust the format based on your actual date format)
powerDT[, Date := lapply(.SD, as.Date, format = "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Create a histogram plot and save it as plot1.png
png("plot1.png", width = 480, height = 480)

## Plot 1
hist(powerDT[, Global_active_power], main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()
