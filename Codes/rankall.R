rankall <- function(outcome, num = "best") {
    # Outcomes
    outcomes = c("heart attack", "heart failure", "pneumonia")
    if( outcome %in% outcomes == FALSE ) {
        stop("invalid outcome")
    }
    
    # Read data and sort columns
    ds <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ds <- ds[c(2, 7, 11, 17, 23)]
    names(ds)[1] <- "name"
    names(ds)[2] <- "state"
    names(ds)[3] <- "heart attack"
    names(ds)[4] <- "heart failure"
    names(ds)[5] <- "pneumonia"
    
    
    # num
    if( num != "best" && num != "worst" && num%%1 != 0 ) {
        stop("invalid num")
    }
    
    # Grab only rows with data in our outcome
    ds <- ds[ds[outcome] != 'Not Available', ]

    # Order the data
    ds[outcome] <- as.data.frame(sapply(ds[outcome], as.numeric))
    ds <- ds[order(ds$name, decreasing = FALSE), ]
    ds <- ds[order(ds[outcome], decreasing = FALSE), ]
    
    # Function to process the num argument
    getHospByRank <- function(df, s, n) {
        df <- df[df$state==s, ]
        vals <- df[, outcome]
        if( n == "best" ) {
            rowNum <- which.min(vals)
        } else if( n == "worst" ) {
            rowNum <- which.max(vals)
        } else {
            rowNum <- n
        }
        df[rowNum, ]$name
    }
    
    # For each state, find the hospital of the given rank
    states <- ds[, 2]
    states <- unique(states)
    newdata <- data.frame("hospital"=character(), "state"=character())
    for(st in states) {
        hosp <- getHospByRank(ds, st, num)
        newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
    }
    
    # Return a data frame with the hospital names and the (abbreviated) state name
    newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
    newdata
}