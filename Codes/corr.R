corr <- function(directory, threshold = 0){
    
    files <- list.files(path=directory)
    setwd(directory)
    result <- do.call(rbind, lapply(files, read.csv))
    obs <- complete(directory)
    
    sub_result <- subset(result, ID %in% subset(obs, nobs > threshold)$ID)

    tmp <- sub_result[complete.cases(sub_result),]
    cor_result<-cor(tmp$sulfate,tmp$nitrate, use="pairwise.complete.obs")


    return(cor_result)
   
}

