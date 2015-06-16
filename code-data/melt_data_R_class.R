library(reshape2)
library(plyr)
library(stringr)

?melt
pew  <- read.delim(file= "pew.txt")
str(pew)
names(pew)

#with this data,, we could do with one variables as religion, one with income and one with 
#melt the variables, use "id.vars="variable name" that you need to repeat to melt other variables
#you could melt the result based on 2 variables: pew.better  <- melt(pew, id.vars = c("religion", "X..10k))
pew.better  <- melt(pew, id.vars = "religion")
str(pew.better)
head(pew.better)

#rename the data
names(pew.better)  <-  c("religion", "income", "n")
head(pew.better)
