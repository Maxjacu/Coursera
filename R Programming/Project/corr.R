corr <- function(directory, threshold = 0) {
    df <- complete(directory)[df.export$nobs > threshold,]
    i <- df$id
    df["Correlation"] <- cor(df)
}
corr("specdata", 900)
