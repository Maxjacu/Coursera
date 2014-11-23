text <- read.fwf("getdata_wksst8110.for", skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))

sum(text$V4) +sum(text$V9)
 
