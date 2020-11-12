######### Cleaning and Graphing pH logger data #################

library(tidyverse)
library(broom)
library(lubridate)
library(ggpubr)

rm(list=ls())

setwd("/Users/daniellebarnas/Documents/R Sessions")

##################################
# Folder and file names
##################################

hobo.file<- 'Silbiger_Lab_Protocols/Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/20201028/TCal_pH_196_2020-11-12.csv' # tris calibrated hobo data file
serial<- '196'
spec.folder<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20201028/pH_simple' # path to spec data folder
TempInSitu<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20201028/TempInSitu.csv' # Temperature file
RunTime<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20201028/SpecRunTime.csv' # File containing time of spec start
output<-'Silbiger_pH_Spec/Data/HOBO_MX2501/Output/TrisCal/20201028/' # output folder for graphs


##################################
# Bring in and join spec and hobo files
##################################

#group data from all Hobo logger files together
hoboData <-read_csv(hobo.file)

# average hobo data every minute
hoboData <- hoboData %>%
  group_by(date=cut(date, "60 sec")) %>%
  summarise(TempInSitu = mean(TempInSitu, na.rm = TRUE), 
            mV = mean(mV, na.rm = TRUE), 
            pH = mean(pH, na.rm = TRUE),
            mVTris = mean(mVTris, na.rm = TRUE),
            pHcal = mean(pHcal, na.rm = TRUE))
hoboData$date <- as.character(hoboData$date) # parse column to character class
hoboData$date <- hoboData$date %>% parse_datetime(format = "%F %T", na = character(), locale = default_locale(), trim_ws = TRUE) # format date and time, %F = %Y-%m-%d, %T = %H:%M:%S

# bring in temperature and runtime for spec reads
Temp.data<-read_csv(TempInSitu,col_names = TRUE)
Time.data<-read_csv(RunTime,col_names = TRUE)

#group data from all spec files together
specData<-
  list.files(path = spec.folder,pattern = ".csv", full.names = TRUE) %>% # list files in directory following a particular pattern
  set_names(.) %>% # get the column names
  map_dfr(read.csv, .id = "file.ID") %>% # join all files together in one data frame by file ID (path and file name)
  select(-file.ID)
specData<-specData %>%
  left_join(Temp.data,spec.ph.data,by='Sample.Name') %>%
  left_join(Time.data,spec.ph.data,by='Sample.Name') %>%
  rename(pH = pHmean, date=PST) %>%
  select(-c(SE))
specData


############################################################################################################################################
## Graphphing linearity and predictive power of hobo pH and mV to Total Scale pH on Spec
############################################################################################################################################

####### want to compare mVTris (tris calibrated mV) to spec pH, join by date/time
hobomV<-hoboData%>%
  select(date,TempInSitu,mVTris)%>%
  rename(Thobo=TempInSitu)
specTS<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data5<-left_join(specTS,hobomV)

plot5<-ggplot(data=Data5,aes(x=mVTris,y=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(y='Spec pH (TS)',x='Hobo mV (tris calibrated)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression") +
  ggsave(paste0(output,'TCalmV~SpecpH_',serial,'.png'))
plot5

### Tris calibrated mV of HOBO pH logger is a good predictor of spec TS pH
# note: removed calibration temp = 30C as an outlier for hobo196
# R2 = 0.99
# y = 6.6 - 0.016x

# using same spec data for hobo195:
# R2 = 0.97
# y = 6.7 - 0.016x







####### want to compare pHcal (tris calibrated pH) to spec pH, join by date/time

hoboTS<-hoboData%>%
  select(date,TempInSitu,pHcal)%>%
  rename(Thobo=TempInSitu)
specTS<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data1<-left_join(specTS,hoboTS)

plot1<-ggplot(data=Data1,aes(y=pHcal,x=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Spec pH (TS)',y='Hobo pH (TS, tris calibrated)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot1


####### want to compare pHcal (tris calibrated pH) to spec pH, join by temperature
####### temperature is not a viable predictor for TS pH when comparing pHcal to pH_spec

hoboTS2<-hoboData%>%
  select(TempInSitu,pHcal)%>%
  mutate(Sample.Name="Thobo")%>%
  rename(pH=pHcal)
specTS2<-specData%>%
  select(TempInSitu,pH)%>%
  mutate(Sample.Name="Tspec")

Data2<-full_join(specTS2,hoboTS2)

plot2<-ggplot(data=Data2, aes(y=pH,x=TempInSitu,colour=Sample.Name))+ # basic plot
  geom_point(aes(colour=Sample.Name))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temperature (C)',y='pH')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot2


####### want to compare hobo pH (NBS scale pH) to spec pH, join by date/time

hoboNBS<-hoboData%>%
  select(date,TempInSitu,pH)%>%
  rename(Thobo=TempInSitu,pH_nbs=pH)
specTS<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data3<-left_join(specTS,hoboNBS)

plot3<-ggplot(data=Data3,aes(y=pH_nbs,x=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Spec pH (TS)',y='Hobo pH (NBS)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot3


####### want to compare raw hobo pH to spec pH, join by temperature
####### temperature is not a viable predictor for TS pH when comparing pH (NBS) to pH_spec

hoboNBS2<-hoboData%>%
  select(TempInSitu,pH)%>%
  mutate(Sample.Name="Thobo")
specTS2<-specData%>%
  select(TempInSitu,pH)%>%
  mutate(Sample.Name="Tspec")

Data4<-full_join(specTS2,hoboNBS2)

plot4<-ggplot(data=Data4, aes(y=pH,x=TempInSitu,colour=Sample.Name))+ # basic plot
  geom_point(aes(colour=Sample.Name))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temperature (C)',y='pH')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot4



