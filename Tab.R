library(ggplot2)
library(dplyr)

BK.Entrance...Entrance <- read.csv("~/Downloads/BK Entrance - Entrance.csv")
BK <- BK.Entrance...Entrance

#first set up a few datasets to make any calculations easier in the future
#Ph.D, Med, and Law students (mostly) cannot join IFC or PH greek life so they should not be included in the calculations
Undergrad <- filter(BK, BK$Involvement != "UF Law")
Undergrad <- filter(Undergrad, Undergrad$Involvement != "Ph.D student")
Undergrad <- filter(Undergrad, Undergrad$Involvement != "UF Med")
UndergradNG <- filter(Undergrad, Undergrad$IFC.Fraternity == "None")
summary(UndergradNG)
Female_Undergrad_NonGreek <- filter(UndergradNG, UndergradNG$Gender == "f")
Male_Undergrad_NonGreek <- filter(UndergradNG, UndergradNG$Gender == "m")

#How many undergrad whites without Greek Affiliation get into Blue Key?
#take the filtered datasets from above and finish with the summary function
summary(Male_Undergrad_NonGreek)
summary(Female_Undergrad_NonGreek)

#now for a gender breakdown
sum(BK$Gender == "f")/(sum(BK$Gender == "m")+sum(BK$Gender=="f"))*100

#Race vs Percentage of Population
#first you have to get the raw numbers for number of Greek members in Blue Key using summary or sum
POC <- filter(BK, BK$Non.White == "Non-White")
y = nrow(POC)
#next you have to control for the population of these groups
#UF has their breakdown by race online, and the average non-white population for the past few years has stayed steady at 35%
#now we need to find the percentage of Blue Key admits who are POC and compare the two

x = nrow(BK)
y = nrow(POC)
POCPerc = (y/x)*100
ActualPOCPerc = 35
Diff = ActualPOCPerc - POCPerc
#The difference? 12.6%
