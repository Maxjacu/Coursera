pollutantmean <-function(directory, pollutant, id=1:332) {
  for (i in id) {
    df <- (read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep="")))
    print(apply(df, 1, means))
  }
  print(mean(vec))
}
pollutantmean("specdata", "nitrate", 1:2)
