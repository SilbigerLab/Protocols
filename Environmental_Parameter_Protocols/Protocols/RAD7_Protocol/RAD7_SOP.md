# Standard protocol for setup and use of the Durridge RAD7 Radon Detector
Original: 20200330
Last Revised: 20200330

**Contents**  
- [**Materials**](#Materials)  
- [**Safety Procedures**](#Safety)  
- [**Set Up Procedure**](#Set_up)  
- [**Sampling Protocol**](#Sampling_Protocol)  
- [**Stop and Breakdown**](#Breakdown)  
- [**References**](#References)  

<a name="Materials"></a> **Materials**  

* RAD7 Materials
  * Radon Detector in protective carrying case
  * 12V adaptor (with 4 international plugs)
  * Gas drying unit
  * Tool for opening drying unit
  * Desiccant
  * RAD7 inlet filter
  * Vinyl tubing x3
    * From sample to drying tube (one 1/8" end and one 3/16" end)
    * From drying tube to RAD7 inlet (one 1/8" end and one 3/16" end)
    * From RAD7 outlet to exhaust (two 1/8" ends)
  * USB to serial adaptor cable (with cable documentation and software driver CD)
  * RAD7 Documntation Binder (with User's Manual and additional documentation)
* RAD Aqua Materials
  * White trivet with two outflow hose-connection ports
  * Head assembly with in-flow/out-flow tubing and temperature probe port
  * Metal rod (double-ended male fitting) and thumbscrew cap
  * Clear cylinder
  * Temperature probe with connection cable
  * Omega El-USB-TC Temperature Data Logger with Battery (1/2 AA 3.6V)
  * Boat battery and charger
  * Bilge pump with hose for connection to the RAD Aqua and with terminal clips or rings for connection ot the boat battery

<a name="Safety"></a> **Safety Procedures**  

* DO NOT spill any liquids onto the RAD7 electrical detector.  This machine is highly sensitive to water and other liquids.
* DO NOT expose the operating panel of the RAD7 electrical detector to rain or any other excess moisture.
  * For use in a harsh environment, provide some protection for the RAD7, even as simple as a plastic bag to enclose the electrical detector.
* DO NOT allow liquid to be sucked into inlet tube.
  * If liquid does get into the machine, please disconnect the power cord (if connected), turn off the power switch, and follow the instructions in Chapter 4.8.1 in the [Manual](Protocols/RAD7_Protocol/RAD7_Manual.pdf), Harsh and Hazardous Environments: Splashing Water. It will be necessary to return the RAD7 to DURRIDGE for repair. 
* DO NOT open or attempt to repair the machine. The detector has an internal high voltage supply that can generate more than 2,500V. 
* DO NOT allow liquid to enter the drying tube.  The desiccant will be ruined and in need of replacing if submerged or exposed to liquids.

<a name="Set_up"></a> **Set Up Procedure**  

Before field deployment  
* Necessary in-lab steps before deploying, though you may set up other components of the RAD Aqua and RAD7 if applicable.  
1. Charge the RAD7 and boat battery overnight before deployment.
    1. For the RAD7, choose the appropriate international 12V adapter and plug one end into the DC Power Input on the RAD7 and the other end into your outlet (refer to Figure 1 for an overlook of the RAD7).
1. Insert the 1/2 AA battery into the Omega El-USB-TC Temperature Data Logger and insert the USB into a computer with the EasyLog USB softward downloaded
    1. Download software [here](https://www.lascarelectronics.com/software/easylog-software/easylog-usb) if not already installed.  You may need to consult your local IT department if the software will not install.
1. Open EasyLog USB and set the temperature logging interval and units.
1. Eject the Omega El-USB-TC from the computer and place in a safe splash-proof case for deployment in the field.
1. Check that the desiccant in the drying unit is all blue (dry/dehydrated).  If the desiccant is pink (hydrated), then replace this desiccant and put the hydrated desiccant in a drying oven for future use.
    1. Note that if desiccant has been used and dried, it may loose its color indicator properties when shifting from dehydrated to hydrated, so you will have to be mindful of replacing or drying desiccant after use to ensure it is dehydrated for the next deployment.
1. Set up the RAD7
    1. Turn on the RAD7 and wait for the LCD screen to stabilize after the initial startup screen.
    1. Press Menu on the key pad to get to menu options, use the left and right arrows to switch between items in that menu list, and press Enter to select an item or open another list of menu options.
    1. To set up the sampling cycle: Menu > -> > "Setup" > Enter > "Cycle" > -> > Enter > use <- and -> to change the time between samples (Hour:Minutes) > Enter
        1. Set the Cycle time to 6 minutes or 00:06 for spatial surveys
        1. Set the Cycle time to 20-30 minutes or 00:20 - 00:30 for temporal surveys
    1. Turn RAD7 off until ready for deployment.

RAD Aqua Set Up  
* For a visual of the final set up for the RAD Aqua, refer to the schematic in Figure 2.  
1. Screw one end of the metal rod into the middle of the white trivet base of the RAD Aqua.
1. Place the clear cylinder around the metal rod in the grooves of the trivet.
1. Insert the head assembly on top of the cylinder so that the metal rod peaks through the center of the head assembly and sinch down the head assembly to the cylinder and trivet by screwing on the thumbscrew, finger-tight.  Do not overtighten.
1. Unscrew the cap of one of the outflow hose-connection ports on the trivet to allow water to flow out.
    1. Optional: connect a hose to one of these ports to guide the water away from the system.

Hose and Pump Connections  
* For proper hose connections, follow the schematic in Figure 2.  
1. Place the RAD7 on a clean, dry surface inside some sort of protection to avoid any harsh environment or liquids.
    1. Possible protective measures include a storage bin and/or a clear plastic bag, which has its opening bunched around the inlet and outlet tubes to allow for readings and access to the control panel. 
1. Connect the Outlet of the RAD7 to the red check valve connected ot the head assembly.
1. Remove the yellow sleeves from the tubing ports on the drying unit.
1. Connect the outflow on the head assembly to the drying unit's upper tubing port (at the screw cap end).
1. Connect the lower tubing port on the drying unit to the RAD7 using the tubing with an inlet filter attached (or adding an inlet filter to the tubing before connecting to the RAD7 if one is not already attached).
1. Remove the temperature probe from it's protective case and insert gently into the remaining open port on the head assembly.  Use a little petroleum jelly if needed to slide it into position.
1. Connect the Omega El-USB-TC Temperature Data Logger to the other end of the temperature probe's cable and tuck somewhere safe away from liquids.
    1. This unit MUST NOT get wet, so it is recommended you place this into a bag or some kind of covering to avoid mist or splashing and tuck into the top of the head assembly so that it won't fall into any water.
1. Attach the bilge pump hose to the bilge pump, but don't yet attach the other end to the water intake port on the head assembly.
1. Check that the bilge switch is set to OFF before first connecting the positive terminal (red) and then the negative terminal (black) of the bilge wires to the boat battery.
    1. Be sure to wrap or isolate the boat battery, bilge switch, and fuse from possible exposure to water or other hazards.
1. Unless discussed otherwise, ignore the Optional Bleed valve in the Figure 2. diagram.

![Figure 1. RAD7 Overlook](Environmental_Parameter_Protocols/Images/RAD7_Overlook.PNG)  
![Figure 2. Rad Aqua Set Up](Environmental_Parameter_Protocols/Images/RAD_Aqua_Setup.PNG)  

<a name="Sampling_Protocol"></a> **Sampling Protocol**  

1. Once the RAD7 and RAD Aqua are connected in-line with tubing as described and diagramed above, turn on the RAD7.
    1. From the main menu screen, check the battery voltage.  Voltage should be above 6V, else the RAD should be charged.  Typically a full charge will last about 8-9 hours.
1. Use the key pad to turn on the internal pump: Menu > "Setup" > Enter > "Pump" > "On"
    1. You'll hear a mechanical noise as the pump turns on.  The pump will start pulling air through the drying unit and reducing the relative humidity in the system.
1. Press Menu to return to the main menu screen and use the left and right arrows to move between main manu screens until you see a screen showing "RH = #%" indicating the relative humidity percentage in the RAD7.  Wait to start your first samples until the RH value is at least 10% or lower.
1. Before you start sampling, check that the sample test status is set to Sniff: Menu > "Test" > Enter > "Status" > Enter > "Sniff"
1. When you are ready to begin testing, turn on the bilge pump by flipping the bilge switch to ON.
    1. Check that water is running through the hose, and that there are no pump blockages or battery issues.
    1. Turn Off the bilge switch, then connect the hose to the water intake port on the head assembly.
    1. Turn the bilge switch On again, and check that there are no leaks, and that sensitive electrical components of the system are still safe from splashing or exposure to water.
1. Once the RAD Aqua seems stable, use the RAD7 key pad to start testing: Menu > "Test" > Enter > "Start"
    1. Note that the first two cycles are used as purge rounds, so you will not have data for the first two cycles, but will begin collecting data after those first two.  The RAD7 will beep at the end of each cycle.

<a name="Breakdown"></a> **Stopping and Breaking down the system**  

Breakdown  
1. When you are ready to stop recording data, use the key pad to stop testing: Menu > "Test" > Enter > "Stop"
1. Turn the bilge switch Off and then disconnect the terminals, first the negative (black) then the positive (red).
1. Disconnect the attached hoses from the RAD Aqua and RAD7, being sure to cap any hose ports with the appropriate dust cap (one small red dust cat for the RAD7, a free spare filter for the RAD7, and two yellow dust caps for the drying unit).
1. Once back in lab, disconnect the RAD Aqua by unscrewing the thumbscrew, removing the head assembly and cylinder, and then unscrewing the metal rod from the trivet, and re-cap the outflow hose-connection port.
1. If there were any clogs or buildup of algae and other debris in the bilge pump and head assembly, thoroughly clean and clear out those units and hoses.
1. Wash all components of the RAD Aqua in fresh water and lay out to dry.
1. Spin the hoses to remove most of the water from inside the tubing.

Data offload  
1. Back in lab, connect the RAD7 to a power source and to the USB to serial adapter cable.  Attach the USB end of that cable to the computer containing the Durridge Capture software (download from the included disk).
1. Turn on the RAD7 and make sure the Status is "Idle".
1. Open the Capture software on the computer.
1. To send data from the RAD7: Menu > "Data Com" > Enter
1. The screen will show "Data transfer..." and beep when the data transfer is complete.

<a name="References"></a> **References**  

* RAD7 User Manual found either [online here](https://durridge.com/documentation/RAD7%20Manual.pdf) or [on github here](Protocols/RAD7_Protocol/RAD7_Manual.pdf)
* RAD Aqua Manual found either [online here](https://durridge.com/documentation/RAD%20AQUA%20Manual.pdf) or [on github here](Protocols/RAD7_Protocol/RAD_Aqua_Manual.pdf)
