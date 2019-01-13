source("./dataprep.R")


## PREP
#######################################
# Setup work dir
org_wd <- getwd()
new_wd <- file.path(org_wd, paste("work", format(Sys.time(), "%Y%m%d-%H%M%S"), sep = "."))
dir.create(new_wd, showWarnings = FALSE)
setwd(new_wd)

# Download and load data
d <- dprep()


## PROT
#######################################
png("../plot3.png", width=480, height=480)
with(d, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(d, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(d, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()


## FIN
#######################################
setwd(org_wd)