##NOTE: Set wd to parent directory where you placed the specdata folder##

pd <- "/Users/ECFC3/Documents/courseera/" #INPUT YOUR PARENT DIRECTORY HERE

setwd(pd)

corr <- function(directory, threshold = 0) {
    list <- as.data.frame(complete("specdata",1:332))
    dir <- paste(getwd(),"/",directory,sep = "")
    setwd(dir)
    files <- list.files()
    comp <- which(list$nobs > threshold)
    data <- NULL
    if(comp == 0){
        data <- 0
    } else {
        for(i in 1:length(comp)) {
            x <- files[comp[i]]
            monitor <- read.csv(x)
            monitor <- monitor[complete.cases(monitor) == T,]
            correl <- cor(monitor$sulfate, monitor$nitrate)
            data <- c(data,correl)
        }}
    setwd(pd)
    data
}