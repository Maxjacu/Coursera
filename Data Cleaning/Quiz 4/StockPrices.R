library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
sampleTimes
count(amzn['2012'])

amzn['2012'][.indexwday(amzn['2012']) %in% 0:0]
count(amzn['2012'][.indexwday(amzn['2012']) %in% 0:0])
