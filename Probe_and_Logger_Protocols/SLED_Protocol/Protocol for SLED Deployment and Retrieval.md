# Protocol for SLED Deployment and Retrieval
## **Contents**  
- [**Materials**](#materials)  
- [**Deploying The Sled**](#deploying)
	- [**CT HOBO**](#ct)
	- [**WL HOBO**](#wl)
	- [**pH HOBO**](#ph)
	- [**Lux HOBO**](#lux)
	- [**miniDOT**](#minidot)
	- [**miniPAR**](#minipar)  

- [**Retrieving The Sled**](#Deploying)
	- [**CT HOBO**](#hobo-ct)
	- [**WL HOBO**](#hobo-wl)
	- [**pH HOBO**](#hobo-ph)
	- [**Lux HOBO**](#hobo-lux-pendents)
	- [**miniDOT**](#minidot)
	- [**miniPAR**](#minipar)

## <a name="materials"></a> **Materials**

1. Software:
	- HOBOware software installed on computer
	- HOBOmobile app installed on phone or tablet

2. Loggers:
	- 1 HOBO Conductivity and Temperature Logger (U24-002-C)
	- 1 HOBO Water Level Data Logger (U20-001)
	- 1 HOBO pH Logger (MX2501)
	- 2 HOBO Lux Pendent Loggers
	- 1 Li-COR miniPAR Logger
	- 1 PME miniDOT Oxygen Logger

3. Data Transfer Components for HOBO Shuttle & miniDOT/PAR
	- HOBO Waterproof Shuttle
	- USB-HOBO Shuttle connector cable
	- White coupler for HOBO WL logger connection to shuttle	
	- Blue coupler for HOBO CT Logger connection to shuttle
	- Black chord with red tips for miniDOT and miniPAR
	- USB -> USB-C converter (if using a mac)

4. Other
	- 4, 7, 10 buffer
	- Tris
	- YSI Pro2030 multiparameter prometer
	- YSI 3169 Conductivity Calibrator solution (50,000 microsiemens/cm +/- 1% at 25 ° C
	- SLED
	- Zip ties
	- Screwdriver
	- At least 4 AA batteries
	- Anti-fouling plates for miniDOT
	- DI water

## <a name=deploying></a> **Deploying the SLED**
Remember to record the following information in a ***LAUNCH LOG*** .csv file with the following columns:
  
  - Serial (serial number of logger)
  - Log_Type (CT, WL, pendent, temp, pH, miniDOT, or miniPAR)
  - time_start (the time you put the SLED out)
  - time_end (the time you retrieved the SLED)
  - Notes or other information you would like to add


-------------
### <a name=ct></a> **HOBO CT**
------------- 

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in copper tape

**Launch:**

1. Launch sensor according to [HOBO CT Logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_CT_Loggers)
2. Replace black rubber cap after launching from computer

**Calibrate:**

1. Calibrate YSI according to the [Standard protocol for YSI multi-parameter prometer calibration](https://github.com/SilbigerLab/Protocols/blob/master/Probe_and_Logger_Protocols/YSI_2030/YSI2030_Calibration_SOP.md)
2. Calibrate CT Logger according to the "Calibration (Using YSI)" method in the [HOBO CT Logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_CT_Loggers)
2. Remember to enter information into a CT calibration log, as described in the HOBO CT logger protocol

------------- 
### <a name=wl></a> **HOBO WL**
-------------   

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in copper tape

**Launch:**

1. Launch sensor according to [HOBO WL Logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_Depth_Loggers)
2. Replace black rubber cap after launching from computer


**Calibrate:**

1. Prior to deployment, place the logger exactly at sea level and record the time and the last three digits of the logger's Serial Number.
2. Let the logger sit at sea level for a few logging intervals to have a stable reading, then record the time the logger is removed from sea level.
3. Allow the instrument to continue logging until deployment. HOBOware will need these calibration points included with the deployment data for processing

------------- 
### <a name=ph></a> **HOBO pH**
-------------   

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in protective tape

**Launch:**

1. Launch sensor using HOBOmobile app according to [HOBO pH Logger](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_pH_Logger) protocol

**Calibrate:**

1. Follow prompts on HOBOmobile while launching for a 4, 7, 10 calibration
2. Follow instructions from [HOBO pH Logger](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_pH_Logger) protocol for a tris calibration

------------- 
### <a name=lux></a> **HOBO Lux Pendents**
------------- 

**Prep:**

1. No prep needed

**Launch:**

1. Push button to connect to HOBOmobile app and follow prompts to launch
2. Make sure that the sampling is set to occur on the exact minute (not offset to collect at every minute and couple of seconds)

**Calibrate:**

1. None needed

-------------

### <a name=minidot></a> **miniDOT**
-------------   

**Prep:**

1. Replace AA batteries 

**Launch:**

1. Follow deployment procedure from the [miniDOT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/miniDOT_Oxygen_Sensor)

**Calibrate:**

1. Place miniDOT into a dark bucket for 24 hours with bubbler and water (100% Oxygen saturation). This should be done either once before or once after deployment. Follow the "Calibration" section from the [miniDOT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/miniDOT_Oxygen_Sensor)

-------------

### <a name=minipar></a> **miniPAR**
-------------   
**Prep:**

1. Replace AA batteries 

**Launch:**

1. Follow deployment procedure from the [miniPAR logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/LI-COR_PAR_Sensor_Manual)

**Calibrate:**

1. None. The miniPAR is factory calibrated - may need to check to see if maintenance is needed


------------
------------
-----------------

## <a name=Retrieving the SLED></a> **Retrieving the SLED**
