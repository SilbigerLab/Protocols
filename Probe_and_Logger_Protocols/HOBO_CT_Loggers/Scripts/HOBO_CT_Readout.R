rm(list=ls())

library(tidyverse)
library(lubridate)
library(here)

here()

## BEFORE BRINGING IN HOBO DATA
# Check the last three digist of each probe's serial number
# Make sure the "Organize based on CT probe Serial Number" section has script for those specific serial numbers

########################
# File Names
########################

folderCal<-'20200310/Calibration/' # CT Calibration file
folderLog<-'20200310/Raw' # CT logged data
Serial<-'331' # last three digits of CT probe Serial Number

# Date of calibrations - Maintain date time format "YYYY-MM-DD HH:MM:SS"
# Deployment Calibration 
startCal1<-'2020-03-05 17:06:58' 
endCal1<-'2020-03-05 17:11:08'
# Retrieval Calibration 
startCal2<-'2020-03-05 17:06:58' 
endCal2<-'2020-03-05 17:11:08'

# Date of in situ logs start and end
Launch<-'2020-03-06 14:38:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"
Retrieval<-'2020-03-07 17:05:40' # Maintain date time format "YYYY-MM-DD HH:MM:SS"


#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

# group data from all Hobo CT logger files together
# import all csv files in the 'foldername' directory
path.p<-paste0('Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/',foldername,'/Raw')
file.names<-basename(list.files(path = path.p, pattern = "csv$", recursive = F)) #list all csv file names in the folder and subfolders
# read in all the files, skipping the first line of each file containing logger system information
C.data <- file.names %>%
  map_dfr(~ read_csv(file.path(path.p, .),skip=1,
                 col_names=TRUE,col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),
                                               "Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip())))

# parse launch and retrival date and time into date and time format
Launch <- Launch %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
Retrieval <- Retrieval %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)

#############################
# Organize based on CT probe Serial Number and combine into one dataframe
#############################

# Probe 331
C.data <- C.data%>%
  select(contains('Date'),contains('331'))%>%
  mutate(Serial='331')%>%
  rename(date=contains("Date"),TempInSitu=contains("Temp"),Sp_Conductance=contains("Specific Conductance"),SalinityInSitu=contains("Salinity"))%>%
  drop_na()
C.data$date<-C.data$date%>%parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(), locale = default_locale(), trim_ws = TRUE) # Convert 'date' to date and time vector type



# Filter data to only include deployment data
CT.data <- CT.data %>% filter(between(date,Launch,Retrieval)) 
View(CT.data)

# Create simple csv file
write_csv(CT.data,paste0('Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/',foldername,'/',Sys.Date(),'_CT.csv'))

# Plot the data
ggplot(data=CT.data, aes(x= date, y= TempInSitu, colour=Serial))+   #setup plot with x and y data
  geom_line() #+ #adding lines

ggplot(data=CT.data, aes(x= date, y= SalinityInSitu, colour=Serial))+   #setup plot with x and y data
  geom_line()# + #adding lines

