
#dataset available in its everchaning format at https://docs.google.com/spreadsheets/d/1-S7jnmRpUl23AG9VPNey04-OEdh3W7ZqICD4GoHpjeQ/edit?usp=sharing
#the dataset is called admin in this example

#the point of this bit is to get a graph of the Non-white entrants to Blue Key

#this bit creates a subset of the data by year
subset1 = subset(admin, admin$Year == 'Fall 2013')
subset2 = subset(admin, admin$Year == 'Fall 2014')
subset3 = subset(admin, admin$Year == 'Fall 2015')
subset4 = subset(admin, admin$Year == 'Fall 2016')
subset5 = subset(admin, admin$Year == 'Spring 2013')
subset6 = subset(admin, admin$Year == 'Spring 2014')
subset7 = subset(admin, admin$Year == 'Spring 2015')
subset8 = subset(admin, admin$Year == 'Spring 2016')

#this isolates each subset for 'Non-White' and counts the Non-White members
Fall.2013 = length(which(subset1$Non.White == 'Non-White'))
Fall.2014 = length(which(subset2$Non.White == 'Non-White'))
Fall.2015 = length(which(subset3$Non.White == 'Non-White'))
Fall.2016 = length(which(subset4$Non.White == 'Non-White'))
Spring.2013 = length(which(subset5$Non.White == 'Non-White'))
Spring.2014 = length(which(subset6$Non.White == 'Non-White'))
Spring.2015 = length(which(subset7$Non.White == 'Non-White'))
Spring.2016 = length(which(subset8$Non.White == 'Non-White'))
