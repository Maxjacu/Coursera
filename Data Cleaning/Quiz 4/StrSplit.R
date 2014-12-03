df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" )
dt.str <- strsplit(colnames(df), "wgtp")
dt.str[[123]]
