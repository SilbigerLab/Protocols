## process pH

library(tidyverse)
library(seacarb)
library(broom)

## bring in pH calibration files and raw data files
pHcalib<-read_csv('Data/Hannibal/Tris_Calibration/Tris_Calibration_Log.csv')
pHData<-read_csv('Data/Hannibal/Tris_Calibration/Raw_Data/Test_Data.csv')

## take the mV calibration files by each date and use them to calculate pH
pHSlope<-pHcalib %>%
  group_by(date)%>%
  do(fitpH = lm(mVTris~TTris, data = .))%>% # linear regression of mV and temp of the tris
  tidy(fitpH) %>% # make the output tidy
  select(date, term, estimate) %>%
  pivot_wider(names_from = term, values_from = estimate) %>%# put slope and intercept in their own column
  left_join(.,pHData) %>% # join with the pH sample data
  mutate(mVTris = TempInSitu*TTris + `(Intercept)`) %>% # calculate the mV of the tris at temperature in which the pH of samples were measured
  mutate(pH = pH(Ex=mV,Etris=mVTris,S=Salinity_lab,T=TempInSitu)) %>% # calculate pH of the samples using the pH seacarb function
  #mutate(pH_insitu = pHinsi(pH = pH, ALK = TA_Raw, Tinsi = TempInSitu, Tlab = Temp, S = Salinity_lab_Silbiger)) %>%
  select(date, SampleID,Salinity_lab,pH, TempInSitu) ## need to calculate pH insi then it is done

# or
pHSlope<-pHcalib %>%
  nest_by(date)%>%
  mutate(fitpH = list(lm(mVTris~TTris, data = data))) %>% # linear regression of mV and temp of the tris
  summarise(broom::tidy(fitpH)) %>% # make the output tidy
  select(date, term, estimate) %>%
  pivot_wider(names_from = term, values_from = estimate) %>%# put slope and intercept in their own column
  left_join(.,pHData) %>% # join with the pH sample data
  mutate(mVTris = TempInSitu*TTris + `(Intercept)`) %>% # calculate the mV of the tris at temperature in which the pH of samples were measured
  mutate(pH = pH(Ex=mV,Etris=mVTris,S=Salinity_lab,T=TempInSitu)) %>% # calculate pH of the samples using the pH seacarb function
  #mutate(pH_insitu = pHinsi(pH = pH, ALK = TA_Raw, Tinsi = TempInSitu, Tlab = Temp, S = Salinity_lab_Silbiger)) %>%
  select(date, SampleID,Salinity_lab,pH, TempInSitu) ## need to calculate pH insi then it is done

View(pHSlope)

## write the data
write.csv(x = pHSlope, file = 'Data/test.csv')
