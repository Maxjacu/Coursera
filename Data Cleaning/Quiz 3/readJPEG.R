jp<-readJPEG("getdata_jeff.jpg",native=TRUE)

quantile(jp, c(0.3, 0.8))
