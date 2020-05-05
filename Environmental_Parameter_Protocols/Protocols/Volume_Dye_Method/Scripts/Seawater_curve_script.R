#Tide pool volume experiment
#scripted by Julio Rosales
# edited on 2-1-19 by Nyssa


# clear the working directory #####
rm(list = ls())


# load the libraries #####
library(tidyverse)
library(nlme)
library(purrr)
library(broom)
library(ggpmisc)

#folder of the day
folder<-"Environmental_Parameter_Protocols/Protocols/Volume_Dye_Method/Data/"
#load the data
tdata<-read_csv(paste0(folder,"Tide_pool_vol_stdcurve_seawater_data.csv"))
View(tdata)

#analyze data ####
tdata %>% # this is the dataframe
  group_by(Machine,DyeVolume) %>% #grouping by machine and dye volume
  ggplot(aes(x= Absorbance, y= Volume))+   #setup plot with x and y data
  geom_line() + #adding lines
  facet_wrap(~Machine*DyeVolume) #dividing plots by machine and dye volume 


# only include the complete cases
tdata<-tdata[complete.cases(tdata),]

#write a power function for each curve work in progress
pool.coefs<-tdata %>%
  group_by(Machine,DyeVolume) %>% #grouping by machine and dye volume
  nest()%>% # nest everything by machine and dye volume
  mutate( # mutate the dataframe
    fit = map(data,~nls(Volume~b*Absorbance^z, start = list(b=-1, z=-1), data = .)), # run theregression model
    tidied = map(fit,tidy)) %>% # make it clean 
  unnest(tidied) %>% # unnest the data so that it is a dataframe again
  select(c(Machine, DyeVolume, term, estimate))%>% # only select the parameters that we want
  spread(key = term, value =  estimate) # spread the data so that each parameter has its own column

# look at the results
pool.coefs

# plot the results
formula<-y~I(b*x^z) # power function
ggplot(tdata, aes(x = Absorbance, y = Volume))+
  geom_point()+
  geom_smooth(method="nls",  # add best fit line
              formula=formula, # this is an nls argument
              method.args = list(start=c(b=-1, z=-1)), # this too
              se=FALSE, fullrange = TRUE)+
  ylab('Volume (L)')+
  stat_fit_tidy(method = "nls", #add the values for each model
                method.args = list(formula = formula, start=c(b=-1, z=-1)),
                label.x = "left",
                label.y = 1.5,
                mapping = aes(label = paste("b~`=`~", signif(..b_estimate.., digits = 3),
                                  "%+-%", signif(..b_se.., digits = 2),
                                  "~~~~z~`=`~", signif(..z_estimate.., digits = 3),
                                  "%+-%", signif(..z_se.., digits = 2),
                                  sep = "")),
                parse = TRUE) +
  facet_wrap(~Machine*DyeVolume, labeller = label_both)+
  theme_bw()+
  ggsave(filename = 'DyeStandardCurves.png', device = 'png',width = 9, height = 6)
