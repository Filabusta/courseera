##NOTE: Set wd to parent directory where you placed the specdata folder##

pd <- "/Users/ECFC3/Documents/courseera/" #INPUT YOUR PARENT DIRECTORY HERE
    
setwd(pd)

complete <- function(directory, id = 1:332){
    dir <- paste(getwd(),"/",directory, sep = "")
    setwd(dir)
    
    files <- list.files()
    
    data <- NULL
    
    for(i in 1:length(id)){
        x <- id[i]
        a <- files[x]
        monitor <- read.csv(a)
        nobs <- sum(complete.cases(monitor) == TRUE)
        mdat <- cbind(x, nobs)
        data <- rbind(data,mdat)
    }
    setwd(pd)
    data
}