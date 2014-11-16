library(XML)
url<- "http://biostat.jhsph.edu/~jleek/contact.html"
html<- htmlTreeParse(url, useInternalNodes=T)
html
strsplit(as(html, "character"), "\n")[[1]][19]
doc <- htmlParse(html)

#Test
nchar(strsplit(as(html, "character"), "\n")[[1]][7])
nchar(strsplit(as(html, "character"), "\n")[[1]][16])
nchar(strsplit(as(html, "character"), "\n")[[1]][30])
nchar(strsplit(as(html, "character"), "\n")[[1]][100])
for (i in 1:100){
  print(i)
  print(nchar(strsplit(as(html, "character"), "\n")[[1]][i]))
  print(strsplit(as(html, "character"), "\n")[[1]][i])
}

df <- data.frame(html)
nchar(as.character("<meta name="Distribution" content="Global" />"))

t <- as.character("<link rel="stylesheet" href="images/PixelGreen.css" type="text/css" />")

sink('html.txt')
html
sink()
