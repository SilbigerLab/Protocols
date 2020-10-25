######### Cleaning and Graphing pH logger data #################

library(tidyverse)
library(lubridate)
library(ggpubr)
library(broom)

rm(list=ls())

##################################
# Folder and file names
##################################

hobo.file<- 'Data/HOBO_MX2501/Tris_Calibration/tris_pH_SN195_2020-09-24.csv' # tris calibrated hobo data file
hobo.SN<-'195'
spec.folder<- 'Data/HOBO_MX2501/spec_data/20200303/pH_simple' # path to spec data folder
TempInSitu<- 'Data/HOBO_MX2501/spec_data/20200303/TrisTempInSitu.csv' # Temperature file
RunTime<- 'Data/HOBO_MX2501/spec_data/20200303/SpecRunTime.csv' # File containing time of spec start
output<-'Data/HOBO_MX2501/output/TrisCal/' # output folder for graphs


##################################
# Bring in and join spec and hobo files
##################################

#group data from all Hobo logger files together
hoboData <-read_csv(hobo.file)
hoboData<-hoboData%>%
  select(-c(X1))

# average hobo data every minute
hoboData <- hoboData %>%
  group_by(date=cut(date, "60 sec")) %>%
  summarise(TempInSitu = mean(TempInSitu, na.rm = TRUE), 
            mV = mean(mV, na.rm = TRUE), 
            pH = mean(pH, na.rm = TRUE),
            mVTris = mean(mVTris, na.rm = TRUE),
            pH_calc = mean(pH_calc, na.rm = TRUE))
hoboData$date<-as.character(hoboData$date) # parse column to character class
hoboData$date<- hoboData$date %>% parse_datetime(format = "%F %T", na = character(), locale = default_locale(), trim_ws = TRUE) # format date and time, %F = %Y-%m-%d, %T = %H:%M:%S
hoboData

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


####### want to compare mVTris (tris-calibrated hobo tris readings) to spec pH
####### can tris-calibrated mV readings predict TS pH?

hoboDmV<-hoboData%>%
  select(date,TempInSitu,mVTris)%>%
  rename(Thobo=TempInSitu)
specD<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data<-left_join(specD,hoboDmV)
Data

plot<-ggplot(data=Data,aes(y=pH,x=mVTris))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Hobo mV (tris-calibrated',y='Spec pH (TS)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot

# HOBO SN195: y = 6.2 - 0.023x , R^2 = 0.97
# HOBO SN197: y = 6.1 - 0.025x , R^2 = 0.97

############################################################################################################################################
############################################################################################################################################



####### want to compare pH_calc (tris calibrated pH) to spec pH
hoboDataTS<-hoboData%>%
  select(date,TempInSitu,pH_calc)%>%
  rename(Thobo=TempInSitu)
specD<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data<-left_join(specD,hoboDataTS)
Data

plot<-ggplot(data=Data,aes(y=pH_calc,x=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Spec pH (TS)',y='Hobo pH (TS, tris calibrated)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot


####### want to compare pH (NBS scale pH) to spec pH
hoboDataNBS<-hoboData%>%
  select(date,TempInSitu,pH)%>%
  rename(Thobo=TempInSitu,pH_nbs=pH)
specD<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data<-left_join(specD,hoboDataNBS)
Data

plot<-ggplot(data=Data,aes(y=pH_nbs,x=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Spec pH (TS)',y='Hobo pH (NBS)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot


####### want to compare raw recorded mV to mvTris (calculatd mV)
hoboDatamV<-hoboData%>%
  select(date,TempInSitu,mV,mVTris)
hoboDatamV

plot<-ggplot(data=hoboDatamV,aes(y=mV,x=mVTris))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Raw recorded mV',y='Tris Calibrated mV')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot

mVtest<-t.test(hoboDatamV$mVTris, hoboDatamV$mV)
mVtest

####### want to compare pH_calc (tris calibrated pH) to spec pH (join by temperature instead of date)
hoboDataTS2<-hoboData%>%
  select(TempInSitu,pH_calc)%>%
  mutate(Sample.Name="Thobo")%>%
  rename(pH=pH_calc)
specD<-specData%>%
  select(Sample.Name,TempInSitu,pH)
specD$Sample.Name<-"Tspec"
specD

Data<-full_join(specD,hoboDataTS2)
Data

plot<-ggplot(data=Data, aes(y=pH,x=TempInSitu,colour=Sample.Name))+ # basic plot
  geom_point(aes(colour=Sample.Name))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temperature (C)',y='pH')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot



####### want to compare raw hobo pH to spec pH (join by temperature instead of date)
####### temperature is not a viable predictor for TS pH when comparing pH_calc to pH_spec

hoboDataNBS2<-hoboData%>%
  select(TempInSitu,pH)%>%
  mutate(Sample.Name="Thobo")
hoboDataNBS2

hoboD<-read_csv('Data/HOBO_MX2501/Tris_Calibration/sn197.test.csv')
hoboD

specD<-specData%>%
  select(Sample.Name,TempInSitu,pH)
specD$Sample.Name<-"Tspec"
specD

Data<-full_join(specD,hoboD)
Data

plot<-ggplot(data=Data, aes(y=pH,x=TempInSitu,colour=Sample.Name))+ # basic plot
  geom_point(aes(colour=Sample.Name))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temperature (C)',y='pH')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "center", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot
