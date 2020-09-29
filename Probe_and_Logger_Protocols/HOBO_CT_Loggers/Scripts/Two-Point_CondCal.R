# Two-point Conductivity Calibrations for the HOBO CT Loggers using raw data off of HOBOware

# script inspired by the Silbiger Lab Titrator GitHub Repository and 
# https://hasenmuellerlab.weebly.com/uploads/3/1/8/7/31874303/2019_shaughnessy_et_al_ema.pdf

# created: 9-23-2020 by Danielle Barnas
# modified: 9-29-2020

#### Conductivity Calibration for Drift #####

rm(list=ls())

library(tidyverse)
library(lubridate)
library(gsw)
library(here)

here()

# Calibration file path, Logged in situ file path, and last three digits of CT Probe Serial Number
folder.date<-'20200310'
folderCal<-'Calibration/Raw'
folderLog<-'Raw'
Serial<-'331'

# Date of calibrations
# Maintain date time format "YYYY-MM-DD HH:MM:SS"
# Deployment Calibration 
startCal1<-'2020-03-05 17:06:58' 
endCal1<-'2020-03-05 17:11:08'
# Retrieval Calibration 
startCal2<-'2020-03-05 17:06:58' 
endCal2<-'2020-03-05 17:11:08'

# Date of in situ logs start and end
Launch<-'2020-03-06 14:38:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"
Retrieval<-'2020-03-07 17:05:40' # Maintain date time format "YYYY-MM-DD HH:MM:SS"

# In Situ Recording Interval
int<-10 #seconds

# One-Point Calibration Standard
oneCal<-50000 # uS/cm

# Two-Point Calibration Standards
lowCondcal<-1413 # uS/cm
highCondcal<-12880 # uS/cm

# Read in Conductivity Calibration files
path.Cal<-paste0('Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/',folder.date,'/',folderCal)
file.names.Cal<-basename(list.files(path.Cal, pattern = "csv$", recursive = F)) #list all csv file names in the folder and subfolders
condCal <- file.names.Cal %>%
  map_dfr(~ read_csv(file.path(path.Cal, .),skip=1,
                     col_names=TRUE,col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),
                                                   "Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip())))
# Filter specified probe by Serial number
condCal<-condCal%>%
  select(contains('Date'),contains(Serial))%>%
  mutate(Serial=Serial)%>%
  rename(date=contains("Date"),TempInSitu=contains("Temp"),Sp_Conductance=contains("High Range"))%>%
  drop_na()
condCal$date<-condCal$date%>%parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(), locale = default_locale(), trim_ws = TRUE) # Convert 'date' to date and time vector type

# Read in Conductivity Logged files
path.Log<-paste0('Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/',folder.date,'/',folderLog)
file.names.Log<-basename(list.files(path.Log, pattern = "csv$", recursive = F)) #list all csv file names in the folder and subfolders
condLog <- file.names.Log %>%
  map_dfr(~ read_csv(file.path(path.Log, .),skip=1,
                     col_names=TRUE,col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),
                                                   "Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip())))
# Filter specified probe by Serial number
condLog<-condLog%>%
  select(contains('Date'),contains(Serial))%>%
  mutate(Serial=Serial)%>%
  rename(date=contains("Date"),TempInSitu=contains("Temp"),Sp_Conductance=contains("Specific Conductance"),SalinityInSitu=contains("Salinity"))%>%
  drop_na()
condLog$date<-condLog$date%>%parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(), locale = default_locale(), trim_ws = TRUE) # Convert 'date' to date and time vector type

#select the calibration for the correct date

startCal1<-startCal1%>%parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
endCal1<-endCal1%>%parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
startCal2<-startCal2%>%parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
endCal2<-endCal2%>%parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
Launch <- Launch %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
Retrieval <- Retrieval %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)

condCal<-condCal%>%filter(between(date,startCal1,endCal1)&between(date,startCal2,endCal2)) 
condLog<-condLog%>%filter(between(date,Launch,Retrieval)) 

# Use PSS-78 Equations for Salinity calculation
# Convert from Electrical Conductivity to Practical Salinity
condCal<-condCal%>%
  mutate(SalinityInSitu=gsw_SP_from_C(Sp_Conductance*0.001, TempInSitu, p=0))

# Join Calibration and Logged files
CT.data<-union(condCal,condLog)

############################################################
############################################################
# Drift correction factor

# each correction is based on linear drift over time
# data taken closer to initial calibratin are corrected less than data taken toward the end of the monitoring period
t<-int #seconds  # t = the time interval for each data point that has passed since deployment
total.t<-as.duration(Retrieval-Launch) #seconds # total.t = total deployment time
total.t<-as.numeric(total.t, "seconds")
ft<-(t / total.t) # ft = correction factor

############################################################
############################################################
# One Point Calibration with Drift

# one-point calibrations
# C = drift-corrected water quality parameter value
# Sp_Conductance = m = uncorrected value (mS/cm)
si<-oneCal #uS/cm # value of the calibration standard
sf<-condLog%>% # the value read by the instrument for the calibration standard after the total deployment time (total.t)
  summarise(Middle=median(Sp_Conductance))
sf<-as.numeric(sf[1,])

CT.data<-CT.data%>%
  mutate(C1=Sp_Conductance*0.001+ft*(si-sf))%>%
  mutate(SalinityInSituC1=gsw_SP_from_C(C1, TempInSitu, p=0))
# Use PSS-78 Equations for Salinity calculation
# Convert from Electrical Conductivity to Practical Salinity

############################################################
############################################################
# Two Point Calibration with Drift

# C = drift-corrected water quality parameter value
# at = intermediate calibration standard correction factor for the low standard
# bt = intermediate calibration standard correction factor for the high standard
ai<-lowCondcal*0.001 # ai = value of the low calibratin standard (mS/cm)
bi<-highCondcal*0.001 # bi = value of the high calibration standard (mS/cm)
# Sp_Conductance = af = value read by the instrument for the low calibration standard after the total deployment time (mS/cm)
# Sp_Conductance = bf = value read by the instrument for the high calibration standard after the total deployment time (mS/cm)

CT.data<-CT.data%>%
  mutate(at=ai+ft*(ai-Sp_Conductance*0.001),bt=bi-ft*(bi-Sp_Conductance*0.001),C2=(((Sp_Conductance*0.001-at)/(bt-at))*(bi-ai)+ai))%>%
  mutate(SalinityInSituC2=gsw_SP_from_C(C2, TempInSitu, p=0))
# Use PSS-78 Equations for Salinity calculation
# Convert from Electrical Conductivity to Practical Salinity

write_csv(CT.data,paste0('Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/',folder.date,'/CT_',Serial,'_',Sys.Date(),'.csv'))
View(CT.data)

################################################################################
################################################################################
# References

# non-linear temperature coefficient is generated that is a function of temperature and salinity
# Calculate the non-linear temperature coefficient (a)
# A good regression solution was the Taylor series depicted below:
 # a = A+B*T+C*S+D*T^2+E*S^2+F*T*S
 # WHERE: A = 1.86221444E+00
 # B = 7.99141780E-03
 # C = -2.04882760E-03
 # D = -4.79386353E-05
 # E = 1.67997158E-05
 # F = -1.55721008E-05
 # AND: T = sea water temperature in degrees C
 # S = sea water salinity 

# specific conductance (Cs) at 25°C for sea water with the following equation: 
# Cs = Ye /(1 - ((25-T) * a / 100))
# Where: Ye = Electrical Conductivity
# a = “see above” % / degrees C (temp. coeff.) 
# T = water temperature in degrees C 

# HOBO Conductivity Assistant
# To calculate specific conductance and salinity for a data series in a logger data file, the Conductivity Assistant: 
# 1. Reads the selected conductivity range for the data series, either low or high. 
# 2. Reads the recorded conductivity and temperature pair for each selected range. 
# 3. Calculates the preliminary salinity using PSS-78 for each pair. 
# 4. Calculates the temperature coefficient using the temperature coefficient equation (Taylor series) with salinity and 
 # temperature for each pair.
# 5. Calculates specific conductance using the temperature coefficient for each pair.
# 6. Calculates the hand-held meter specific conductance points and adjusts the specific conductance dataset
 # of the logger per the calibration data (if the “Use measured points for calibration” option is selected).
# 7. Calculates final Salinity using the specific conductance dataset at 25°C in PSS-78. 

## account for instrument drift over time
## reference: https://hasenmuellerlab.weebly.com/uploads/3/1/8/7/31874303/2019_shaughnessy_et_al_ema.pdf

# each correction is based on linear drift over time
# data taken closer to initial calibratin are corrected less than data taken toward the end of the monitoring period
# ft = correction factor
# t = the time interval for each data point that has passed since deployment
# total.t = total deployment time
# ft<-(t / total.t)

# one-point calibrations
# C = drift-corrected water quality parameter value
# m = uncorrected value
# si = value of the calibration standard
# sf = the value read by the instrument for the calibration standard after the total deployment time (total.t)
# C1<-m+ft*(si-sf)

# two-point calibrations
# at = intermediate calibration standard correction factor for the low standard
# bt = intermediate calibration standard correction factor for the high standard
# ai = value of the low calibratin standard
# bi = value of the high calibration standard
# af = value read by the instrument for the low calibration standard after the total deployment time
# bf = value read by the instrument for the high calibration standard after the total deployment time
# at<-ai+ft*(ai-af)
# bt<-bi-ft*(bi-bf)
# C2<-(((m-at)/(bt-at))*(bi-ai)+ai)



