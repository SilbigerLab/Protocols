## Stepwise Guide to Running Respirometry with Temperature Ramp-up

Follow these steps to prepare for running respiration:
- [Respirometer Setup](https://github.com/SilbigerLab/Protocols/blob/master/Physiological_Parameter_Protocols/Protocols/Respirometry_Protocol/Respirometer_SOP.md)
- [Oxy10 and Presens Setup](https://github.com/SilbigerLab/Protocols/blob/master/Physiological_Parameter_Protocols/Protocols/Respirometry_Protocol/PreSens_SOP.md)

**Changing over between runs (with temperature ramp-up)**
1. Stop each channel individually and write down the stop time
2. On the Apex Dashboard, edit the temperature programs for the next temperature treatment to bring water bath to target temp
3. In PreSens, export the last run's data files in the desired folder location. Open one of the csv files to make sure they exported correctly (is there data?)
4. Assign the next run's files to each channel
5. In RStudio Terminal:
    - git pull
    - git add .
    - git commit -a -m "some commit message here"
    - git push
6. As temperature nears target in the water bath, use the digital thermometer to spot check the temperature and Calibrate the Apex 'tmp' probe to the actual temperature
7. Once the water bath is at or near the target, fill the chambers in a filler bath already at target temperature and put chambers on the respirometry stand with probes in preparation
8. Once all chambers are placed, with stir bars going, no bubbles, and at target temperature, start the run for each individual channel at write down the time (turn off the light if necessary)
9. After starting the run, change the temperature setting on the inkbird to the next target temperature to begin bringing up the filler bath temp in preparation for the next run
10. If needed, in the last few minutes of the current run, move over the 800W heater from the water bath to assist in temperature ramp up in the filler bath. Make sure you move the 800W heater back to the water bath once the run has ended so the water bath temperature can ramp up quickly
