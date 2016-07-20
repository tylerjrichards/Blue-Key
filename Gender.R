#this bit creates a subset of the data by year
subset1 = subset(admin, admin$Year == 'Fall 2013')
subset2 = subset(admin, admin$Year == 'Fall 2014')
subset3 = subset(admin, admin$Year == 'Fall 2015')
subset4 = subset(admin, admin$Year == 'Spring 2013')
subset5 = subset(admin, admin$Year == 'Spring 2014')
subset6 = subset(admin, admin$Year == 'Spring 2015')
subset7 = subset(admin, admin$Year == 'Spring 2016')

#gender breakdown by year, can be done using dpylr more easily but this works as well
a <- length(which(subset1$Gender == 'f'))
b <- length(which(subset2$Gender == 'f'))
c <- length(which(subset3$Gender == 'f'))
d <- length(which(subset4$Gender == 'f'))
e <- length(which(subset5$Gender == 'f'))
f <- length(which(subset6$Gender == 'f'))
g <- length(which(subset7$Gender == 'f'))

#graph over time
h <- c(a, b, c, d, e, f, g)
barplot(h)
