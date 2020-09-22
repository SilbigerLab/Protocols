# LI-COR miniPAR Underwater Quantum Sensor Manual and SOP

## Manuals  

* [LI-COR miniPAR Logger SOP](miniPAR_Logger_SOP.md)
* [Instrument Information](https://github.com/SilbigerLab/Protocols/blob/master/References_and_Manuals/LI-COR_PAR_Sensor_Manual/System_Information.md)
* [miniPAR Manual PDF](https://github.com/SilbigerLab/Protocols/blob/master/References_and_Manuals/LI-COR_PAR_Sensor_Manual/PME_miniPAR_Manual.pdf)
* [LI-COR Underwater Radiation Sensors Instruction Manual PDF](https://github.com/SilbigerLab/Protocols/blob/master/References_and_Manuals/LI-COR_PAR_Sensor_Manual/Sensors_Manual_LI-192.pdf)

## Standard Operating Procedure  

**Protocol for the calibration, use, and maintenance of the PME miniPAR logger**

**Contents**  
- [**Materials**](#Materials)  
- [**Calibration**](#Calibration)  
- [**Deployment**](#Deployment)
- [**Data Retrieval**](#Data_Retrieval)
- [**Maintenance and Storage**](#Matinenance)

<a name="Materials"></a> **Materials**  
* miniPAR logger
* USB connection cable
* silicone o-ring lubricant

<a name="Calibration"></a> **Calibration**  
1. Calibration Constant and Calibration Multiplier
    1. During factory calibration, sensor output (in microamps) is measured while the sensor is exposed to a standard lamp of known intensity.   The sensor output at this intensity has general units of microamps per radiation unit and is called the **Calibration Constant (Calconstant)**.  Each sensor has a slightly different output at a given radiation intensity and will therefore have a unique Calconstant (found in [System Information](#System_Information.md)).
    1. LI-COR Light Meters and dataloggers measure the current output of the sensor in units of microamps, and convert the measured current to units of radiation.  To make this conversion, LI-COR instruments use the sensor **Calibration Multiplier**, which is the negative reciprocal of the Calconstant (also found in [System Information](#System_Information.md)).
    1. The in-water multiplier includes an immersion effect correction on the calibration certificate.

<a name="Deployment"></a> **Deployment**  
1. Opening and Closing the miniPAR Logger
    1. The miniPAR Logger’s circuitry is contained in a waterproof housing that must be opened.
    1. Unscrewing the white pressure housing from the black end cap opens the miniPAR Logger. This is similar to opening a flashlight.
    1. Turn the white pressure housing counter-clockwise relative to the black end cap. Close the miniPAR Logger by reversing this procedure after being sure that the o-ring is free from debris. Lubricate the o-ring occasionally with silicone oil intended for buna-N o-ring material.
    1. When closing the miniPAR Logger, inspect the o-ring and the interior of the white pressure housing for debris. 
    1. Lubricate the o-ring, and screw the white pressure housing onto the black end cap until the white pressure housing just touches the black end cap. Do not tighten! The miniPAR Logger tends to get a little tighter during deployment.
    1. If you cannot open the miniPAR Logger by yourself, then find another person with strong hands. This person should grip the black end cap while the other person turns the white pressure housing.
1. Begin Logging
    1. Open the logger and remove the circuitry from the white housing.
    1. Careful not to touch the gold perimeter, insert two AA batteries in the battery pack.
    1. Once the device has powered on, plug one end of the USB connection cable to the logger and the other end into the computer.
    1. Open the NO NAME drive and double click the miniPARControl.jar program, which allows you to see the state of the miniPAR Logger as well as set the recording interval.
    1. The logger will sync to your computer's local time.
    1. Set the recording interval and check battery voltage.
    1. Eject the NO NAME drive.
    1. When you a ready to begin recording, flip the switch from "Halt" to "Record".
    1. Carefully insert the circuitry back into its housing and seal the logger for deployment.
    1. Remove the red sensor cap right before deployment.

<a name="Data_Retrieval"></a> **Data_Retrieval**  
1. Accessing data
    1. Make sure the sensor head is cleaned and protected by the red cap.
    1. Unscrew the white housing from the logger at the black base, turning the white housing counterclockwise relative to the black base.
    1. If you were recording data, flip the switch from "Record" to "Halt" on the logger.
    1. Plug in the USB cable to a computer and the end of the logger.
    1. Open the new NO NAME drive on the computer.
    1. Available on the SD card on the logger (accessible on Windows and some Mac OS):
        1. miniPARControl.jar program allows you to see the state of the miniPAR Logger as well as set the recording interval.
        1. miniPARPlot.jar program allows you to see the plots of the recorded measurements.
        1. miniPARConcatenate.jar program gathers all the daily files into one CAT.txt file.
        1. Manual.pdf is the manual.
    1. When offloading data, first use miniPARPlot.jar to create a data stamped .txt file.  Then use miniPARConcatenate.jar to concatenate the data into a second .txt file.
    1. Once both files have saved into /NO NAME/7530-428102 create a new dated folder for these files within /NO NAME/7530-428102.
    1. Right click each file to "Open With: Excel" and save each file as a .csv file in your desired data drive location (on your computer, not in the logger's folder).
    1. Once you're done using the logger, right click the NO NAME drive on your computer to Eject the drive.  Once ejected, you may disconnect the logger, remove the batteries, and safely store the circuitry back in the white housing. 
    
<a name="Maintenance"></a> **Maintenance and Storage**  
1. Keeping the sensor clean to maintain accuracy of readings
    1. To maintain appropriate cosine correction the vertical edge of the diffuser must be kept clean. Periodically inspect the sensor for foreign deposits on the upper surfaces during prolonged submerged operation.
    1. DO NOT use alcohol, organic solvents, abrasives, or strong detergents to clean the diffusor element on LI-COR light sensors.
    1. The acrylic material used in LI-COR light sensors can be crazed by exposure to alcohol or organic solvents, which will adversely affect the cosine response of the sensor.
    1. Clean the sensor **only with water** (deionized "DI" water) and/or a mild detergent such as dishwashing soap. LI-COR has found that vinegar can also be used to remove hard water deposits from the diffusor element, if necessary.
    1. Keep the sensors clean and treat them as a scientific instrument in order to maintain the accuracy of the calibration. The vertical edge of the LI-192 diffuser must be kept clean in order to maintain appropriate cosine correction. 
    
* For a full users guide for the PME miniPAR Logger, read the [PME miniPAR Manual](#PME_miniPAR_Manual.pdf)
* For instrument specifications and maintenance instructions, read the [Sensor Manual](Sensor_Manual_LI-192.pdf)