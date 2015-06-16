#load library
library(ggplot2)
# use dataframe of mpg, which is embedded already
str(mpg)

levels(mpg$class)
#subset factors
mpg1  <- subset(mpg, subset=class=="midsize")
#the level of mpg$class is the same as mpg1$class, just the item other than midsizes has 0 in it
levels(mpg1$class)
boxplot(mpg$cty ~ mpg$class)
boxplot(mpg1$cty ~ mpg1$class)

#to change the level
droplevels(mpg1$class)
#boxplot with droplevel
boxplot(mpg1$cty ~ droplevels(mpg1$class))

#basic plot
qplot(displ, hwy, data=mpg)
plot(mpg$disp, mpg$hwy)

#add color in qplot
qplot(displ, hwy, data=mpg, col=class)
#if you color by the continuous variables, it will go up in a gradient.
qplot(displ, hwy, data=mpg, col=cty)
# make the qplot(displ, hwy, data=mpg, col=cty) as p
p <- qplot(displ, hwy, data=mpg, col=cty)
#add linear regression in it. stat_smooth is a way to add regression line
p + stat_smooth(method="lm")
# level of confidence is 0.99, the gray area is wider now
p + stat_smooth(method="lm", level=0.99)

##switch to ggplot, refer to http://docs.ggplot2.org/current/
#initiate with ggplot and then add other option, aes means setting x,y
ggplot(data = mpg, aes (x =displ, y= hwy))+
  geom_point (aes (color=cty))+
  stat_smooth (method = "lm", level= 0.99)

#setting size by cyl, shape by class
ggplot(data = mpg, aes (x =displ, y= hwy))+
  geom_point (aes (color=cty, size=factor(cyl), shape = class))+
  stat_smooth (method = "lm", level= 0.99)

##Faceting
#facet_grid by cyl as x of your grid
ggplot(data = mpg, aes (x =displ, y= hwy))+
  geom_point (aes (color=cty, shape = class))+
  stat_smooth (method = "lm", level= 0.99)+
  facet_grid(. ~ cyl)

#facet_grid by cyl as y of your grid
ggplot(data = mpg, aes (x =displ, y= hwy))+
  geom_point (aes (color=cty, shape = class))+
  stat_smooth (method = "lm", level= 0.99)+
  facet_grid(cyl~.)

#facet by two, cyl and drv
ggplot(data = mpg, aes (x =displ, y= hwy))+
  geom_point (aes (color=cty, shape = class))+
  stat_smooth (method = "lm", level= 0.99)+
  facet_grid(cyl~ drv)

