pollutantmean <- function(directory, pollutant, id = 1:332){
    
    files <- list.files(path= directory)
    setwd(directory)
    result <- do.call(rbind, lapply(files, read.csv))
    sub_result <- subset(result, ID %in% id)
    if (pollutant == "nitrate"){
        nit_mean <- mean(sub_result$nitrate, na.rm=TRUE)
        return(nit_mean)
    } 
    else if (pollutant == "sulfate"){
        sul_mean <- mean(sub_result$sulfate, na.rm=TRUE)
        return(sul_mean)
    }
    
}


