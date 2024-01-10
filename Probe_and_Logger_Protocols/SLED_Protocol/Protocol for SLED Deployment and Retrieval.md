# Protocol for SLED Deployment and Retrieval
## **Contents**  
- [**Materials**](#materials)  
- [**Deploying The Sled**](#deploying)
	- [**CT HOBO**](#ctd)
	- [**WL HOBO**](#wld)
	- [**pH HOBO**](#phd)
	- [**Lux HOBO**](#luxd)
	- [**miniDOT**](#minidotd)
	- [**miniPAR**](#minipard)  

- [**Retrieving The Sled**](#retrieving)
	- [**CT HOBO**](#ctr)
	- [**WL HOBO**](#wlr)
	- [**pH HOBO**](#phr)
	- [**Lux HOBO**](#luxr)
	- [**miniDOT**](#minidotr)
	- [**miniPAR**](#miniparr)

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

## <a name=deploying></a> **Deploying Instruments for the SLED**
1. When you deploy the SLED, create or modify a ***LAUNCH LOG*** .csv file. This file should include the following columns of information on the loggers that are included on the SLED:

	  - Serial (serial number of logger)
 	  - Log_Type (CT, WL, pendent, temp, pH, miniDOT, or miniPAR)
 	  - time_start (the time you put the SLED out)
 	  - time_end (the time you retrieved the SLED)
  	  - Notes or other information you would like to add

2. Modify the launch log every time you deploy and retrieve the SLED.

-------------
### <a name=ctd></a> **HOBO CT**
------------- 

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in copper tape.

**Launch:**

1. Launch sensor according to [HOBO CT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_CT_Loggers).

2. Replace black rubber cap after launching from computer.

**Calibrate:**

1. Calibrate YSI according to the [protocol for YSI calibration](https://github.com/SilbigerLab/Protocols/blob/master/Probe_and_Logger_Protocols/YSI_2030/YSI2030_Calibration_SOP.md).

2. Calibrate CT Logger according to the "Calibration (Using YSI)" method outlined in the [HOBO CT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_CT_Loggers).

3. Remember to enter information into a **CT calibration log**, as described in the HOBO CT logger protocol.

------------- 
### <a name=wld></a> **HOBO WL**
-------------   

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in copper tape.

**Launch:**

1. Launch sensor according to [HOBO WL logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_Depth_Loggers).
2. Replace black rubber cap after launching from computer.


**Calibrate:**

1. Prior to deployment, place the logger exactly at sea level and record the time and the last three digits of the logger's Serial Number.

2. Let the logger sit at sea level for a few logging intervals to have a stable reading, then record the time the logger is removed from sea level.

3. Allow the instrument to continue logging until deployment. HOBOware will need these calibration points included with the deployment data for processing

------------- 
### <a name=phd></a> **HOBO pH**
-------------   

**Prep:**

1. Make sure the HOBO logger is clean from any prior biofouling and wrapped in protective tape.

**Launch:**

1. Launch sensor using HOBOmobile app according to [HOBO pH Logger](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_pH_Logger) protocol.

**Calibrate:**

1. Follow prompts on HOBOmobile while launching for a 4, 7, 10 calibration.

2. Follow instructions from [HOBO pH Logger](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_pH_Logger) protocol for a tris calibration.

------------- 
### <a name=luxd></a> **HOBO Lux Pendents**
------------- 

**Prep:**

1. No prep needed

**Launch:**

1. Push button to connect to HOBOmobile app and follow prompts to launch.

2. Make sure that the sampling is set to occur on the exact minute (not offset to collect at every minute and couple of seconds).

**Calibrate:**

1. None needed.

-------------

### <a name=minidotd></a> **miniDOT**
-------------   

**Prep:**

1. Replace AA batteries. 

**Launch:**

1. Follow deployment procedure from the [miniDOT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/miniDOT_Oxygen_Sensor).

**Calibrate:**

1. Place miniDOT into a dark bucket for 24 hours with bubbler and water (100% Oxygen saturation). This should be done either once before or once after deployment. Follow the "Calibration" section from the [miniDOT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/miniDOT_Oxygen_Sensor).

-------------

### <a name=minipard></a> **miniPAR**
-------------   
**Prep:**

1. Replace AA batteries. 

**Launch:**

1. Follow deployment procedure from the [miniPAR logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/LI-COR_PAR_Sensor_Manual).

**Calibrate:**

1. None. The miniPAR is factory calibrated - may need to check to see if maintenance is needed.



## <a name=retrieving></a> **After Retrieving the SLED**

1. Modify your launch log with SLED retrieval times.

-------------
### <a name=ctr></a> **HOBO CT**
------------- 

1. Do a second calibration following the "Calibration (Using YSI)" method in the [HOBO CT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_CT_Loggers).
	- Remember to enter information into your **CT calibration log**

3. Follow the data retrieval (in situ or ex situ) and maintenance / storage instructions from the HOBO CT logger protocol.


------------- 
### <a name=wlr></a> **HOBO WL**
-------------   

1. Follow the data retrieval (in situ or ex situ) and maintenance / storage instructions from the [HOBO WL logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_Depth_Loggers).

------------- 
### <a name=phd></a> **HOBO pH**
-------------   

1. If pH probe was not tris calibrated before deployment, follow [HOBO pH logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/HOBO_pH_Logger) for calibration procedure.

2. Follow the data retrieval (in situ or ex situ) and maintenance / storage insrtuctions from the HOBO pH logger protocol.

------------- 
### <a name=luxd></a> **HOBO Lux Pendents**
------------- 

1. Connect to HOBOmobile app and follow prompts to stop recording and download data.

-------------

### <a name=minidotd></a> **miniDOT**
-------------   

1. If miniDOT was not calibrated before deployment, follow [miniDOT logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/miniDOT_Oxygen_Sensor) for calibration procedure.

2. Follow the data retrieval and maintenance / storage instructions from the miniDOT logger protocol.


-------------

### <a name=minipard></a> **miniPAR**
-------------   

1. Follow the data retrieval and maintenance / storage instructions from the [miniPAR logger protocol](https://github.com/SilbigerLab/Protocols/tree/master/Probe_and_Logger_Protocols/LI-COR_PAR_Sensor_Manual).