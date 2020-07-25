Any write access would be ignored if performed to the current xPMMASK, xPMBASE and MMTE CSR registers and PM.Current is disabled.

1. Any write access would be ignored if performed to the current xPMMASK, xPMBASE and MMTE.  
Cases:  
    a. M-mode writes PM.Current=0 -> switch to U-mode -> U-mode tries to update u(PMMASK,PMBASE,MMTE) registers (to ensure no side effects ubserved)  
Optional Cases: S-Mode, H-Mode, M-Mode.  
Question: Is this statement hold true for M-mode?  

2. Enable PM.Current and update  xPMMASK, xPMBASE and MMTE from an arbitrary mode.  
Cases:  
    a. M-mode writes PM.Current=1 -> switch to U-mode -> U-mode tries to update registers and reads the values back.  
Optional Cases: S-Mode, H-Mode, M-Mode.  
Question: Is this statement hold true for M-mode?  

3. Enable tagging for an arbitrary mode and read MMTE.  
Cases:  
    a. M-mode writes PM.Enabled=1 and PM.Current=1, read the value back  
    b. M-mode writes PM.Enabled=1 and PM.Current=0 -> switch to U-mode -> reads umode registers
    c. M-mode writes U-PM.Enabled=1 and U-PM.Current=0 -> switch to U-mode -> read the value  
    d. M-mode writes U-PM.Enabled=1 and U-PM.Current=1 -> switch to U-mode -> read the value  
    e. M-mode writes U-PM.Enabled=0 and U-PM.Current=1 -> switch to U-mode -> read the value  
    f. M-mode writes U-PM.Enabled=0 and U-PM.Current=0 -> switch to U-mode -> read the value  
Optional Cases: cross m/h/s/u modes  

4. Enable tagging and do memory operation.  
Cases:  
    a. M-mode writes PM.Enabled=1 and PM.Current=1, does sucessfull tagged operation.  
    b. M-mode writes PM.Enabled=1 and PM.Current=1 -> switch to U-mode -> does sucessfull tagged operation,  
    c. M-mode writes PM.Enabled=0 and PM.Current=0, failure on a tagged operation  
    d. M-mode writes PM.Enabled=0 and PM.Current=0 -> switch to U-mode -> failure on a tagged operation  
    e. M-mode writes UPM.Enabled=0 and UPM.Current=1 -> switch to U-mode -> failure on a tagged operation.  
    f. M-mode writes UPM.Enabled=0 and UPM.Current=1 -> switch to U-mode -> user mode updates UPM.Enabled, sets up registers, does a sucessfull tagged operation.  
Optional Cases: cross m/h/s/u modes  

5. Ensure that xPMMASK, xPMBASE work as expected.  
Cases:  
    a. M-mode writes PM.Enabled=1 and PM.Current=1, updates xPMBASE, does memory reference to an expected location.  
    b. M-mode writes U-xPMBASE, DISABLES U-PM.Enabled, switch to User mode, make sure that xMBase has no effect.  
    c. same as A, but switch to U-mode.  
    d, e, f: same as a/b/c but with xPMMASK.  
    g. make sure to cover wierd xPMMASK configurations (all 0, moving 1-s, non-contigous patterns, etc).  
Optional Cases: cross m/h/s/u modes.  
