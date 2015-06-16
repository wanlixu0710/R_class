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

# Multiple variables in one column, "stringsAsFactors= FALSE" means not tale string as factors
raw  <- read.csv(file="tb.csv", stringsAsFactors= FALSE)
head (raw)
#thinks raw$new_sp as a sum data, so wants to get rid of the whole column
raw$new_sp <- NULL
#This step get rid of the head of new_sp_
names(raw) <- str_replace(names(raw), "new_sp_","")
head(raw)
