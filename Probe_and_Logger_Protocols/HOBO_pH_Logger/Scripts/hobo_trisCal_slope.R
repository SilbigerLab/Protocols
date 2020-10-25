### Tris calibration for HOBO pH MX2501 Loggers

library(tidyverse)
library(seacarb)
library(broom)
library(here)
here()
rm(list=ls())

foldername<-'Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/20200303/'
filename<-'pH_197_2020-10-14.csv'

## bring in pH calibration files and raw data files
pHcalib<-read_csv('Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/Tris_Calibration_Log.csv')
pHData<-read_csv(paste0(foldername,filename))

Salinity_lab<-34 # normally would be a column in pHData datasheet, from CT_Logger

# Convert 'date' to date and time vector type
pHcalib$date<-pHcalib$date %>%
  parse_datetime(format = "%m/%d/%y", na = character(),
                 locale = default_locale(), trim_ws = TRUE)

## take the mV calibration files by each date and use them to calculate pH
pHSlope<-pHcalib %>%
  dplyr::nest_by(date) %>%
  dplyr::mutate(fitpH = list(lm(mVTris~TTris, data = data))) %>% # linear regression of mV and temp of the tris
  dplyr::summarise(broom::tidy(fitpH)) %>% # make the output tidy
  select(date, term, estimate) %>%
  pivot_wider(names_from = term, values_from = estimate) %>%# put slope and intercept in their own column
  full_join(pHData) %>% # join with the pH sample data
  separate(date,sep=" ",into=c('date','time')) %>%
  fill('(Intercept)',TTris) %>%
  drop_na() %>%
  mutate(mVTris = TempInSitu*TTris + `(Intercept)`) %>% # calculate the mV of the tris at temperature in which the pH of samples were measured
  mutate(pHcal = pH(Ex=mV,Etris=mVTris,S=Salinity_lab,T=TempInSitu)) %>% # calculate pH of the samples using the pH seacarb function
  #mutate(pH_insitu = pHinsi(pH = pH, ALK = TA_Raw, Tinsi = TempInSitu, Tlab = Temp, S = Salinity_lab_Silbiger)) %>%
  select(date,time,TempInSitu,pH,mV,pHcal,mVTris) %>% # ,Salinity_lab ## need to calculate pH insi then it is done
  unite(date,c(date,time),sep=" ")

View(pHSlope)

## write the data
write_csv(pHSlope, paste0(foldername,'TCal_',filename))


######### Organizing and Graphing pH logger data #################

library(lubridate)
library(ggpubr)

rm(list=ls())

setwd("/Users/daniellebarnas/Documents/R Sessions")

##################################
# Folder and file names
##################################

hobo.file<- 'Silbiger_Lab_Protocols/Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/20200303/TCal_pH_197_2020-10-14.csv' # tris calibrated hobo data file
#hobo.SN<-'197'
spec.folder<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20200303/pH_simple' # path to spec data folder
TempInSitu<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20200303/TrisTempInSitu.csv' # Temperature file
RunTime<- 'Silbiger_pH_Spec/Data/HOBO_MX2501/spec_data/20200303/SpecRunTime.csv' # File containing time of spec start
output<-'Silbiger_pH_Spec/Data/HOBO_MX2501/output/TrisCal/' # output folder for graphs


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

model<-lm(pH~TempInSitu*Sample.Name, Data2)
car::Anova(model,type='III')

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

model<-lm(pH~TempInSitu*Sample.Name, Data4)
car::Anova(model,type='III')


####### want to compare mVTris to spec pH, join by date/time
hobomV<-hoboData%>%
  select(date,TempInSitu,mVTris)%>%
  rename(Thobo=TempInSitu)
specTS<-specData%>%
  select(Sample.Name,date,TempInSitu,pH)%>%
  rename(Tspec=TempInSitu)

Data5<-left_join(specTS,hobomV)

plot5<-ggplot(data=Data5,aes(y=mVTris,x=pH))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Spec pH (TS)',y='Hobo mV (tris calibrated)')+ # axis labels
  theme_bw()+ # white background
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")
plot5

