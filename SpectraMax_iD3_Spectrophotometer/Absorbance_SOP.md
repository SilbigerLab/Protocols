# Protocol for measuring absorbance of seawater samples using the SpectraMax iD3 Spectrophotometer and SoftMax Pro 7 (SMP7) software

**Contents**  
[**Preparing the well plate**](#Preparing_well_plate)  
[**Setting up the Plate Read in SMP7**](#Setting_up_plate_read)  

<a name=Preparing_well_plate></a> **Preparing the well plate**  

<a name=Setting_up_plate_read></a> **Setting up the plate read in SMP7**  
1. Select the "Untitled" tab.
1. Select the "choose a different instrument" icon.
1. From the drop-down manu, select the instrument you are connecting to SoftMax Pro.
    1. Select the SpectraMax iD3
1. Select the "configure your acquisition settings" icon (two orange gears).
1. Make sure the appropriate "Read Mode" and "Read Type" are selected.
    1. Read Mode: ABS (Absorbance)
    1. Read Type: Choose between Endpoint, Kinetic, Well Scan, and Spectrum
1. Select the "configure your plate layout" icon (well plate).
1. Now you will define your plate map.  This is important for generating a standard curve and unknown sample values based off the standard curve.  This is also where you will blank your plate.
1. Click and drag your mouse over the wells to select which wells to assign to your plate blank.
    1. Click the "Plate Blank" button.
1. Click and drag your mouse over your "standards" wells.  On the righthand options bar, select "Standards".
    1. If you select multiple columns and rows for standards, select "Series" to define a concentration series for multiple standards, or if you want to assign one concentration for all selected wells, enter the concentration of those standard solutions, and click "Assign".
    1. In "Series" you can set your standard layout, define the replicate pattern, and provide a concentration series with a consistent step.  The drop-down menu for "step by" allows you to +,-,*, or / by a consistent factor
    1. Selecting "Top to Bottom" will tell the software to recognize the order of your standards from top to bottom then left to right.  "Bottom to Top" will order your standards from bottom to top then left to right.  "Left to Right" and "Right to Left" will follow the indicated pattern, then top to bottom.
    1. Pattern of Replicates indicates how many replicate wells are in sequence along the rows and columns.  Ex. x=3, y=1 indicates that three wells along one row are replicates. **Note: if your chosen number of wells is not evenly divisible by either the x- or y-direction well number, the program will truncate the replicate identification at the end of the row or column.
