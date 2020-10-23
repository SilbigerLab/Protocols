

# created: 3-10-2020 by Danielle Barnas
# modified: 9-29-2020

### BEFORE RUNNING SCRIPT
# Load HoboWare .hobo datafile in HoboWare software program
# Select Series 1 and 2 for Measurements Abs Pres and Temp in kPa and degC, respectively
# Deselect all events
# Select the Barometric Compensation Assistant and click Proces...
# Choose Salt Water (1,025.000 kg/m3)
# Check to Use a Reference Water Level and enter 0.000 Meters
# Select a Reference Time when Logger was exactly at the water surface prior to or post-deployment
# Call Resultant Series Name: Water Level and click Create New Series
# Check that Series 3 for Water Level in meters is selected and click Plot
# Export file into your dated data folder (path below)

rm(list=ls())

library(tidyverse)
library(lubridate)
library(here)

here()

########################
# File Names
########################

folder.date<-'20200310'
foldername<-'Raw'
Serial<-'872'

# Date of in situ logs
Launch<-'2020-03-06 14:42:00' # Maintain date time format "2020-03-04 14:15:00"
Retrieval<-'2020-03-07 17:02:00' # Maintain date time format "2020-03-04 21:30:00"


#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

# Read in Conductivity Calibration files
path.p<-paste0('Probe_and_Logger_Protocols/HOBO_Pressure_Loggers/Data/',folder.date,'/',foldername)
file.names<-basename(list.files(path.p, pattern = "csv$", recursive = F)) #list all csv file names in the folder and subfolders
data.pres<-file.names %>%
  map_dfr(~ read_csv(file.path(path.p, .),skip=1,col_names=TRUE,col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),"Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip())))

# Filter specified probe by Serial number
data.pres<-data.pres%>%
  select(contains('Date'),contains(Serial))%>%
  mutate(Serial=Serial)%>%
  rename(date=contains("Date"),TempInSitu=contains("Temp"),AbsPressure=contains("Abs Pres"),Depth=contains("Water Level"))%>%
  drop_na()
data.pres$date<-data.pres$date%>%parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(), locale = default_locale(), trim_ws = TRUE) # Convert 'date' to date and time vector type

# Filter data to only include deployment data
Launch<-Launch %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
Retrieval<-Retrieval %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
data.pres<-data.pres%>%filter(between(date,Launch,Retrieval)) 

# Create simple csv file
write_csv(data.pres,paste0('Probe_and_Logger_Protocols/HOBO_Pressure_Loggers/Data/',folder.date,'/',Serial,'_HOBOdepth.csv'))

# Plot the data
data.pres %>% # this is the dataframe
  ggplot(aes(x= date, y= TempInSitu))+   #setup plot with x and y data
  geom_line()
data.pres %>% # this is the dataframe
  ggplot(aes(x= date, y= -Depth))+   #setup plot with x and y data
  geom_line()
