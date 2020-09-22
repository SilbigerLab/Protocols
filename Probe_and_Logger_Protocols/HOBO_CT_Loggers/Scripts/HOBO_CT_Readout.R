rm(list=ls())
library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(ggpmisc)

########################
# File Names
########################

foldername<-'20200310' # folder of the day
filename_cat<-'3-8-2020_CT_20739332.csv' # concatenated data from miniDOT Logger
Serial<- '332' # Logger's serial number ID
Launch<-'2020-03-08 15:10:00' # Maintain date time format "2020-03-04 14:15:00"
Retrieval<-'2020-03-08 15:50:00' # Maintain date time format "2020-03-04 21:30:00"
Date <- 20200308 # today's date

#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

# Tidy Concatenation Data
Concat_Data <- read_csv(paste0('HOBO_CT_Loggers/Data/',foldername,'/',filename_cat),
                        col_names = TRUE,
                        skip=1) #skips first 1 rows containing instrument information
# Split merged cell into column headings
# note that all vectors are character type
Concat_Data <- Concat_Data %>%
  rename(
         PST=contains("Date"),
         Temp_degC=contains("Temp"),
         Sp_Conductance=contains("Specific Conductance"),
         Salinity_ppt=contains("Salinity"))

# Convert PST to date and time vector type
Concat_Data$PST <- Concat_Data$PST %>%
  parse_datetime(format = "%m/%d/%y %H:%M:%S %p", na = character(),
                 locale = default_locale(), trim_ws = TRUE)

# Filter data to only include deployment data
Launch <- Launch %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)
Retrieval <- Retrieval %>%
  parse_datetime(format = "%Y-%m-%d %H:%M:%S", na = character(),
                 locale = default_locale(), trim_ws = TRUE)
Concat_Data <- Concat_Data %>%
  filter(between(PST,Launch,Retrieval)) %>%
  select(-'#')
View(Concat_Data)

# Create simple csv file
write_csv(Concat_Data,paste0('HOBO_CT_Loggers/Data/',foldername,'/',Date,'_CT_',Serial,'.csv'))

# Plot the data
Concat_Data %>% # this is the dataframe
  ggplot(aes(x= PST, y= Temp_degC))+   #setup plot with x and y data
  geom_line() #+ #adding lines
Concat_Data %>% # this is the dataframe
  ggplot(aes(x= PST, y= Salinity_ppt))+   #setup plot with x and y data
  #ggplot(aes(x=PST, y= Temp_degC))+
  geom_line()# + #adding lines
# scale_y_continuous(sec.axis = sec_axis('Temp_degC', name=derive()))
