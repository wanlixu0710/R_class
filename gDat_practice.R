#importing gapmider, read.delim is a special type of read.table when it is tab deliminated, make sure that you read in the plain txt file
gDat  <- read.delim(file="Practice_data.txt")
#if import the csv, you could use gDat  <- read.table(file="Practice_data.txt", sep=",")
# if there is missing data, you can put gDat  <- read.table(file="Practice_data.txt", sep=",", fill=TRUE, header=TRUE), it will fill the missing data as NaN
str(gDat)
#select the year colum of the data
gDat$year
#mean of the coloum of year
mean(gDat$year)
#look the head of gDat data, with default setting
head(gDat)
#look the head of gDat and first 10 lines
head(gDat, n=10)
tail(gDat)
#look at headers
names(gDat)
#look at the dimension 
dim(gDat)
#look at how many rows 
nrow(gDat)
#look at how many colum
ncol(gDat)
length(gDat)
#create a csv that only contains the name, you could also name it as "names2.csv"
colnames  <- names(gDat)
write.csv(colnames, file="names2.txt")
#this is the same as the previous two steps, but just without creating colnames
write.csv(names(gDat), file="names2.txt")
#summarize gDat
summary(gDat)
#summarize a specific colum
summary(gDat$pop)
#this step is the same as the previous one
summary(gDat[,3])
#this data doesn't have row name, but if you want to look at the row name, you put row.names(gDat)

#making plot
plot(gDat$year, gDat$lifeExp)
#this is the same as the previous one
plot(gDat$lifeExp~gDat$year)
#simiar as previous two, just the name is different
plot(data=gDat, lifeExp~year)

#other way to look at the data
#look at the q plot, to see whether it is normal, the normal Q-Q plot should be roughly a straight line
qqnorm(gDat$gdpPercap)
qqnorm(gDat$lifeExp)

plot(gDat$gdpPercap, gDat$lifeExp)
gDat$log.gdp <- log10(gDat$gdpPercap)
plot(gDat$log.gdp, gDat$lifeExp)


plot(gDat$continent, gDat$gdpPercap)
#when the x is a factor, it is the same as boxplot, but the order is reversed
boxplot(gDat$gdpPercap ~ gDat$continent)
#if you have a second factor that you want to split the factor, you could do boxplot(gDat$gdpPercap ~ gDat$continent*secondfactor)


##subsetting
str(gDat)
#when you do subset, when you want the country equals, it is "==", everything but"!="
subset(gDat, subset=country=="China")
China  <- subset(gDat, subset=country=="China")
othercountry  <-  subset(gDat, subset=country!="China")
#if you subset couple of factors, use %in%
subset(gDat, subset=country %in% c("Japan", "China"))
#subset the lifeExp is less than 32
subset(gDat, subset = lifeExp <32)

mean(gDat$lifeExp)
#just want to calculate mean of a subset of the data
mean(subset(gDat, subset=country=="China")$lifeExp)
#plot the subset of China
plot(subset(gDat, subset=country=="China")$year, subset(gDat, subset=country=="China")$lifeExp)

pre90 <- gDat[gDat$year<1990]
#Index subsetting, choose all the rows that contains gDat$year > 1990 & gDat$lifeExp > 40, and "," at the end keep all the colums
gDat[gDat$year > 1990 & gDat$lifeExp < 30,]
#mean lifeExp of subset
mean(subset(gDat, subset=country=="China")$lifeExp)
#the same as the previous script
mean((gDat[gDat$country=="China",])$lifeExp)
#this script is looking at the mean lifeExp in the dataset of gDat, the same as mean(gDat$lifeExp)
with(gDat, mean(lifeExp)





