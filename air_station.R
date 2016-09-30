# PD Air Station Data
library(magrittr)
library(httr)
library(rvest)
library(stringr)
library(ggplot2)
library(plotly)

setwd('c:/Mud_Volcano_Data_file') # Change the wd path for yourself!!!!
Sys.setlocale(category = "LC_ALL", locale = "")
pd_air <- read.csv("pd2015.csv", header = T, sep=",") # Loading pd station 2015 Air Data

names(pd_air)[1:3] <- c("date", "site", "item")
pd_CH4_raw <- subset(pd_air, pd_air$item=="CH4") # subset for Methane gas 
asDate <- as.Date(pd_CH4_raw$date, "%Y/%m/%d") # AsDate
pd_CH4_step2 <- pd_CH4_raw[-1:-3]

# for loop for delete error data
pd_CH4 <- data.frame(asDate)

for(i in 1:ncol(pd_CH4_step2)){
  hour_CH4 <- pd_CH4_step2[,i]
  hour_CH4_num <- as.numeric(as.vector(hour_CH4))
  pd_CH4 <- cbind(pd_CH4, hour_CH4_num)
}
# change the col name
names(pd_CH4)[-1] <- c(0:23)
# mean day to day
pd_cH4_cau <- pd_CH4[,-1]

#day1_list <- c(pd_cH4_cau[1,])
#day1_c <- rapply(day1_list, c)
#Day1mean <- mean(day1_c)
#AvgofDay <- c(Day1mean, Day2mean)

AvgofDay <- c()
for(i in 1:nrow(pd_cH4_cau)){
  day_list <- c(pd_cH4_cau[i,])
  day_c <- rapply(day_list, c)
  DayMean <- mean(day_c)
  AvgofDay[i] <- cbind(DayMean)
  
}
pd_CH4 <- cbind(pd_CH4, AvgofDay)


#Draw fig
# for example 00 hour
pd_CH4_00_potly <-plot_ly(pd_CH4, x=pd_CH4$asDate, y=pd_CH4$`0`, type="scatter", mode="markers+lines", colors="Reds")
pd_CH4_00_potly

pd_CH4_potly <-plot_ly(pd_CH4, x=pd_CH4$asDate, y=pd_CH4$AvgofDay, type="scatter", mode="markers+lines", colors="Greens")
pd_CH4_potly

