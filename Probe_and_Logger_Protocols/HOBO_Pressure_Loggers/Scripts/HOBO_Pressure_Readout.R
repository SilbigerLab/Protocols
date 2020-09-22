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
filename<-'3-7-2020_Depth_20810872.csv' # concatenated data from miniDOT Logger
Launch<-'2020-03-06 12:55:00' # Maintain date time format "2020-03-04 14:15:00"
Retrieval<-'2020-03-07 17:02:00' # Maintain date time format "2020-03-04 21:30:00"
Date <- 20200310 # today's date

#################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE ----------------------------------
#################################################################################

# Tidy Concatenation Data
Concat_Data <- read_csv(paste0('HOBO_Pressure_Loggers/Data/',foldername,'/',filename),
                        col_names = TRUE,
                        skip=1) #skips first 1 rows containing instrument information
# rename column headings
Concat_Data <- Concat_Data %>%
  rename(PST=contains("Date"), Abs_Pressure_kPA=contains("Abs Pres"),Temp_degC=contains("Temp"),Depth_m=contains("Water Level"))
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
write_csv(Concat_Data,paste0('HOBO_Pressure_Loggers/Data/',foldername,'/',Date,'_HOBOdepth.csv'))

# Plot the data
Concat_Data %>% # this is the dataframe
  ggplot(aes(x= PST, y= Temp_degC))+   #setup plot with x and y data
  geom_line() #+ #adding lines
Concat_Data %>% # this is the dataframe
  ggplot(aes(x= PST, y= -Depth_m))+   #setup plot with x and y data
  #ggplot(aes(x=PST, y= Temp_degC))+
  geom_line()# + #adding lines
# scale_y_continuous(sec.axis = sec_axis('Temp_degC', name=derive()))
