# m-Cresol Purple Protocol

Original:February 2020 by Demetra Panos
Last Revised: February 2020


Contents
- [**Materials**](#Materials)  
- [**Protocol**](#Protocol)
- [**References**](#References)

<a name="Materials"></a> **Materials**

1. m-Cresol purple
1. DI water
1. HCL
1. NaOH
1. Beaker
1. Stir plate
1. Stirring rods
1. Sea water
1. Scintillation vials
 
<a name="Protocol"></a> **Protocol**  

    1. Create concentrated 2mmol/dm^3 m-Cresol dye solution using m-Cresol powder and DI water. Measure out dye using scale. Place in beaker and add water. Using a stir plate, stir until well mixed.
        1. Molecular mass of m-Cresol (C_{21}H_{18}O_5S) is 382.43 g/mol, meaning to create a 1L solution of 2mmol/dm3 m-Cresol dye you will dilute 0.764872 grams of dye in DI water.
        1. Scaling down, to create 125 mL of solution you will dilute 0.0956075 grams of m-Cresol in DI water. 
    1. Add small amounts of HCL and/or NaOH (try 5-10 umol at a time and adapt accordingly) to dye solution to acquire a known pH in the range of 7.9 +/- 0.1 (chosen from matched oceanic profile) — from [Dickson SOP 6b](Spectrophotometer_Protocols/Dickinson_SOP_6b.pdf).
        1. Continue stirring on stir plate as you add acid and/or base.
        1. A probe can be used to determine pH on NBS scale.
    1. Transfer dye solution to scintillation vial(s) and cover vials with aluminum foil or tape so that light cannot enter vial.
    1. Create seawater solutions of known pH of 7.8, 8.0, and 8.2 (3 batches of each) to use for dye calibration.
        1. Again, use additions of HCL and/or NaOH to reach desired pH. Probes can again be used on the NBS scale for buffering.
    1. Place seawater solutions and dye in water bath at 25C for 1 hour to equilibrate.
    1. Run spec at 730, 578, and 434 wavelengths with seawater solutions applying 2 separate additions of dye for A1/A2 correction and dye calibration with three replicates of each solution.
        1. For 96 well plates use 300ul of seawater to 5ul of dye.
        1. For cuvettes use 3mL of seawater to 50ul of dye.
    1. Calculate A1/A2 for each solution by completing the following:
        * (578 one dye addition - 578 no dye) / (434 one dye addition – 434 no dye)
    1. Calculate A1/A2 2nd for each solution by completing the following:
        * (578 2nd dye addition - 578 1st dye addition) / (434 2nd dye addition – 434 1st dye addition)
    1. Calculate the delta A1/A2 by subtracting the second from the first.
    1. Plot deltas and calculate a trend line. The slope and intercept of your line will be used for dye batch correction in spec analysis.
    1. Run 3 replicate Tris samples using the dye to ensure dye quality (remember to place in water bath for 1 hour prior to running tris)
    
<a name="References"></a> **References**
    * [Dickinson SOP 6b](Spectrophotometer_Protocols/Dickinson_SOP_6b.pdf)
