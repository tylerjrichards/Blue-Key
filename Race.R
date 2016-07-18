
#dataset available in its everchaning format at https://docs.google.com/spreadsheets/d/1-S7jnmRpUl23AG9VPNey04-OEdh3W7ZqICD4GoHpjeQ/edit?usp=sharing
#the data are called admin and UFDem respectively, they are different sheets on the above link
#ggplot2 is used here, download it before reproducing


admin <- `BK.Entrance...Sheet1.(1)`
UFDem <- `BK.Entrance...UF.Breakdown.(1)`

#this bit creates a subset of the data by year
subset1 <- subset(admin, admin$Year == 'Fall 2013')
subset2 <- subset(admin, admin$Year == 'Fall 2014')
subset3 <- subset(admin, admin$Year == 'Fall 2015')
subset4 <- subset(admin, admin$Year == 'Spring 2013')
subset5 <- subset(admin, admin$Year == 'Spring 2014')
subset6 <- subset(admin, admin$Year == 'Spring 2015')
subset7 <- subset(admin, admin$Year == 'Spring 2016')

#this isolates each subset for 'Non-White' and counts the Non-White members by percentage of total
Fall.2013 <- 100*length(which(subset1$Non.White == 'Non-White'))/(length(which(subset1$Non.White == 'White')))
Fall.2014 <- 100*length(which(subset2$Non.White == 'Non-White'))/(length(which(subset2$Non.White == 'White')))
Fall.2015 <- 100*length(which(subset3$Non.White == 'Non-White'))/(length(which(subset3$Non.White == 'White')))
Spring.2013 <- 100*length(which(subset4$Non.White == 'Non-White'))/(length(which(subset4$Non.White == 'White')))
Spring.2014 <- 100*length(which(subset5$Non.White == 'Non-White'))/(length(which(subset5$Non.White == 'White')))
Spring.2015 <- 100*length(which(subset6$Non.White == 'Non-White'))/(length(which(subset6$Non.White == 'White')))
Spring.2016 <- 100*length(which(subset7$Non.White == 'Non-White'))/(length(which(subset7$Non.White == 'White')))
x <- c(Spring.2013, Fall.2013, Spring.2014, Fall.2014, Spring.2015, Fall.2015, Spring.2016)


T <- subset(UFDem, UFDem$Race == 'Non-White')
T2013 <- subset(T, T$Year == '2013')
T2014 <- subset(T, T$Year == '2014')
T2015 <- subset(T, T$Year == '2015')
T2016 <- subset(T, T$Year == '2016')
T <- c(T2013$Percent.total, T2013$Percent.total, T2014$Percent.total, T2014$Percent.total, T2015$Percent.total, T2015$Percent.total, T2016$Percent.total)


