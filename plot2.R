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
png("../plot2.png", width=480, height=480)
with(d, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()


## FIN
#######################################
setwd(org_wd)