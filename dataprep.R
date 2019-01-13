## Func 
dprep <- function() {

    # Download data and unzip
    tmp <- "./data.zip"
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tmp, "curl")
    unzip(tmp)

    f <- "household_power_consumption.txt"

    # Read data and select date
    d <- read.table(f, header = TRUE, sep = ";", stringsAsFactors=FALSE)
    d$Date <- as.Date(d$Date, tryFormats = c("%d/%m/%Y"))
    d <- subset(d, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
    DateTime <- strptime(paste(d$Date, d$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
    d <- cbind(d, DateTime)

    # return d
    invisible(d)
}