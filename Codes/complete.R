complete <- function(directory, id = 1:332){
    library(plyr)
    
    files <- list.files(path=directory)
    setwd(directory)
    result <- do.call(rbind, lapply(files, read.csv))
    sub_result <- subset(result, ID %in% id)
    res <- count(sub_result[complete.cases(sub_result),], vars="ID")
    colnames(res) <- c("ID", "nobs")
    res
}