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

foldername<-'Data/HOBO_MX2501/hobo_logger/20200303' # folder of the day
filename<-'SN 20719197 2020-03-03 15_20_41 -0800.csv' # data file
serial<-'SN197' # serial ID for the probe
Launch<-'2020-03-03 10:43:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"
Retrieval<-'2020-03-03 15:19:00' # Maintain date time format "YYYY-MM-DD HH:MM:SS"

# Tidy the data for processing
pHData<-read_csv(paste0(foldername,'/',filename),
  col_names = TRUE,
  skip=2, #skips top rows containing instrument information
  col_types=list("Button Down"=col_skip(),"Button Up"=col_skip(),
                                "Host Connect"=col_skip(),"Stopped"=col_skip(),"EOF"=col_skip()))
pHData<-pHData %>%
  drop_na() %>% #remove empty rows
  rename( #rename column headings
    date=contains("Date"),
    TempInSitu=contains("Temp"))

# Convert 'date' to date and time vector type
pHData$date <- pHData$date %>%
  parse_datetime(format = "%m/%d/%y %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)

# Filter data to only include deployment data
Launch <- Launch %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)
Retrieval <- Retrieval %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)
pHData <- pHData %>%
  filter(between(date,Launch,Retrieval))
# write file
write_csv(pHData,paste0(foldername,'/pH_',serial,'_',Sys.Date(),'.csv'))


