# Preprocessing script for hobo logger data
# Brings in sinlge raw .csv files and exports tidy files into both a general tidy folder for temporary storage and an output folder

# created: 9-23-2020 by Danielle Barnas
# modified: 9-29-2020

rm(list=ls())

library(tidyverse)
library(lubridate)
library(here)

here()

########################
# File Names
########################

folder.date<-'20200303' # Dated logger folder
folderLog<-'Raw' # Logged in situ file path within folder.date
Serial<-'197' # pH Probe Serial Number

# Date of in situ logs
Launch<-'2020-03-03 10:43:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"
Retrieval<-'2020-03-03 15:19:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"


#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

### Read in Logger Files
path.Log<-paste0('Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/',folder.date,'/',folderLog)
file.names.Log<-basename(list.files(path.Log, pattern = "csv$", recursive = F)) #list all csv file names in the folder and subfolders
file.names.Log<-file.names.Log[grep(pattern=Serial,x=file.names.Log)]
pHLog <- file.names.Log %>%
  map_dfr(~ read_csv(file.path(path.Log, .),skip=2,col_names=TRUE,col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),"Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip())))
pHLog<-pHLog%>% # Filter specified probe by Serial number
  mutate(Serial=Serial)%>%
  rename(date=contains("Date"),TempInSitu=contains("Temp"))%>%
  drop_na()
pHLog$date<-pHLog$date%>%parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(), locale = default_locale(), trim_ws = TRUE) # Convert 'date' to date and time vector type

# Parse date filters into date and type vector types
Launch<-Launch %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)
Retrieval<-Retrieval %>% parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),locale = default_locale(), trim_ws = TRUE)

# Filter out dates
pHLog<-pHLog%>%filter(between(date,Launch,Retrieval)) 

# write file
write_csv(pHLog,paste0('Probe_and_Logger_Protocols/HOBO_pH_Logger/Data/',folder.date,'/pH_',Serial,'_',Sys.Date(),'.csv'))


