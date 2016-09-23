# Mud Volcano from Southwest of Taiwan Data.Frame

setwd('c:/R/Mud_Volcano_Data_file') #Change the wd path for yourself!!!!
Sys.setlocale(category = "LC_ALL", locale = "")
mv_data <- read.csv("mv001.csv", header= T, sep=",") #loading Mud Volcano Data 

# Change the Data.Frame header name 
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
WD_MV <- subset(mv_data, site=="WD")
WD_MV_CH4 <- subset(WD_MV, CH4_conc!="")
WD_MV_CH4$CH4_conc <- c(0, 0, 33.64, 29.89)

#draw histogram

install.packages("ggplot2") #install packages for drawing
library(ggplot2)
ggplot(WD_MV_CH4, aes(x=CH4_conc))+geom_histogram(binwidth = 3, fill="red", colour="black")+ggtitle("WD Mud Volcano dissolved Methane")+ylab("conc.")



#----------------------------------------------------------------------------------------------------------


#pd air station data for Methane
pd_air <- read.csv("pd2015.csv", header = T, sep=",") #Loading pd station 2015 Air Data
names(pd_air)
names(pd_air)[1:3] <- c("day", "site", "no")
summary(pd_air)
pd_CH4 <- subset(pd_air, no=="CH4")#subset•¸!
pd_CH4_draw <- subset(pd_CH4, X00!="")
summary(pd_CH4)
x00_new=as.numeric(as.vector(pd_CH4_draw$X00))
pd_CH4_new<- cbind(pd_CH4_draw, x00_new)
pd_CH4_new1 <- subset(pd_CH4_new, x00_new!="NA")
day_new <- c(1:360)
pd_CH4_new2<- cbind(pd_CH4_new1, day_new)
pd_CH4_new2$asDate <- as.Date(pd_CH4_new2$day, "%Y/%m/%d")

# draw
install.packages("ggplot2")
library(ggplot2)

ggplot(pd_CH4_new2, aes(x=asDate, y=x00_new))+geom_line()+geom_point(size=2)+ggtitle("PD Air Station for Methane")+xlab("Day")+ylab("conc. (ppm)")
