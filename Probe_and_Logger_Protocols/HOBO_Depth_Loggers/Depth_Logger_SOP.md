# Protocol for the calibration, use, and maintenance of HOBO pressure/depth loggers

# Protocol for the calibration, use, and maintenance of HOBO conductivity and temperature loggers

**Contents**  
- [**Materials**](#Materials)  
- [**Configuration and Launching**](#Configuration)
- [**Calibration**](#Calibration)  
- [**Deployment**](#Deployment)
- [**Data Retrieval**](#Data_Retrieval)
  - [In situ readout](#in_situ_readout)
  - [Ex situ readout](#ex_situ_readout)
- [**Maintenance and Storage**](#Maintenance)

<a name="Materials"></a> **Materials**  
- HOBOware software installed on computer
- HOBO Waterproof Shuttle
- HOBO Water Level Data Logger (U20-001)
- White COUPLER2-B for U20-001 Logger connection to the Shuttle
- USB-HOBO Shuttle connector cable

<a name=Configuration></a> **Configuration and Launching Logger**  
1. Open HOBOware software on your computer.
1. Attach the white coupler to the HOBO Waterproof Shuttle and connect the Shuttle to your computer via USB cable.
1. If capped, Unscrew the black plastic end cap from the logger by turning it counter-clockwise and insert the end of the logger into the coupler.
1. Squeeze and release the black bar on the coupler to the shuttle.
    1. The magnet at the end of the black bar should initialize connection between the Logger and Shuttle.
    1. The Shuttle should show a yellow light at Transfer for a moment then the green light for OK should be visible.
    1. If no lights turn on, push the blue coupler down further on the Shuttle and try again.
1. Along the bottom of the HOBOware window, the name and/or serial number of the logger should be displayed to indicate a successful connection.
1. Along the top bar of the HOBOware window, click Device, then Launch.
1. Select to log the Abs. Pressure and Temperature.
1. Set the logging interval (down to 1 second intervals).
1. Set the logger to begin recording "on the next logging interval".
1. Click Launch and wait for a 'successful configuration' notification before disconnecting the logger.

<a name=Calibration></a> **Calibration**  
1. Launch logger using the HOBOware software if the logger is not already recording.
1. Prior to deployment, place the logger exactly at sea level and record the time and the last three digits of the logger's Serial Number.
1. Let the logger sit at sea level for a few logging intervals to have a stable reading, then record the time the logger is removed from sea level.
1. Allow the instrument to continue logging until deployment.  HOBOware will need these calibration points included with the deployment data for processing.

<a name=Deployment></a> **Deployment**  
1. Make sure the the black plastic cap is screwed onto the logger to protect the connection sensor.
1. Deploy the logger so that it is secure and will not be moved by currents or surge.
1. Note the time of deployment with the last three digits of the Serial Number and the GPS coordinates.

<a name="Data_Retrieval"></a> **Data_Retrieval**  
1. There are two methods of data retrieval:
    - In situ - logger remains in the field and continues logging
    - Ex situ - logger is removed from the field and connected directly to the computer
1. In situ using the Waterproof Shuttle <a name=in_situ_readout></a>
    1. Make sure the small screw cap at the end of the Shuttle is securely tightened with the o-ring in place, so no water will enter the electrical components of the Shuttle.
    1. Attach the white coupler to the HOBO Waterproof Shuttle.  Make sure the coupler is pressed all the way down to ensure a connection.
    1. On the logger, unscrew the black plastic cap and insert the end of the Logger into the coupler (can be submerged up to 20m or 66ft).
    1. Squeeze and release the black bar on the coupler to the shuttle.
        1. The magnet at the end of the black bar should initialize connection between the Logger and Shuttle.
        1. The Shuttle should show a yellow light at Transfer for a moment then the green light for OK should be visible.
        1. If no lights turn on, push the blue coupler down further on the Shuttle and try again.
    1. Once the Shuttle shows the OK green light, data has successfully transferred to the Shuttle, and you can remove the logger from the coupler and replace the black rubber cap on the logger.
    1. Repeat previous three steps for all in situ loggers.
    1. Once back in lab, soak or thoroughly rinse the Waterproof Shuttle in DI water and let dry.
    1. Connect the Waterproof Shuttle to the computer by unscrewing the small cap at the end of the Shuttle (if tight, use a small rod or pencil to insert into the hole and use as leverage to turn the cap counterclockwise to loosen), and connect using the USB cable.
    1. Along the top bar of the HOBOware window, click Device, then Manage Shuttle.
        1. HOBOware will detect the file(s) that transferred to the Shuttle from your in situ logger(s).
1. Ex situ <a name=ex_situ_readout></a>
    1. Once you've retrieved the logger from the field, soak or thoroughly rinse the logger in DI water and let dry.
    1. Open HOBOware software on your computer.
    1. Attach the white coupler to the HOBO Waterproof Shuttle.  Make sure the coupler is pressed all the way down to ensure a connection.
    1. Connect the Waterproof Shuttle to the computer by unscrewing the small cap at the end of the Shuttle (if tight, use a small rod or pencil to insert into the hole and use leverage to turn the cap counterclockwise to loosen), and connect using the USB cable.
    1. On the logger, unscrew the black plastic cap and insert the end of the Logger into the coupler, aligning the arrow on the Logger with the arrow on the coupler.
    1. Squeeze and release the black bar on the coupler to the shuttle.
        1. The magnet at the end of the black bar should initialize connection between the Logger and Shuttle.
        1. The Shuttle should show a yellow light at Transfer for a moment then the green light for OK should be visible.
        1. If no lights turn on, push the blue coupler down further on the Shuttle and try again.
    1. Along the bottom of the HOBOware window, the name and/or serial number of the logger should be displayed to indicate a successful connection.
    1. Along the top bar of the HOBOware window, click Device, then Readout.
1. Input the Description name of your data, if different from the Description name used when Launching the logger.  Include the Serial Number in this Description.
1. Select to readout the Abs. Pressure (choose units - kPa) and Temperature (choose units - degrees C).
1. Deselect all unecessary Event items (i.e. "Coupler Detached", "Coupler Attached", "Host Connected", "Stopped, and "End of File")
1. If the time zone has changed from deployment, set the GMT time offset for your location.
1. Under Data Assistant, select Barometric Compensation Assistant, and click Process.
1. Select the appropriate fluid density (or input manual density) for fresh water, salt water, or brackish water.
1. Select to Use a Reference Water Level and input 0.000 Meters.
1. Click the up and down arrows next to Reference Time and select a time point within the time range when your logger was exactly at sea level.
1. Title the Resultant Series Name: Water Level and click Create New Series.
1. Make sure Water Level is also selected under Series, then click Plot.
1. Save data log(s)
    1. Click File and Export Table Data.
    1. Include all remaining Measurements (Abs. Pressure, Water Level, and Temperature), and click Export.
    1. Save file (include Serial Number in filename) as a .csv file in a dated Raw folder in "Probe_and_Logger_Protocols/HOBO_Depth_Loggers/Data/" (ex. "Probe_and_Logger_Protocols/HOBO_Depth_Loggers/Data/20201023/Raw/")
1. Run [the HOBO_Depth_Readout script](Scripts/HOBO_Depth_Readout.R) for data processing.
    1. Processed data will automatically be saved in the dated folder (ex. "Probe_and_Logger_Protocols/HOBO_Depth_Loggers/Data/20201023/") with Serial Number identification

<a name="Maintenance"></a> **Maintenance and Storage**  
1. Soak or thoroughly rinse with DI water all instruments that were submerged in salt water, then let dry before storing.
