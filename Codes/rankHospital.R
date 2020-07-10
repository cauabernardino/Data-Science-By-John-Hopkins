rankhospital <- function(state, outcome, num) {
    
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
    
    # States
    states <- ds[, 2]
    states <- unique(states)
    if( state %in% states == FALSE ) {
        stop("invalid state")
    }
    
    # num
    if( num != "best" && num != "worst" && num%%1 != 0 ) {
        stop("invalid num")
    }
    
    # Filter rows by state	 
    ds <- ds[ds$state==state & ds[outcome] != 'Not Available', ]
    
    # Order ds by name and outcome
    ds[outcome] <- as.data.frame(sapply(ds[outcome], as.numeric))
    ds <- ds[order(ds$name, decreasing = FALSE), ]
    ds <- ds[order(ds[outcome], decreasing = FALSE), ]
    
    # Get num index
    vals <- ds[, outcome]
    if( num == "best" ) {
        rowNum <- which.min(vals)
    } else if( num == "worst" ) {
        rowNum <- which.max(vals)
    } else {
        rowNum <- num
    }
    
    # Return the hospital
    ds[rowNum, ]$name
}