## process pH

rm(list=ls())

library(tidyverse)
library(seacarb)
library(broom)

foldername<-'Data/HOBO_MX2501/hobo_logger/20200303/'
filename<-'pH_SN197_2020-09-24.csv'

## bring in pH calibration files and raw data files
pHcalib<-read_csv('Data/HOBO_MX2501/Tris_Calibration/Tris_Calibration.csv')
pHData<-read_csv(paste0(foldername,filename))

Salinity_lab<-34 # tris buffer. normally is a column in datasheet for pHData

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
  mutate(pH_calc = pH(Ex=mV,Etris=mVTris,S=Salinity_lab,T=TempInSitu)) %>% # calculate pH of the samples using the pH seacarb function
  #mutate(pH_insitu = pHinsi(pH = pH, ALK = TA_Raw, Tinsi = TempInSitu, Tlab = Temp, S = Salinity_lab_Silbiger)) %>%
  select(date,time,TempInSitu,pH,mV,pH_calc,mVTris) %>% # ,Salinity_lab ## need to calculate pH insi then it is done
  unite(date,c(date,time),sep=" ")

View(pHSlope)

## write the data
write.csv(x = pHSlope, file = paste0('Data/HOBO_MX2501/Tris_Calibration/tris_',filename))
