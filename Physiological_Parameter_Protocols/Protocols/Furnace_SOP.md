# Standard Protocol for the ThermoFisher Box Furnace

Original: 20190530  
Last Revised: 20190530  

Contents  
- [**Product Information**](#Product_Info)
- [**Furnace Materials**](#Furnace_Materials)
- [**Personal Protective Equipment**](#PPE)
- [**Startup Protocol**](#Startup_Protocol)
- [**Single Setpoint Mode**](#Single_Mode)
- [**Programming Mode**](#Programming_Mode)
- [**Ashing Guidelines**](#Ashing)
- [**References**](#References)
 
<a name="Product_Info"></a> **Product Information**  
  * Model: Lindberg/Blue M Moldatherm
  * Model Number: BF51866C-1
  * Serial Number: 264040011905
  * Model Name: Box Furnace
  * Temperature Range: 1,100 Celcius

<a name="Furnace_Materials"></a> **Furnace Materials**  
  * Vent Plug (S/N: 7221-2063-00A)
  * USB Manual (S/N: 329437G01)
  * Hearth Plate (S/N: 7011-2022-00C)
  * Gas Inlet Tube (S/N: 300253G02), installed 5.30.19
  * Tongs

<a name="PPE"></a> **PPE and Precautions**  
PPE  
 * Safety goggles
 * Gloves
 * Loose fitting full body clothing
 
Precautions   
 * Never stand in front of an open furnace
 * Do not allow the laod to touch the furnace walls
 * Use tongs to insert and remove furnace load
 
<a name="Startup_Protocol"></a> **Startup Protocol**  
1. Adjust the vent plug
    1. For most applications, the exhaust vent should be fully plugged during operation of the furnace; a closed vent results in more efficient operation and greater temperature stability.
    1. The exhaust vent should be partially or fully open to (a) provide slow cool down of work load (some work loads may be damanged by heat shock when the furnace door is opened), or (b) remove unwanted vapors and gases from the furnace chamber.
1. Insert hearth plate to provide a load bearing surface and distribute the weight of product being heated, and to allow heat from the chamber floor to circulate into the chamber center.
1. Check the door seal
    1. The furnace has a power interrupt switch. Opening the furnace door shuts off power to the heating unit. The door must be completely closed before the furnace will operate.
1. Turn furnace ON using the switch.

<a name="Single_Mode"></a> **Single Setpoint Mode**

Single Setpoint Mode allows the user to select a single target temperature setpoint in the controller. The controller will operate the heating equipment until this setpoint value is achieved, then maintain this setpoint indefinitely.  Use this mode when you only need to run the furnace with a specific setpoint and do not require a programmed sequence of steps - Or a Temperature ramp change over a period of time.

1. Setting the High Temperature Alarm Setpoint
    1. Press and HOLD for three seconds the "SET/ENT" button to display "modE rES".
    1. Press and release the "SET/ENT" button to display "PrG 0"
    1. Press the "UP/RESET" Button to show the lower display value of "1".
    1. Press and release the “SET/ENT” button to select this new value and advance to the "SSP 25" display.
    1. Press and release the “SET/ENT” button until the High Temperature Alarm Setpoint value is displayed as "A1".
    1. Select an alarm setpoint 10 °C above the target setpoint to be selected.
    1. Press and release the “SET/ENT” button to place this new value in the controller memory.
    1. Press and HOLD for three seconds the “SET/ENT” button to exit this menu.
1. Accessing Local Mode and Setting the Local Setpoint
    1. Make sure the indicators beside "RUN" and "L" on the controller face are off. If either indicator is on, press and hold the “SET/ENT” button until the display shows “modE”. Select “rES” in the lower display with the "arrow" buttons. Press and release the “SET/ENT” button once.
    1. Press and release "SET/ENT" until "LoC" is displayed. Make sure the value below "LoC" is "0" (zero). If it is not "0" use the "down arrow" to make "0" and press and release "SET/ENT” button to register the change to "0".
    1. Press and release the "SET/ENT" button until "modE" is displayed.
    1. At "modE" display, press the "UP" arrow button to make the lower value "LCL", Press and release the “SET/ENT” button once to enter the local mode. This selection causes the red indicator to illuminate beside "L" on the control panel.
    1. Use the "UP" and "DOWN" buttons to select the operating temperature setpoint.
    1. Press and release the “SET/ENT" button once to select this setpoint value. This will show the display with the measured temperature in the upper display, the lower display showing the present temperature setpoint.
    1. This display and the buttons will remain active as long power continues to the control module. Power interruptions will cause the controller to enter reset or standby mode in which no actions are made to operate the heating equipment.
1. Exiting Local Mode (turning off energy to the heater)
    1. Press and hold for three seconds the "SET/ENT" button to display "modE LCL".
    1. Press and release the "DOWN" button twice to select the display "modE rES".
    1. Press and release the "SET/ENT" button once to select the display "modE rES". Reset Mode.
    1. This selection causes the red indicator to extinguish beside the display label "L" that had indicated the Local Mode.
    1. This will change the display showing the measured temperature in the upper display, with the lower display showing the Start Set Point (SSP) temperature setpoint of the program (default: 25).


<a name="Programming_Mode"></a> **Programming Mode**

Programming Mode allows the user to enter a series of setpoint and time values.The controller will follow these sequences of instructions to energize the heating equipment until the entire sequence is complete.

1. Accessing the Programming Menu
    1. Assure the indicators beside "RUN" and "L" on the controller display are off. If either indicator is illuminated, press and hold the "SET/ENT" button until the display shows "modE". 
    2. Select “rES" in the lower display with the "arrow" buttons. Press and release the “SET/ENT” button once.
    3. Press the "SET/ENT" button for 3 seconds to display "modE" in the upper display and "rES" (Reset) in the lower display.
    4. Press and release “SET/ENT” until "LoC" is displayed. Make sure the display below "LoC" is "0" (zero). If it is not "0", use “DOWN ARROW” to select ''0'' and press and release "SET/ENT” button to register the change to "0".
    5. Press and release the "SET/ENT" button until "PrG" is displayed.
    6. At "PrG" display, press the “UP ARROW” to make the lower display "1".
    7. Press and release the "SET/ENT" button once to enter the programming menu.
1. Entering Program Parameters
    1. The first display is the Start Set Point parameter, shown as "SSP" in the upper display. The value assigned to SSP is usually the current room temperature, 25 °C.
    1. If the value is not 25, use the arrow buttons to select "25" (or your desired start set point parameter) in the below "SSP" display, then press and release the "SET/ENT" button twice to enter this new value for "SSP", then press and release the "SET/ENT" button once to advance to the "StC" display.
    1. Next is the Start Code parameter, shown as "StC" in the upper display. The value assigned to StC is usually "1". This will instruct the program to start with the current measured temperature. Press the "SET/ENT" button to advance to next display.
    1. The next parameter, “SP1”, is the first setpoint value that is desired in the chamber and is considered a ramp segment. Select this target temperature setpoint value with arrow button then press and release the "SET/ENT" button twice to enter this value and to advance to the "tM1" display. If the value for "SP1" is correct and will not be changed, press and release the “SET/ENT” button once to advance to the "tM1” display.
    1. The next parameter, "tM1", represents the first time period for the unit to reach the target temperature setpoint selected in "SP1". This selection can be a value ranging from 0.00 to 99.59, which represents hours and minutes. Select this time value with the arrow buttons and enter it by pressing and releasing the "SET/ENT" button twice.
    1. Press and release the "SET/ENT" button to advance to the next display of "SP2", this is considered the dwell segment. Select the same target setpoint temperature value as "SP1" with the arrow buttons. Press and release the "SET/ENT" button twice to enter this value and to advance to next display.
    1. The next parameter, "tM2", represents the second time period used to maintain or dwell at the target setpoint selected in "SP2". This selection can be a value ranging from 0.00 to 99.59, which represents hours and minutes, enter by pressing and releasing the "SET/ENT" button twice.
    1. Next, "SP3" is the third setpoint value desires in the chamber. Select this target temperature setpoint with the arrow buttons and press and release the "SET/ENT" button twice to enter this value and release the "SET/ENT" button twice to enter this value and advance to the "tM3" display. If this value is correct and not changed, press and release the "SET/ENT" button once to advance to the "tM3" display.
    1. "tM3" represents the third time period for the unit to reach the target setpoint selected in "SP3". This selection can be a value ranging from 0.00 to 99.59, which represents hours and minutes. Select this value with the arrow buttons and enter it by pressing and releasing the "SET/ENT" button.
    1. The next parameter, "SP4" is considered the dwell segment. Select the same target temperature as "SP3" with the arrow buttons, then press and release the "SET/ENT" buttons twice to enter this new value and to advance to next display.
    1. The next parameter, "tM4": Select “oFF” with the arrow buttons, then press and release the "SET/ENT" button twice to enter this new value and to advance to next display. This operation ends the offering of setpoint and time parameters.
1. Additional Program Parameters
    1. The next display shows "EV1" in the upper display. The lower value should always be "0" (zero). Press and release the "SET/ENT" button once to go to next display.
    1.  “AL1" should always have a lower value "9". Press and release the "SET/ENT" button once to advance to the next display.
    1. The next parameter, "A1", is used to select the high temperature alarm trip setpoint.  Use the arrow buttons to select a value 10 °C (or 20 °F) higher than the highest target setpoint to be used. Select the High Temperature Alarm value with the arrow buttons then press and release the “SET/ENT” button twice to enter this new value and to advance to the "HY1" display. If the value for "A1" is correct and not changed, press and release the “SET/ENT” button once to advance to "HY1" display.
    1. "HY1" is used to select the amount of temperature change below the high temperature alarm relay will reset, this value is usually "1". Select "1" with the arrow buttons and press the "SET/ENT" button four times to enter the correct value and advance to the "JC" display. Or if the value is correct, press the "SET/ENT" button three times to advance to the "JC" display.
    1. For the parameter displayed as "JC", select “1” with the arrow buttons, then press and release the "SET/ENT" button twice to display "WTZ", Selecting the value of "1" will cause the program to hold the setpoint at this last segment. A value of "0" would cause the program to reset and stop running the program and stop the power to the heaters. A value of "2" will cause the program to repeat "continuously". A value of “3" will cause the controller to maintain temperature at the local (single) setpoint value.
    1. When the display shows "WTZ", select a lower display value of "oFF” with the "arrow" buttons. Press and HOLD the "SET/ENT" button for 3 seconds to return to the Reset or standby display.
1. Running a Program
    1. To run a program such as the one outlined above, press and hold the "DOWN/RUN" button making the "RUN" indicator illuminate. At the end of this program the "HLD" (hold) indicator is illuminated to indicate this program is in the indefinite dwell at the last target temperature. This hold indicator is caused by the "JC" selection of "1", while the "JC" selections of “0”, "2" or "3" will not illuminate the "HLD" (hold) indicator.
1. Ending a Program
    1. To end a program while in the "RUN" or "HLD" (hold) mode, press and hold the "UP/RESET" button to turn off the current program and extinguish the "RUN" or "HLD" indicator.
    1. Turning off the unit's power will also stop the program. When power is restored, the controller is in the Reset or standby mode with no power to the heaters.


<a name="Ashing"></a> **Ashing Guidelines**  
 * Ashing at relatively low furnace temperatures (400 ° to 800 °C) may cause carbon residue to build up on the walls, floor, ceiling and heating elements inside the furnace chamber. The carbon will look like a black powder, similar to smoke on glass from a candle.
 * The best way remove carbon residue from the chamber and elements surfaces is to operate the empty furnace at a chamber temperature above 900 °C for one hour. Do this regularly, whenever the chamber interior shows signs of carbon residue.
 * **Do not scrub** or scrape the chamber surfaces - this may damange the heating elements and the insulation.
 
<a name="References"></a> **References**

* System Information can be found in [References and Manuals](https://github.com/SilbigerLab/Protocols/blob/master/References_and_Manuals/BF51800_Box_Furnace_Manual/System_Information.md)
* Information in this guide and supplemental information about the Box Furnace and its operation and maintenance can be found in the [BF51800 Series Manual](https://github.com/SilbigerLab/Protocols/blob/master/References_and_Manuals/BF51800_Box_Furnace_Manual/BF51800_Series_Manual.pdf)
