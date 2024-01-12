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
- HOBO Conductivity and Temperature Logger (U24-002-C) and black rubber cap
- Blue coupler for U24-002-C Logger connection to the Shuttle
- USB-HOBO Shuttle connector cable
- [CT Manuals](https://github.com/SilbigerLab/Protocols/tree/master/References_and_Manuals/HOBO_Conductivity_Logger)

<a name=Configuration></a> **Configuration and Launching Logger**  
1. Open HOBOware software on your computer.
1. Attach the blue coupler to the HOBO Waterproof Shuttle and connect the Shuttle to your computer via USB cable.
1. If capped, remove the black rubber cap from the Logger and insert the round end of the Logger into the coupler, aligning the arrow on the Logger with the arrow on the coupler.
1. Squeeze and release the black bar on the coupler to the shuttle.
    1. The magnet at the end of the black bar should initialize connection between the Logger and Shuttle.
    1. The Shuttle should show a yellow light at Transfer for a moment then the green light for OK should be visible.
    1. If no lights turn on, push the blue coupler down further on the Shuttle and try again.
1. Along the bottom of the HOBOware window, the name and/or serial number of the logger should be displayed to indicate a successful connection.
1. Along the top bar of the HOBOware window, click Device, then Launch.
1. Select to log the Low Range and High Range (choose units - uS/cm).  Temperature will automatically be selected.
1. Set the logging interval (down to 1 second intervals).
1. Set the logger to begin recording "on the next logging interval".
1. Click Launch and wait for a 'successful configuration' notification before disconnecting the logger.

<a name=Calibration></a> **Calibration (Direct)**  
1. Using either a one-calibration solution or two-calibration solutions, pour the contents into a container which the Logger can be placed into to fully submerge the conductivity sensor.
1. Launch logger using the HOBOware software if the logger is not already recording.
1. Record the time the logger is placed in the first calibration solution and the last three digits of the logger's Serial Number
1. Leave the logger to sit for a few minutes to stabilize, then record the time the logger is taken out of the solution.
1. If doing a two-point calibration, rinse the logger wtih DI, then dry with a kim wipe before placing it into the second solution, also recording the time in and time out after a few minutes.
1. If not deploying right away, either Stop deployment and [Readout](#ex_situ_readout) calibration data using HOBOware, or allow the instrument to continue logging until deployment.

<a name=Calibration></a> **Calibration (Using YSI)** 

Aim to do a two-point calibration with this method (IE, do this once before you sample and once after you sample).

1. [Calibrate YSI](https://github.com/SilbigerLab/Protocols/blob/master/Probe_and_Logger_Protocols/YSI_2030/YSI2030_Calibration_SOP.md)
2. Place YSI and all HOBO CT loggers into a container of sea water (e.g. water table, bucket, or bin). Make sure YSI is as close to CTs as possible to ensure an accurate calibration.
3. Record time and YSI measurements for 3+ sampling periods and take the average of all values for this time period.
4. Record values in a [Calibration Log](https://github.com/njsilbiger/TPdP/blob/main/Data/CT_Calibration_Log.csv). This should include the following columns:
	  * **LoggerID** (typically last 3 digits of serial number)
	  * **date** (date the *calibration* was conducted)
	  * **pre_post** (whether the calibration was done pre-sampling or post-sampling)
	  * **time_in** (time the calibration started)
	  * **time_out** (time the calibration ended)
	  * **cond_HL** (whether water temp was set as for high (H) or low (L) in CT launch settings - typically, this is high if you are sampling in sea water)
	  * **cond_uS** (from YSI reading)
	  * **EC_SC** (Whether you calibrate the YSI for Electrical Conductivity (EC) or Specific Conductivity (SC). Typically, this is SC)
	  * **temp_HL** (whether water temp was set as high (H) or low (L) in CT launch settings - typically, tropical is high and temperate is low)


<a name=Deployment></a> **Deployment**  
1. If the logger is not already logging, [Launch the logger](#Configuration).
1. Place the black rubber cap on the round end of the logger to protect the connection sensor
1. Deploy the logger so that it is secure and will not be moved by currents or surge.  Make sure the conductivity sensor will not be bumped or scratched while deployed.
1. Note the time of deployment with the last three digits of the Serial Number and the GPS coordinates.

<a name="Data_Retrieval"></a> **Data_Retrieval**  
1. There are two methods of data retrieval:
    - In situ - logger remains in the field and continues logging
    - Ex situ - logger is removed from the field and connected directly to the computer
1. In situ using the Waterproof Shuttle <a name=in_situ_readout></a>
    1. Make sure the small screw cap at the end of the Shuttle is securely tightened with the o-ring in place, so no water will enter the electrical components of the Shuttle.
    1. Attach the blue coupler to the HOBO Waterproof Shuttle.  Make sure the coupler is pressed all the way down to ensure a connection.
    1. On the logger, remove the black rubber cap and insert the round end of the Logger into the coupler (can be submerged up to 20m or 66ft), aligning the arrow on the Logger with the arrow on the coupler.
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
    1. Attach the blue coupler to the HOBO Waterproof Shuttle.  Make sure the coupler is pressed all the way down to ensure a connection.
    1. Connect the Waterproof Shuttle to the computer by unscrewing the small cap at the end of the Shuttle (if tight, use a small rod or pencil to insert into the hole and use leverage to turn the cap counterclockwise to loosen), and connect using the USB cable.
    1. On the logger, remove the black rubber cap and insert the round end of the Logger into the coupler, aligning the arrow on the Logger with the arrow on the coupler.
    1. Squeeze and release the black bar on the coupler to the shuttle.
        1. The magnet at the end of the black bar should initialize connection between the Logger and Shuttle.
        1. The Shuttle should show a yellow light at Transfer for a moment then the green light for OK should be visible.
        1. If no lights turn on, push the blue coupler down further on the Shuttle and try again.
    1. Along the bottom of the HOBOware window, the name and/or serial number of the logger should be displayed to indicate a successful connection.
    1. Along the top bar of the HOBOware window, click Device, then Readout.
1. Input the Description name of your data, if different from the Description name used when Launching the logger.  Include the Serial Number in this Description.
1. Select to readout the Low Range and High Range (choose units - uS/cm) and Temperature (choose units - degrees C).
1. Deselect all unecessary Event items (i.e. "Coupler Detached", "Coupler Attached", "Host Connected", "End of File", etc.)
1. If the time zone has changed from deployment, set the GMT time offset for your location.
1. Click Plot
    1. Do not use the Conductivity Assistant - data will be calibrated through R, rather than through HOBOware.
1. Save data log(s)
    1. Click File and Export Table Data.
    1. Include all remaining Measurements (Low Range, High Range, and Temperature), and click Export.
    1. Save file (include Serial Number in filename) as a .csv file in a dated Raw folder in "Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/" (ex. "Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/20201023/Raw/")
1. Run [the HOBO_CT_Readout script](Scripts/HOBO_CT_Readout.R) for calibration and processing of data.
    1. Note: for proper calibration, you will need to have in situ pressure (at depth) data, or input a constant known value for each CT logger.
    1. If you are saving a calibration file separately from your data file, save this file into a folder called Calibration (nested in your dated folder) (ex. "Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/20201023/Calibration/")
    1. Processed data will automatically be saved in the dated folder (ex. "Probe_and_Logger_Protocols/HOBO_CT_Loggers/Data/20201023/") with Serial Number identification

<a name="Maintenance"></a> **Maintenance and Storage**  
1. Remove black rubber caps from loggers, and soak or thoroughly rinse with DI water all instruments that were submerged in salt water, then let dry before storing.
