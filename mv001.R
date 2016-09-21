# Mud Volcano from Southwest of Taiwan Data.Frame

setwd('c:/MV')
Sys.setlocale(category = "LC_ALL", locale = "")
mv_data <- read.csv("mv001.csv", header= T, sep=",") #loading Mud Volcano Data 

# Change the Data.Frame name 
names(mv_data)#print the row 
names(mv_data)[1:12] <- 
    c("sample_day", 
      "site", 
      "Ar_conc", 
      "N2_conc", 
      "CO_conc", 
      "CH4_conc", 
      "CO2_conc", 
      "C2H6_conc", 
      "C3H8_conc", 
      "He_conc", 
      "H2_conc", 
      "O2_conc")

pd_air <- read.csv("pd2015.csv", header = T, sep=",") #Loading pd station 2015 Air Data
names(pd_air)
names(pd_air)[1:3] <- c("day", "site", "no")
summary(pd_air)
pd_CH4 <- subset(pd_air, no=="CH4")#使用一下subset()函數!
summary(pd_CH4)
