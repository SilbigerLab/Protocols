######### Cleaning and Graphing pH logger data #################

library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(broom)
library(performance)
library(see)
rm(list=ls())

##################################
# Folder and file names
##################################
hobo.folder<- 'Data/HOBO_MX2501/hobo_logger/tidy_data/Tris_Calibrated' # path to hobo data folder
spec.folder<- 'Data/HOBO_MX2501/spec_data/20200303/pH_simple' # path to spec data folder
TempInSitu<- 'Data/HOBO_MX2501/spec_data/20200303/TrisTempInSitu.csv' # Temperature file
RunTime<- 'Data/HOBO_MX2501/spec_data/20200303/SpecRunTime.csv' # File containing time of spec start
output<-'Data/HOBO_MX2501/output/TrisCal/' # output folder for graphs
date<-'20200303' # today's date

##################################
# Bring in and join spec and hobo files
##################################

#group data from all Hobo logger files together
hobo.ph.data <-
  list.files(path = hobo.folder,pattern = ".csv", full.names = TRUE) %>% # list files in directory following a particular pattern #options(na.action = "na.omit") 
 # set_names(.) %>% # get the column names
  map_dfr(read.csv, .id = "file.ID") %>% # join all files together in one data frame by file ID (path and file name)
  group_by(file.ID) %>%
  rename(Temp.hobo='Temp_degC',pH.hobo='pH',mV.hobo='mV')
hobo.ph.data$PST<-as.character(hobo.ph.data$PST) # parse column to character class
hobo.ph.data$PST<- hobo.ph.data$PST %>% parse_datetime(format = "%F %T %Z", na = character(), locale = default_locale(), trim_ws = TRUE) # format date and time, %F = %Y-%m-%d, %T = %H:%M:%S

# specific to each hobo serial number and file.ID
hobo.ph.data$file.ID[hobo.ph.data$file.ID=='1']<- "SN195"
hobo.ph.data$file.ID[hobo.ph.data$file.ID=='2']<- "SN197"

# average hobo data every minute
hobo.ph.data <- hobo.ph.data %>%
  group_by(file.ID, PST=cut(PST, "60 sec")) %>%
  summarise(Temp.hobo = mean(Temp.hobo), 
            mV.hobo = mean(mV.hobo), 
            pH.hobo = mean(pH.hobo, na.rm = TRUE))
hobo.ph.data$PST<-as.character(hobo.ph.data$PST) # parse column to character class
hobo.ph.data$PST<- hobo.ph.data$PST %>% parse_datetime(format = "%F %T", na = character(), locale = default_locale(), trim_ws = TRUE) # format date and time, %F = %Y-%m-%d, %T = %H:%M:%S
#View(hobo.ph.data)

#group data from all spec files together
spec.ph.data <-
  list.files(path = spec.folder,pattern = ".csv", full.names = TRUE) %>% # list files in directory following a particular pattern
#  set_names(.) %>% # get the column names
  map_dfr(read.csv, .id = "file.ID") %>% # join all files together in one data frame by file ID (path and file name)
  select(-file.ID) %>%
  add_column(ID='Spec')
Temp.data<-read_csv(TempInSitu,col_names = TRUE)
Time.data<-read_csv(RunTime,col_names = TRUE)
spec.ph.data<-spec.ph.data %>%
  left_join(Temp.data,spec.ph.data,by='Sample.Name') %>%
  left_join(Time.data,spec.ph.data,by='Sample.Name') %>%
  rename(pHmean.spec = pHmean,SE.spec=SE)
#View(spec.ph.data)
wide.data<-inner_join(hobo.ph.data,spec.ph.data,by='PST')
#View(wide.data)

#################################
# Graphing spec and hobo data (wide form)
#################################
hobo.195<-wide.data %>%
  filter(file.ID=='SN195')
hobo.197<-wide.data %>%
  filter(file.ID=='SN197')

PlotpH.wide<-ggplot(data=hobo.197,aes(y=pHmean.spec,x=pH.hobo))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='HOBO pH (NBS)',y='Mean Spec pH (TS)')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")+ # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"spec-hobo_pH_bestfit_",date,".png")) # saves plot as a png file
PlotpH.wide #spec pH ~ hobo pH

PlotmV.wide<-ggplot(data=hobo.197,aes(y=pHmean.spec,x=mV.hobo))+#,fill=file.ID))+ # basic plot
  geom_point()+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='HOBO mV',y='Mean Spec pH (TS)')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "bottom", label.x = NULL,
                        label.y = NULL, output.type = "expression")+ # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"spec-hobo_mV_bestfit_",date,".png")) # saves plot as a png file
PlotmV.wide #spec pH ~ hobo mV


#################################
# Graphing spec and hobo data (long form)
#################################
spec.data<-spec.ph.data
hobo.data<-hobo.ph.data %>%
  left_join(spec.data,hobo.data,by='PST') %>%
  drop_na() %>%
  select(-c(Sample.Name,pHmean.spec,SE.spec,TempInSitu,ID)) %>%
  rename(pHmean='pH.hobo',Temp_degC='Temp.hobo')
spec.data<-spec.data %>%
  rename(file.ID='ID',pHmean='pHmean.spec',Temp_degC='TempInSitu') %>%
  select(-c(SE.spec,Sample.Name))
long.data<-bind_rows(hobo.data,spec.data)
#View(long.data)

# subset data
spec.195<-long.data %>% # data for spec and hobo 195
  filter(file.ID=='SN195'|file.ID=='Spec')
spec.197<-long.data %>% # data for spec and hobo 197
  filter(file.ID=='SN197'|file.ID=='Spec')
hobo.195.and.197<-long.data %>% # data for both hobos 195 and 197
  filter(file.ID=='SN195'|file.ID=='SN197')

# Run ancova model for spec and hobo pH data grouped by temperature
pH_model<-lm(pHmean~Temp_degC * file.ID,data=spec.197) # create linear model
check_model(pH_model) # check assumptions of model, view plots
anova(pH_model) # displays anova table with p values
summary(pH_model) # displays effect sizes


# Graphing Temperature of spec and hobos to Time
Temp_Loggers<-long.data$file.ID
PlotTemp.long<-ggplot(data=long.data,aes(y=Temp_degC,x=PST,fill=Temp_Loggers))+ # basic plot
  geom_point(aes(colour=Temp_Loggers))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Time',y='Temp degC', fill='Temp_Loggers')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(colour=Temp_Loggers, label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")+  # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"Temperature_",date,".png")) # saves plot as a png file
PlotTemp.long # spec and hobo temp ~ time

PlotTemp.long<-ggplot(data=long.data,aes(y=Temp_degC,x=PST))+ # basic plot
  geom_point(aes(colour=Temp_Loggers))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Time',y='Temp degC')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "top", label.x = NULL,
                        label.y = NULL, output.type = "expression")+ # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"Temperature_bf_",date,".png")) # saves plot as a png file
PlotTemp.long # spec and hobo temp ~ time

# Graphing pH of hobo and spec to Temperature
pH_Temp_Loggers<-long.data$file.ID
PlotpHTemp.long<-ggplot(data=long.data,aes(y=pHmean,x=Temp_degC,fill=pH_Temp_Loggers))+ # basic plot
  geom_point(aes(colour=pH_Temp_Loggers))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temp',y='Mean pH', fill='pH_Temp_Loggers')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(colour=pH_Temp_Loggers,label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "bottom", label.x = NULL,
                        label.y = NULL, output.type = "expression")+ # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"raw_pH-Temp_",date,".png")) # saves plot as a png file
PlotpHTemp.long # spec and raw hobo 197 pH ~ temp

PlotpHTemp.bflong<-ggplot(data=long.data,aes(y=pHmean,x=Temp_degC))+ # basic plot
  geom_point(aes(colour=pH_Temp_Loggers))+ # adds data points to plot
  geom_smooth(method="lm")+ # linear regression
  labs(x='Temp',y='Mean pH')+ # axis labels
  theme_bw()+ # removes gridlines
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  stat_regline_equation(mapping = aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")), formula = y~x,
                        label.x.npc = "left", label.y.npc = "bottom", label.x = NULL,
                        label.y = NULL, output.type = "expression")+ # adds the regression line and r2 labels to the plot
  ggsave(paste0(output,"raw_pH-Temp_bestfit_",date,".png")) # saves plot as a png file
PlotpHTemp.bflong # spec and raw hobo 197 pH ~ temp

