#calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors
pollutantmean <-function(directory, pollutant, id=1:332) {
  vec <- numeric()
	for (i in id) {
		df <- (read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep="")))
		vec2 <- df[,pollutant]
		vec <- c(vec, vec2)
	}
  return(mean(vec, na.rm=TRUE))
}

