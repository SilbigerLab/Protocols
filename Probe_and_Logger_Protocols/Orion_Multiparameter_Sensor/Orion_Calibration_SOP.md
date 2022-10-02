# Standard protocol for Fisher Scientific Orion Star pH/conductivity portable multiparameter meter calibration
Original: 20200730  
Last Revised: 20210324 

Contents
- [**Materials**](#Materials)  
- [**Protocol**](#Protocol)
  - [NBS Calibration](#NBS)
  - [Tris Calibration](#Tris)
  - [Conductivity Calibration](#Conductivity)
- [**Cleaning and Storage**](#Cleaning_and_Storage)
- [**References**](#References)
 
***
<a name="Materials"></a> **Materials**
  *  Orion Star multiparameter meter (measures pH, mV, ORP, conductivity, total dissolved solids (TDS), salinity, resistivity, and temperature)
  *  3-point pH calibration solutions (4, 7, and 10 at 25 &deg; C) (for NBS Scale cal)
  *  Tris standard from the Dickson lab at Scripps (for Total Scale cal)
  *  Chem Wipes
  *  DI water
  *  Orion Star User Manual

*** 
<a name="Protocol"></a> **Protocol**

<a name="NBS"></a> **NBS Calibration**  
1. Calibrating pH
    1. pH should be calibrated <24 hours before use. (You do *not* need to Tris calibrate for an NBS calibration)
    1. Fill a small clean beaker with DI water, and pour the three calibration solutions (pH of 4, 7, and 10) into three clean beakers, and place near your work station.
    1. Plug in the pH probe (spring loaded). If you are only using the pH probe for measurements, only plug in the spring loaded end of the 
    1. Turn on the meter and wait for the measurement screen to appear.
        1. Make sure the current measurement is for pH.  If not, Either change the Channel (press F3 to swap between probe inputs) or Mode (pressing the Mode button on the meter to swap between measurements using the current Channel's probe) until the instrument is reading pH.
    1. Press F1 to select "cal" and go into Calibration settings.  You should see a prompt screen for the meter to read the first calibration solution.
    1. Remove the probe from the storage solution
        1. First unscrew the lid from the small storage container.
        1. Once the probe and storage cap are able to be lifted from the storage container, slide the cap off the probe.
    1. Rinse the probe in DI water to remove any storage solution, and dry the probe (but not the sensor tip) with a chem wipe.
    1. Place the probe into the pH 4 solution, fully submerging the sensor tip, and gently agitate the probe tip back and forth.
    1. Press F3 to Start the first calibration and wait for the reading to stabilize.
        1. The probe should read 4.01 at the lab's ambient temperature of 22-23 &deg; C
    1. Once the reading has stabilized at a reasonable value, press F2 for the Next calibration.
    1. Rinse the probe in DI and dry with a chem wipe (again avoiding the sensor tip) before placing the probe in the pH 7 solution, and then gently agitate the probe tip back and forth.
    1. Wait for a stable reading (7.01 at 22-23 &deg; C) then press F2 for the Next calibration.
    1. Rinse the probe in DI and dry with a chem wipe (again avoiding the sensor tip) before placing the probe in the pH 10 solution, and then agitate the probe tip back and forth briefly.
    1. Wait for a stable reading (10.04 at 22-23 &deg; C) then press F3 to Finish calibration.
    1. If you are satisfied with the three calibration values on the summary screen, press F1 to return to the Measurement screen.

<a name="Tris"></a> **Tris Calibration**  
1. Calibrating pH
    1. pH should be calibrated <48 hours before use. (You do *not* need to use the 4,7,10 buffers before a Tris calibration.)
    1. Fill a small clean beaker with DI water.
    1. Fill about half of a 50mL falcon tube with fresh Tris Buffer (from Scripps CO2 Lab). 
        1. If a tris buffer has already been allocated within the previous 3 weeks and properly sealed and stored in the fume hood, you may use this solution for the calibration.
        1. Place the sealed falcon tube in a container to keep it mostly  upright.
    1. Collect ice chips from Magnolia Hall in a clean beaker or other container and set to the side of your work station.
    1. Once you unscrew and remove the KCl storage cap from the probe, rinse the electrode in DI water, wipe the probe casing dry, slip on the falcon tube cap (cap with a large and small hole cut into the top) about halfway up the probe casing, and then place the electrode into the tris tube and screw on the cap.
    1. Place the Traceable Thermometer probe tip into the small hole of the cap and slide down to the same level as the pH electrode.  Turn on the Thermometer.
    1. Turn on the meter and wait for the measurement screen to appear.
        1. Make sure the current measurement is for mV.  If not, either change the Channel (press F3 to swap between probe inputs) or Mode (pressing the Mode button on the meter to swap between measurements using the current Channel's probe) until the instrument is reading mV.
    1. Plan to record the temperature and mV values for every temperature spanning one degree Ceclius above and below the temperature range you expect to record in situ.
        1. Record mV and temperature for at least 5 temperatures to create a best fit curve.
    1. Fill the container in which the falcon tube of tris is sitting with sink water.
    1. Move the pH electrode and thermometer with cap to the falcon tube containing tris, wiping both probes before placing in the falcon tube and screwing the cap on. 
    1. If your highest planned temperature value is greater than the ambient tris temperature, warm up the container of sink water in the microwave and then place the tris falcon tube into this water bath.
    1. If your highest planned temperature value is lower than the ambient tris temperature, place a few ice chips into the water bath.
    1. Watch the thermometer temperature as it rises or falls, and when the temperature is near your target upper temperature, press Measure on the Orion and wait for the value to stabilize (attempt to time the mV reading stabilization as close to a rounded temperature value on the thermometer as possible).
    1. As soon as the Orion value has stabilized, record the thermometer temperature first, then the mV value (note that mV values should be negative).
    1. To lower the temperature to each subsequent temperature in your calibration, place a few ice chips at a time in the water bath and record each temperature with its paired mV value.
    1. Once you have recorded the lowest temperature and its paired mV value, unscrew the cap with probes from the tris falcon tube and place the probes back into the DI falcon tube, screwing the cap back on if you intend to record your in situ values immediately.  If you will not be recording your in situ values yet, remove the pH probe from the cap and place the electrode tip back in its storage solution until ready to record.
    1. Save your temperature and mV values as a .csv file with the following column headings (without quotes): "date", "TTris", and "mVTris"
1. Measurements
    1. When recording your values in situ, always record the temperature first from the Traceable Thermometer before the stabilized mV value from the Orion.
    1. In tandem with recording the temperature and mV of your water sample, also record the salinity and save three three metrics with your sample ID's in a .csv file with the following column headings (without quotes): "date", "SampleID", "Salinity_lab", "mV", "TempInSitu"
    1. Use the calibration file created above and this in situ file to calculate pH on the Total Scale using the [Tris_pH_Slope.R script](https://github.com/SilbigerLab/Protocols/blob/master/Probe_and_Logger_Protocols/Orion_Multiparameter_Sensor/Scripts/Tris_pH_Slope.R)

<a name = "Conductivity"></a> **Calibrating Conductivity**
    1. Conductivity should be calibrated <48 hours before use.
    1. Fill a small clean beaker with DI water, and pour the two calibration solutions (1413 uS/cm and 12.9 mS/cm or 50 mS/cm) into two clean beakers or titration cups, and place near your work station.
    1. Plug in the conductivity probe (Cond/ATC).
    1. Turn on the Orion and wait for the measurement screen to appear.
        1. Make sure the current measurement is for Salt (left) and psu (right).  If not, Either change the Channel (press F3 to swap between probe inputs until you see Salt) or Mode (pressing the Mode button on the meter to swap between measurements using the current Channel's probe until you see psu) until the instrument is reading Salinity.
    1. Press F1 to select "cal" and go into Calibration settings.  You should see a prompt screen for the meter to read the first calibration solution.
    1. Follow the prompts to place the probe into the lower calibration solution first (1413 uS/cm).  Wait for the reading to stabilize, and make sure the read solution value matches the calibration solution value.
    1. Press F2 to accept the value and then to move to the next calibration.
    1. Place the probe in DI to rinse off the previous solution and wipe until dry with a kim wipe
    1. Place the probe in the next calibration solution (higher solution).  Wait for the reading to stabilize, and make sure the read solution value matches the calibration solution value.
    1. Press F2 to accept the value and then finish calibration.
    1. If you are satisfied with the two calibration values on the summary screen, press F1 to return to the Measurement screen.

<a name="Cleaning and Storage"></a> 
1. Cleaning and Storage
    1. When you have finished using the meter, thoroughly rinse all probes, especially sensor tips, with DI water.
    1. Dry probes (avoiding sensor tips) with chem wipes.
    1. pH probe
        1. Unscrew the storage container cap from the container, and slide the cap onto the probe shaft, far enough that the sensor tip will be submerged in the storage solution, but not so far that the cap will not full screw onto the container.
        1. If needed, refill the storage solution.
        1. Place the probe into the container and screw on the cap.
        1. Check to make sure the sensor tip is fully submerged.
        1. **Do not** try to force the sensor tip further into the solution while the cap is screwed on or you may damage the probe.
    





***
<a name="References"></a> **References**

  *  Orion Star User Manual
