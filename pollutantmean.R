##NOTE: Set wd to parent directory where you placed the specdata folder##

pd <- "/Users/ECFC3/Documents/courseera/" #INPUT YOUR PARENT DIRECTORY HERE

setwd(pd)

pollutantmean <- function(directory, pollutant, id = 1:332) {
    dir <- paste(getwd(),"/",directory, sep = "")
    setwd(dir)

    files <- list.files()
    
    data <- NULL
    
    for(i in 1:length(id)){
        a <- files[id[i]]
        monitor <- read.csv(a)
        data <- rbind(data, monitor)
    }
    setwd(pd)
    mean(data[,which(colnames(data) == pollutant)], na.rm = T)
}
