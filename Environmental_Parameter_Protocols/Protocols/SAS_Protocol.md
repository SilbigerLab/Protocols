# Sub-surface Automated Sampler Protocol

Original: September 2021 by Maya Greenhill
Last Revised: September 2021

For more detailed instructions, see [**SAS User Manual**](https://github.com/SilbigerLab/Protocols/blob/master/Environmental_Parameter_Protocols/Protocols/SAS_User_Manual.pdf).

**Contents**
- [**Materials**](#Materials) 
- [**To set up the SAS for deployment main tasks**](#GeneralProtocol) 
- [**SAS setup**](#SASsetup)
- [**SAS calibration**](#SAScalibration)
- [**Sample bag attachment & deployment**](#SampleBagAttachment)
- [**Reminders**](#Reminders)
- [**References**](#References)


<a name="Materials"></a> **Materials**

1. SAS
1. Phillips head screwdriver 
1. Phillips screw (6/32" X 1")
1. Strong magnet
1. IR remote
1. Lithium ion batteries (x8)
1. Large black zipties
1. Carabiners


<a name="GeneralProtocol"></a> **To set up the SAS for deployment main tasks** 
1. Clean with Q-tip to remove dust/particles and use silicone lube on motor sides and tubing
1. Clean top section with Q-tip to remove dust/particles and use silicone lube for o-ring on top of SAS
1. Set SAS time and sampling time for both pumps
1. Calibrate both pumps
1. Mark outflow tubing or connect outflow tubing directly to Tedlar bag
1. Replace with fresh batteries after calibration
1. Double check main screen status menu: check if the time and date is right, sample mode, volume, and batteries
    1. If battery voltage is below 11V changes batteries
1. Initiate to put the SAS to sleep

  
<a name="SASsetup"></a> **SAS setup** 

*When not in use, keep lying in horizontal position. You can prepare SAS 48 hours ahead of deployment. Do not put fresh batteries in before the 48 hour mark. Use different batteries for calibration and put a fresh set of batteries in for deployment.* 
1. Remove screws, loosening each one a little and moving on to the next in a circular motion so as not to crack the screen. Remove plastic screen and gently lift out inner compartment. 
2. Remove battery packs, load batteries, and plug packs into sampler. Make sure to plug battery pack into compartment #1 BEFORE compartment #2. 
3. Gently replace inner compartment, making sure no wires are compressed or at an angle. Replace screen & screws, again moving in a circle when tightening the screws.
5. Check that screen is on <STATUS MENU>. Point IR remote directly at screen and use right cursor to navigate to <TIME SET>. Confirm that time and date are correct; if not, use cursor to set correct date and set time to the nearest next minute (e.g. if it is 10:01, set time to 10:02:00). Scroll down to “ENTER SET” and press enter when real time matches set time (e.g. when real clock says 10:02). First row T is 24H time, HH:MM:SS. Second row D is DD/MM/YY. 
6. Return to top of <TIME SET> screen and navigate to <SETTINGS>. Confirm that settings are “Mode: Once” and “VOL: 900” (900 mL); if not, change using cursor, then scroll to “ENTER SET” and press enter.
7. Return to top of <SETTINGS> screen and navigate to <PUMP A>. Set T (time) and D (date) to the time and date for Pump A to turn on, then scroll to “ENTER SET” and press enter. Time is 24H time, HH:MM. Date is DD/MM/YY. Return to top of <PUMP A> screen, navigate to <PUMP B>, and repeat steps to program time and date for Pump B to turn on. **Sampling time for each must be set at least 10 mins apart from each other to properly sample**
8. Calibrate pumps (see below).
9. Return to top of <PUMP B> screen and navigate to <INITIATE>. Scroll to “Press Enter” and press enter. 
10. To wake sampler, move magnet back and forth horizontally across reed switch. When display says “Interrupt”, hold magnet in position until main screen turns on. Initiate (step 5) must be pressed again if you wish to return to sampling mode.
11. When removing batteries, make sure to remove battery from compartment #2 BEFORE compartment #1. 

  
<a name="SAScalibration"></a> **SAS Calibration**

*Why: Some motors are faster than others. This shows the water volume each pump motor pumps within the calibration time (10 seconds) with the current SAS configuration. May be easier with two people*
1. Navigate to <PUMPCAL> menu and see what mL the pump has previously calibrated to 
1. Grab a 25-100 mL graduated cylinder depending on previous calibration
1. Place input tube into water and output tube into graduated cylinder for Pump A
1. Navigate to <RUNCAL> and select Start for Pump A
1. Hold tube in inflow and outflow for the calibration time and see how much mL in the graduated cylinder
1. Change number to the amount of what in graduated cylinder in <PUMPCAL> menu if different than the mL
1. Repeat process for Pump B
1. If you need to repeat the calibration, run the calibration once more for the pump to clear out remaining water in the tube

 
<a name="Samplebagattachment"></a> **Sample bag attachment & deployment**
 
* Instructional video for attaching one Mylar and one Tedlar bag to the sampler [here.](https://youtu.be/R16RRaiNpqU) 
* Be sure to keep Tedlar bag valve closed unless SAS is actively sampling. Close valve after deployment before removing SAS from the field. 
* The same set of Lithium Ion batteries can be used for multiple deployments, 

<a name="Reminders"></a> **Reminders** 

1. Battery pack IN: #1 before #2.
1. Settings
 – Ensure <TIME SET> time and date are accurate. 
 – Time is 24H time, HH:MM:SS.
 – Date is DD/MM/YY.
 – Mode: Once; VOL: 900
1. Program <PUMP A> & <PUMP B> sample times.
1. Enter <INITIATE> to turn on sampling mode.
1. Use magnet to wake sampler, hold at “Interrupt.”
1. Battery pack OUT: #2 before #1. 
1. Check that Tedlar bag valve is closed unless actively deploying.
1. Check to make sure
 
<a name="References"></a> **References** 
 
 * [SAS User Manual](https://github.com/SilbigerLab/Protocols/blob/master/Environmental_Parameter_Protocols/Protocols/SAS_User_Manual.pdf)
