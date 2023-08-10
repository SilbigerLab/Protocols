---
editor_options: 
  markdown: 
    wrap: sentence
---

# Protocol for the calibration, use, and maintenance of the PME miniDOT Oxygen loggers

**Contents**\
- [**Materials**](#Materials)\
- [**Calibration**](#Calibration)\
- [**Deployment**](#Deployment) - [**Data Retrieval**](#Data_Retrieval) - [**Maintenance and Storage**](#Matinenance)

<a name="Materials"></a> **Materials**\
\* miniDOT logger \* USB connection cable \* silicone o-ring lubricant \* screwdriver \* anti-fouling plate \* three anti-fouling plate screws

<a name="Calibration"></a> **Calibration**\
1.
Calibrate the miniDOT loggers overnight to 24 hours before deployment.
1.
Follow the [Deployment](#Deployment) steps below to launch the miniDOT loggers before calibration.
1.
Fill a black bucket with fresh water and use a bubbler and air stone to continuously aerate the water to oxygen saturation.
1.
Fully submerge the miniDOT loggers, making sure to keep the white end down and the sensor face pointing upward.
1.
Make sure the black rubber sensor caps are removed before submersion.
1.
The sensor face is top-heavy compared to the white end and will try to flip over.
Prevent this with some weight or by tying the white end down at the bottom of the bucket.
1.
Place a dive slate or some other object between the air stone and the miniDOT loggers to avoid bubbles from the air stone accumulating on the sensor faces of the loggers.
1.
Cover the bucket with a black lid and leave overnight to 24 hours.

<a name="Deployment"></a> **Deployment**\
1.
Opening and Closing the miniDOT Logger 1.
The miniDOT Logger's circuitry is contained in a waterproof housing that must be opened.
1.
Unscrewing the white pressure housing from the black end cap opens the miniPAR Logger.
This is similar to opening a flashlight.
1.
Turn the white pressure housing counter-clockwise relative to the black end cap.
Close the miniDOT Logger by reversing this procedure after being sure that the o-ring is free from debris.
Lubricate the o-ring occasionally with silicone oil intended for buna-N o-ring material.
1.
When closing the miniDOT Logger, inspect the o-ring and the interior of the white pressure housing for debris.
1.
Lubricate the o-ring, and screw the white pressure housing onto the black end cap until the white pressure housing just touches the black end cap.
Do not tighten!
The miniDOT Logger tends to get a little tighter during deployment.
1.
If you cannot open the miniDOT Logger by yourself, then find another person with strong hands.
This person should grip the black end cap while the other person turns the white pressure housing.
1.
Begin Logging 1.
Open the logger and remove the circuitry from the white housing.
1.
Careful not to touch the gold perimeter, insert two AA batteries in the battery pack.
1.
Once the device has powered on, plug one end of the USB connection cable to the logger and the other end into the computer.
1.
Open the NO NAME drive and double click the miniDOTControl.jar program, which allows you to see the state of the miniDOT Logger as well as set the recording interval.
1.
The logger will sync to your computer's local time.
1.
Set the recording interval and check battery voltage.
1.
Eject the NO NAME drive.
1.
When you a ready to begin recording, flip the switch from "Halt" to "Record".
1.
Carefully insert the circuitry back into its housing and seal the logger for deployment.
1.
Anti-fouling plate 1.
Remove the black rubber sensor cap.
1.
Using a screwdriver, you will unscrew every other screw on the sensor face of the miniDOT (total = 3 screws taken out).
1.
Relieve the pressure of these screws slowly, only doing one turn of the screwdriver before moving to the next screw until all three are loose enough to twist out easily.
1.
Align the anit-fouling plate on the sensor face such that the sensor is not covered, and use three screws from the same bag as the anti-fouling plate to screw the plate onto the sensor face.
Only screw them in finger-tight.

<a name="Data_Retrieval"></a> **Data_Retrieval**\
1.
Accessing data 1.
Make sure the sensor head is cleaned and protected by the red cap.
1.
Unscrew the white housing from the logger at the black base, turning the white housing counterclockwise relative to the black base.
1.
If you were recording data, flip the switch from "Record" to "Halt" on the logger.
1.
Plug in the USB cable to a computer and the end of the logger.
1.
Open the new NO NAME drive on the computer.
1.
Available on the SD card on the logger (accessible on Windows and some Mac OS): 1.
miniDOTControl.jar program allows you to see the state of the miniDOT Logger as well as set the recording interval.
1.
miniDOTPlot.jar program allows you to see the plots of the recorded measurements.
1.
miniDOTConcatenate.jar program gathers all the daily files into one CAT.txt file.
1.
Manual.pdf is the manual.
1.
When offloading data, first use miniDOTPlot.jar to create a data stamped .txt file.
Then use miniPARConcatenate.jar to concatenate the data into a second .txt file.
1.
Once both files have saved into /NO NAME/(serial#) create a new dated folder for these files within /NO NAME/(serial#).
1.
Right click each file to "Open With: Excel" and save each file as a .csv file in your desired data drive location (on your computer, not in the logger's folder).
1.
Once you're done using the logger, right click the NO NAME drive on your computer to Eject the drive.
Once ejected, you may disconnect the logger, remove the batteries, and safely store the circuitry back in the white housing.

<a name="Maintenance"></a> **Maintenance and Storage**\
1.
Remove the anti-fouling plate by unscrewing the three inserted screws, again moving slowly - one rotation of each screw before moving on to the next screw until pressure is released.
1.
Rinse the sensor face and the anti-fouling plate and screws with DI water.
1.
Once the sensor face has dried, reinsert the original flat screws to the sensor head.
1.
Store with the balck rubber cap over the sensor head.
