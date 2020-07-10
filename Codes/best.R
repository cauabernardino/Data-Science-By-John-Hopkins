best <- function(state, outcome) {
    
    # Outcomes
    outcomes = c("heart attack", "heart failure", "pneumonia")
    
    if( outcome %in% outcomes == FALSE ) {
        stop("invalid outcome")
    }
    
    # Read data
    ds <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # Columns in ds with new names ("name", "state", "heart attack", etc)

    ds <- ds[c(2, 7, 11, 17, 23)]
    names(ds)[1] <- "name"
    names(ds)[2] <- "state"
    names(ds)[3] <- "heart attack"
    names(ds)[4] <- "heart failure"
    names(ds)[5] <- "pneumonia"
    
    # Get a vector of all of the states in 'data' now at column "state"
    states <- ds[,"state"]
    states <- unique(states)
    if( state %in% states == FALSE ) {
        stop("invalid state")
    }
    
    # Filter rows by state	
    ds <- ds[ds$state==state & ds[outcome] != 'Not Available', ]
    vals <- ds[, outcome]
    
    # Take the min value
    rowNum <- which.min(vals)
    
    # Return the hospital
    ds[rowNum, ]$name
}