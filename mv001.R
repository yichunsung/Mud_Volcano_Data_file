# library packages
library(magrittr)
library(httr)
library(rvest)
library(stringr)

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
setwd('c:/Mud_Volcano_Data_file') #Change the wd path for yourself!!!!
Sys.setlocale(category = "LC_ALL", locale = "")
pd_air <- read.csv("pd2015.csv", header = T, sep=",") #Loading pd station 2015 Air Data
names(pd_air)
names(pd_air)[1:3] <- c("day", "site", "no")
summary(pd_air)
pd_CH4 <- subset(pd_air, no=="CH4")#subset!
pd_CH4_draw <- subset(pd_CH4, X00!="")
summary(pd_CH4)
x00_new <- as.numeric(as.vector(pd_CH4_draw$X00))
pd_CH4_new<- cbind(pd_CH4_draw, x00_new)
pd_CH4_new1 <- subset(pd_CH4_new, x00_new!="NA")
day_new <- c(1:360)
pd_CH4_new2<- cbind(pd_CH4_new1, day_new)
pd_CH4_new2$asDate <- as.Date(pd_CH4_new2$day, "%Y/%m/%d")

time <- c(1:364)
x1 <- newFrameofTestMV[,1]
x2 <- newFrameofTestMV[,2]
x3 <- newFrameofTestMV[,3]
temp3 <- as.numeric(as.vector(x3))
testF <- data.frame(time)

for(i in 1:ncol(newFrameofTestMV)){
    temp <- newFrameofTestMV[,i]
    temp2 <- as.numeric(as.vector(temp))
    testF <- cbind(testF, temp2)
  
}
resultDF <- data.frame(testF)

#for(index in 1:ncol(number)){
#  col <- number[, index]
#  colNew <- gsub(',', '', col)# gsub every column
#  colNum <- as.integer(colNew)# Transform into integer
#  result[[index]] <- colNum# Insert into list
#}


#=----------------------------------------------------------------------------------------------=
#=                                          TEST                                                =
#=                                                                                              =
#-----------------------------------------------------------------------------------------------=

newFrameofTestMV <- pd_CH4_draw[4:27]
colnames(newFrameofTestMV) <- c(0:23)
newFrameCH4 <- data.frame()


#=----------------------------------------------------------------------------------------------=
#=                                          TEST                                                =
#=                                                                                              =
#-----------------------------------------------------------------------------------------------=


g<-c()
newFrameCH4 <- data.frame()
for (i in 1:ncol(newFrameofTestMV)){
data1 <- newFrameofTestMV[, i]
  for (j in 1:nrow(newFrameofTestMV)){
    data2 <- data1[j]
    data3 <- as.numeric(as.vector(data2))
      if(data3 = "NA") {
        data3 <-c(0)
        g[j] <- cbind(data3)
      }else{
        g[j] <- cbind(data3)

      }
   }

  }



# Test
test0 <- pd_CH4_draw[, 4]
testA <- subset(test0, "*")
colNum <- as.integer(testA)
test2 <- as.numeric(as.vector(pd_CH4_draw[1,4]))

#=----------------------------------------------------------------------------------------------=
#=                                          TEST                                                =
#=                                                                                              =
#-----------------------------------------------------------------------------------------------=




# draw with ggplot2
install.packages("ggplot2")
library(ggplot2)

ggplot(pd_CH4_new2, aes(x=asDate, y=x00_new))+geom_line(colour="red")+geom_point(size=1, colour="black")+
  ggtitle("PD Air Station for Methane")+xlab("Day")+ylab("conc. (ppm)")

# draw with plotly
install.packages("plotly")
library(plotly)

plotly_pdStatMethane <- plot_ly(pd_CH4_new2, x=pd_CH4_new2$asDate, y=pd_CH4_new2$x00_new, type="scatter", mode="lines", color="lightgreen")


