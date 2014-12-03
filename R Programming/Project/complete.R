#reports the number of completely observed cases in each data file
complete <- function(directory, id = 1:332) {
    df.export <- data.frame(id)  
    k <- 1
    for (i in id) {
        df <- (read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep="")))
        df2 <- sum(!is.na(df[,c(2,3)]))
        df.export[k,2] <- df2
        k<- k+1
    }
    colnames(df.export) <- c("id", "nobs") 
    return(df.export)
}
