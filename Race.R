admin = BKE
subset1 = subset(admin, admin$Year == 'Fall 2014')
subset2 = subset(admin, admin$Year == 'Fall 2013')
subset3 = subset(admin, admin$Year == 'Spring 2013')
subset4 = subset(admin, admin$Year == 'Spring 2014')

x = length(which(subset1$Non.White == 'Non-White'))
y = length(which(subset2$Non.White == 'Non-White'))
w = length(which(subset3$Non.White == 'Non-White'))
z = length(which(subset4$Non.White == 'Non-White'))