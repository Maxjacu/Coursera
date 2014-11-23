df <-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" )
agricultureLogical <- df$ACR > 2 & df$AGS > 5
which(agricultureLogical)
