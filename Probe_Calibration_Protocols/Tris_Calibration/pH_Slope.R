## process pH for Katie's Mesocosm data
library(tidyverse)
library(seacarb)
library(broom)

## bring in pH calibration files and raw data files
pHcalib<-read.csv('Probe_Calibration_Protocols/Tris_Calibration/Tris_Calibration.csv')
pHData<-read.csv("Probe_Calibration_ProtocolsTris_Calibration//TA_pHData.csv")

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


## write the data
write.csv(x = pHSlope, file = 'Probe_Calibration_Protocols/pHTA_calculated.csv')


