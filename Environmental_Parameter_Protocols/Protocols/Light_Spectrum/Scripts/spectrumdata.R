#Making graphs to show the spectrum gradient for blue light, multi light and both blue and multi light in terms of wavelenth and intensity

#clear list

rm(list=ls())

#set wd

setwd ("~/Desktop/Repositories/Light_Spectrum/Data")

#load libraries
library(dplyr)
library(tidyr)
library(ggplot2)

#load data

mydata <- read.csv("~/Desktop/Repositories/Light_Spectrum/Data/bluelight.spectra.csv")
View(mydata)

#line graph of data for blue light spectrum

ggplot(data=mydata, aes(x=wavelength, y=intensity)) + geom_line(aes(group=1)) + scale_y_continuous(expand=c(0,0), limits=c(0, 4000)) + scale_x_continuous(limits=c(350, 1000)) 

#For future use:
# Change color of both line and points
# Change line type and point type, and use thicker line and larger points
# Change points to circles with white fill
#ggplot(data=dat, aes(x=time, y=total_bill, group=1)) + geom_line(colour="red", linetype="dashed", size=1.5) + geom_point(colour="red", size=4, shape=21, fill="white")


#load data


mydata <- read.csv("~/Desktop/Repositories/Light_Spectrum/Data/multilight.spectra.csv")
View(mydata)

#line graph of data for multi light spectrum

ggplot(data=mydata, aes(x=wavelength, y=intensity)) + geom_line(aes(group=1))+ scale_y_continuous(expand=c(0,0), limits=c(0, 2500)) + scale_x_continuous(limits=c(350, 1000)) 

#load data

mydata <- read.csv("~/Desktop/Repositories/Light_Spectrum/Data/blueandmulti.spectra.csv")
View(mydata)

#line graph of data for both blue and multi light spectrum

ggplot(data=mydata, aes(x=wavelength, y=intensity)) +
  geom_line(aes(group=1)) +
  theme_bw() +
  theme(axis.text.x=element_text(face="bold", color="black", size=18), axis.text.y=element_text(face="bold", color="black", size=18), axis.title.x = element_text(color="black", size=20, face="bold"), axis.title.y = element_text(color="black", size=20, face="bold"),panel.grid.major=element_blank(), panel.grid.minor=element_blank()) + #adjust themes for chart x and y axis labels and axis tick mark labels
  scale_y_continuous(expand=c(0,0), limits=c(0, 4000)) +
  scale_x_continuous(breaks = seq(350,1000,50)) +
  labs(x="Wavelength (nm)", y="Intensity (PAR)")
  
ggsave(filename = "../Output/blueandmultilight.png", device = "png", width = 15, height = 10)







