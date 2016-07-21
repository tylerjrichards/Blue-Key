#this analysis is much easier than the others. The summary function gives a good indication of the breakdown, especially compared to the racial breakdown
#load dataset
admin <- `BK.Entrance...Sheet1.(1)`


#breakdown of IFC
IFC <- subset(admin$IFC.Fraternity != 'None')
summary(IFC)
barplot(IFC)

#compared to total
#can be easily accomplished from summary(admin)
summary(admin)

#or instead of ^

v <- admin$Race
summary(v)
