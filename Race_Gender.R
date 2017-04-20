#load all the necessary packages
library(dplyr)
library(ggplot2)
library(tidyr)
library(wru)
library(gender)

setwd("~/Documents/Data_Projects/Blue Key")

BlueKey <- read.csv("~/Documents/Data_Projects/Blue Key/BK_Entrance.csv")
BlueKey$surname <- toupper(BlueKey$Last)
BlueKey$Gender <- as.character(BlueKey$Gender)

#race.pred is the function that predicts race
BlueKey <- race.pred(voters = BlueKey, surname.only = TRUE)

#The next few lines predict gender by first name
BlueKey$Birth_Year <- as.character(BlueKey$Birth_Year)
BlueKey$First <- as.character(BlueKey$First)
Name_Analysis <- gender_df(BlueKey, name_col = "First", year_col = "Birth_Year", method = "ssa")
Name_Analysis$First <- Name_Analysis$name
BlueKeyTotal <- left_join(BlueKey, Name_Analysis, by = "First")
BlueKeyTotal <- BlueKeyTotal[!duplicated(BlueKeyTotal[c("First", "Last")]),]

#only run this line if you want to isolate for a certain number of columns
BlueKeyTotal <- BlueKeyTotal[, c(1,2, 3, 4, 23:27, 29, 30)]



x <- group_by(BlueKeyTotal, Year) %>%
  summarise(average=mean(pred.whi)) %>% 
  separate(Year, c("Semester", "Year"))

x <- group_by(x, Year) %>%
  summarise(average_percent_white = mean(average))

Race <- x
Race$Year <- as.integer(Race$Year)
rm(x)
UF_Demo <- read.csv("UF_Demo.csv")
RaceTotal <- left_join(Race, UF_Demo, by = "Year")
RaceTotal$BlueKey_Percentage <- RaceTotal$average_percent_white
RaceTotal$average_percent_white <- NULL
RaceTotal <- RaceTotal[c(1:17),]
RaceTotal$BlueKey_Percentage <- 100*RaceTotal$BlueKey_Percentage
write.csv(RaceTotal, "Race_BK.csv")


Gender_remove_NA <- BlueKeyTotal[complete.cases(BlueKeyTotal),]
Gender_Demo <- read.csv("UF_Gender_BreakDown.csv")
Gender <- group_by(Gender_remove_NA, Year) %>% 
  summarise(N_Women = mean(proportion_female)) %>% 
  separate(Year, c("Semester", "Year"))
Gender <- group_by(Gender, Year) %>% 
  summarise(average_female = mean(N_Women))
Gender <- Gender[c(1:16),]
Gender$Year <- as.integer(Gender$Year)
GenderTotal <- left_join(Gender, Gender_Demo, by = "Year")
GenderTotal$average_female_BK <- GenderTotal$average_female
GenderTotal$average_female <- NULL
write.csv(GenderTotal, "Gender_BK.csv")
