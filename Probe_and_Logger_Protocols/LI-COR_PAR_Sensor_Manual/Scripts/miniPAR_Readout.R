rm(list=ls())
library(tidyverse)
library(broom)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(ggpmisc)
library(nls.multstart)
library(nlstools)

########################
# File Names
########################

# Create an output folder in your working folder called 'Output'

foldername<-'20200305' # folder of the day
output_folder<-'Output' # an output folder you created in your folder of the day
filename_cat<-'20200305_Cat.csv' # concatenated data from miniPAR Logger
filename_HOBOpendant <- 'Pendant-2-SN20555868 2020-03-04 16_25_35 -0800.csv' # If calibrating HOBO pendant against LI-COR
serial<-'sn5868' # last four digits from the Pendant SN ID ex. 'sn5847'
Launch<-'2020-03-02 14:35:00' # Maintain date time format "2020-03-04 14:15:00"
Retrieval<-'2020-03-04 15:50:00' # Maintain date time format "2020-03-04 21:30:00"
Date <- 20200305

#group temp and light data from all Hobo pendant loggers together
hobo_data <-
  list.files(path = paste0('LI-COR PAR Sensor Manual/Data/',foldername),pattern = ".csv", full.names = TRUE) %>% # list files in directory following a particular pattern
  #set_names(.) %>% # get the column names
  map_dfr(read_csv(), .id = "file.ID") %>% # join all files together in one data frame by file ID
  group_by(file.ID) 

temp.data$Date.Time<- mdy_hm(temp.data$Date.Time, quiet=FALSE, tz="America/Los_Angeles", truncated=0) #format date and time 
#View(temp.data)



#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

Launch <- Launch %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)
Retrieval <- Retrieval %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)

# Tidy Concatenation Data
Concat_Data <- read_csv(paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/',filename_cat),
                        col_names = FALSE,
                        skip=7) #skips first 7 rows containing instrument information
Concat_Data <- separate(Concat_Data,"X1", into=c("Unix_Timestamp_second","UTC_Date_Time","PST",
                                                 "Battery_volts","Temp_degC","PAR","Ax_g",
                                                 "Ay_g","Az_g"), sep=",", remove=TRUE) # Split merged cell into column headings - note that all vectors are character type
# Convert PST to date and time vector type
Concat_Data$PST <- Concat_Data$PST %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)

# Convert character strings to double number type
Concat_Data$Battery_volts <- Concat_Data$Battery_volts %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data$Temp_degC <- Concat_Data$Temp_degC %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data$PAR <- Concat_Data$PAR %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data$Ax_g <- Concat_Data$Ax_g %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data$Ay_g <- Concat_Data$Ay_g %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data$Az_g <- Concat_Data$Az_g %>%
  parse_double(na=c("","NA"),locale = default_locale(), trim_ws = TRUE)
Concat_Data <- Concat_Data %>%
  filter(between(PST,Launch,Retrieval)) 
#View(Concat_Data)
write_csv(Concat_Data,paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/',output_folder,'/',Date,'_PAR.csv')) # Create simple csv file

#################################################################################

# Tidy HOBO Pendant data for calibration
HOBO <- read_csv(paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/HOBOpendant/',filename_HOBOpendant), 
                 skip=2,
                 col_names=TRUE,
                 col_types=list("Button Down"=col_skip(), # skips columns containing logger launch, connection, and stop information
                                "Button Up"=col_skip(),
                                "Host Connect"=col_skip(),
                                "Stopped"=col_skip(),
                                "EOF"=col_skip())) 
HOBO <- HOBO %>%
  rename(PST=contains("Date"), Temp_degC=contains("Temp"), HOBO_Lux=contains("Intensity")) # Relabel column headings
HOBO <- HOBO %>%
  filter(!is.na(Temp_degC)) # Drops NA values at the bottom of the data file by using the presence of Temp data as a proxy for logged values to keep
#HOBO$PST <- HOBO$PST %>%
 # parse_datetime(format = "%m/%d/%y %H:%M", na = character(),
  #               locale = default_locale(), trim_ws = TRUE) # Converts to date and time string types

#HOBO <- HOBO %>% # Convert to SI units if necessary and also converting lumens to lux to PAR
 # mutate(Temp_degC = (Temp_degC-32)*5/9, HOBO_Lux = HOBO_Lux*10.7639104*0.0185) # converting lumens to lux to PAR
# Lux to PAR converstion source: Long, previously Valiela (1984): 1 mmol quanta m-2 s-2 400-700nm = 51.2 Lux, also previously https://www.apogeeinstruments.com/conversion-ppfd-to-lux/

HOBO <- HOBO %>%
  filter(between(PST,Launch,Retrieval)) 
#View(HOBO)
write_csv(HOBO,paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/',output_folder,'/HOBO_',serial,'_',Date,'.csv'))

# If bringing in HOBO data from HOBOware on the computer
# When exporting table data from HOBOware, only click the relevant data (i.e. temp and intensitiy)
# HOBO <- read_csv(paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/HOBOpendant/',filename_HOBOpendant), skip=1, col_names=TRUE)

#HOBO$PST <- HOBO$PST %>%
# parse_datetime(format = "%m/%d/%y %H:%M", na = character(), locale = default_locale(), trim_ws = TRUE) # Converts to date and time string types
# HOBO <- HOBO %>% rename(PST=contains("Date"), Temp_degC=contains("Temp"), HOBO_Lux=contains("Intensity")) %>% # Relabel column headings
                 # filter(!is.na(Temp_degC)) # Drops NA values at the bottom of the data file by using the presence of Temp data as a proxy for logged values to keep


#################################################################################

LICOR_HOBO <- full_join(Concat_Data,HOBO, by="PST") # merge the LI-COR and HOBO dataframes
LICOR_HOBO <- LICOR_HOBO %>%
  select(-c(Battery_volts)) # remove the unecessary columns
LICOR_HOBO <- LICOR_HOBO %>%
  rename(Temp_degC_LICOR="Temp_degC.x",Temp_degC_HOBO="Temp_degC.y") # rename temp columns
LICOR_HOBO <- LICOR_HOBO %>%
  filter(!is.na(HOBO_Lux),!is.na(PAR)) # Drops NA values where LICOR and HOBO aren't overlapping readings
View(LICOR_HOBO)
write_csv(LICOR_HOBO,paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/',output_folder,'/Licor-Hobo_',serial,'_',Date,'.csv'))

#####################################
# Plotting and Retrieving fitting constants
#####################################
# Calibrating HOBO to LICOR
# PAR_LICOR = A*exp(-HOBO / t) + y0
# PAR_LICOR: PAR data from the LICOR (μmol photons m–2 s–1)
# HOBO: raw output data (lumens m–2)
# A, t, and y0 are fitting constants

myData<-LICOR_HOBO %>%
  select(PAR,HOBO_Lux) # selecting only the columns for Par and Lux data
myformula<-PAR~A*exp(-HOBO_Lux/t)+y0 # exponential function
Calibration<-function(A,t,y0,HOBO_Lux){ # create a function containing your fitting constants (A, t, and y0) and the x data (HOBO_Lux) used to estimate PAR
  eq<-A*exp(-HOBO_Lux/t)+y0
}

y.0<-min(myData$PAR)*0.5 # using y0 as an initial estimate that is something like half the minimum of the observatins of y
model<-nls_multstart(PAR ~ Calibration(A,t,y0,HOBO_Lux), 
                     data=myData, 
                     iter = 250,
                     convergence_count = 100,
                     start_lower= c(A = -2000, t = 20000, y0 = y.0),
                     start_upper= c(A = -1, t=30000, y0 = 2000),
                     lower = c(A = -2000, t = 0, y0 = 0)
)
# https://github.com/padpadpadpad/nls.multstart
# help from https://stats.stackexchange.com/questions/160552/why-is-nls-giving-me-singular-gradient-matrix-at-initial-parameter-estimates

myPlot<-ggplot(myData, aes(x = HOBO_Lux, y = PAR))+
  geom_point()+
  geom_smooth(method="nls_multstart",  # add best fit line
              formula=myformula, # this is an nls argument
              method.args = model, # also an nls argument
              se=FALSE, 
              fullrange = TRUE)+
  ylab('Licor_PAR')+
  stat_fit_tidy(method = "nls_multstart", #add the values for each model
                method.args = model, #list(formula = myformula, start=model),
                label.x = "left",
                label.y = 1.5,
                mapping = aes(label = paste("A~`=`~", signif(..A_estimate.., digits = 3),
                                            "%+-%", signif(..A_se.., digits = 2),
                                            "~~~~t~`=`~", signif(..t_estimate.., digits = 3),
                                            "%+-%", signif(..t_se.., digits = 2),
                                            "~~~~y0~`=`~", signif(..y0_estimate.., digits = 3),
                                            "%+-%", signif(..y0_se.., digits = 2),
                                            sep = "")),
                parse = TRUE) +
  theme_bw() +
  ggsave(path = paste0('LI-COR PAR Sensor Manual/Data/',foldername,'/',output_folder), filename= paste0('Par_Hobo_Plot_',serial,'_',Date,'.png'), device = 'png',width = 9, height = 6)

myPlot # plot
# summary(myPlot)
summary(model) # shows your fitting constant values and standard error for each
