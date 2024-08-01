# MODFLOW2005 Basic Package
#FREE SHOWPROGRESS CONVERGE MAXPARAM 2000 2000000 100000
BEGIN OPTIONS
#            #
#            # INPUT_CHECK   # Run model but dont solve gw equation to cycle through all input files 
#            #
#            # FASTFORWARD STR STP  #Only run model for Stress Period (or Date) STR to STP. Specifying STP is optional (otherwise its set ot NPER)
#            #
            NOCBC
#            #CBC_LAST_TIMESTEP      #Overrides OC and writes CBC at the end of every Time Step
#            #CBC_EVERY_TIMESTEP     #Overrides OC and writes CBC every Time Step
#            #
            START_DATE  12/01/1969
#            #
#            NO_FAILED_CONVERGENCE_STOP
#            #
#            # Default is to print every the iteration count every 10 solver iterations to command prompt
#            #
#            #NO_SHOWPROGRESS # Disables "Solver Iter" printing; useful if redirecting cmd output to a file.
#            #
#            SHOWPROGRESS [NPRT] # Prints every 10 or NPRT iterations HCLOSE and RCLOSE; NPRT < 0 only prints the solver iter # every |NPRT| iterations; OneWater default is "SHOWPROGRESS -10"
#                                # Note that "SHOWPROGRESS 0" is identical to "NO_SHOWPROGRESS"
#            
#            #
#            PERCENTERROR  MnP    # Print Budget when %Error>MnP. Default is MnP = 5%
#            #STOP_ERROR    Stpr   # Simulation continues unless %Error > Stpr. Note NO_FAILED_CONVERGENCE_STOP is the same as "STOP_ERROR  1E30"
#            #
#            MAX_RELATIVE_VOLUME_ERROR  MxRE  # Specify MxRE, default is 0.025, set MxRE = 2.0 to disable (or any large number)
#            #
#            DAMPEN_START          DmpIT DMP  # First time step's first set of DmpIT iterations have a dampening factor of DMP applied
#            #
#            DOUBLE_PRECISION_CBC # Cell-by-cell is full double precision
#            #
#            NO_DIM_CHECK         # BY PASS MIN SIZE CHECK
#            DEALLOCATE_MULT      # Reduce Memory Footprint
            MAXPARAM 2000 2000000 100000   # MAXPAR MAXCLUSTER MAXINSTANCE
#            MAXBUDGET  MxBd      # Limits the size of the volumetric budgets, default is MxBd = 100. Should be at least the number of packages plus 10
#            #
            BUDGETDB                        ./output/Budget.txt
            PROPPRINT                       ./output/              # Write auqifer properties to files.
#            #
#            PRINT_TIME_INFO                 ./output/Time_Info.txt                     # Time step Date, Length, etc  information
#            ITERATION_INFO                  ./output/Conv_Iter_Info.txt                     # Time step iteration and error information
            PRINT_CONVERGENCE         1   0 ./output/Conv_HCLOSE.txt   BUFFER 16 # NTERM OUTER_START  FILE
            PRINT_FLOW_RESIDUAL       1   0 ./output/Conv_RCLOSE.txt   BUFFER 16 # NTERM OUTER_START  FILE
#            #
            CUMULATIVE_RESIDUAL_ERROR_ARRAY ./output/Cumulative_Model_Error.txt  #L^3 cumulative volume errors for model grid
#            #
#            # RESIDUAL_ERROR_ARRAY_THRESHOLD  INT              # Percent error threshold for printing rate error for model grid with RESIDUAL_ERROR_ARRAY
#            # RESIDUAL_ERROR_ARRAY            Generic_Output   # L^3/T error for model grid for every time step that has percent error > RESIDUAL_ERROR_ARRAY_THRESHOLD 
#            #
#            #
#            #
#            # HEAD_DISTANCE_ABOVE_GSE_LIMIT DstLim                 # Solver cannot allow any head to go above DstLim + GSE. For example, HdLim = 25 indictes that solver cannot allow the head to be 25 or more above the ground/land surface elevation
             HEAD_DISTANCE_ABOVE_GSE_PRINT 25  ./output/heads_above_GSE.txt # Write to file any head cells that exceed DstPrt + GSE
#            #
#            # Specify with List-Style NLAY shift values that are added to the STRT head arrays.
#            #
#            #SHIFT_STRT  INTERNAL 
#            #1  1                 # 1 ft up
#            #2 -1                 # 1 ft down
#            #3  0                 # No shift
#            #
#            PAUSE   #Pauses simulation at the very end. Usesful to hold window open.
#            #
#            # Special Options - NOT RECOMMENDED!
#            #
#            # MIN_SOLVER_ITERATION  MnIT   # Requires all time steps have at least MnIT outer iterations.
#            # DAMPEN_OSCILLATION    DmpIT  # If solver takes more than DmpIT outer iteration, dampen occilations in solution.
#            #
#            # Old options
#            #  NOFREE   # Indicates Fix Formatted Input
#            #    FREE   # Optional, free formatted input (default)
#            # XSECTION  # Input is a cross section of col by lay
END OPTIONS
# FREE SHOWPROGRESS CONVERGE MAXPARAM 2000 2000000 100000
OPEN/CLOSE ./model_arrays/ibound_1.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./model_arrays/ibound_2.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./model_arrays/ibound_3.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./model_arrays/ibound_4.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./model_arrays/ibound_5.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./model_arrays/ibound_6.txt            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
 -999.000000
OPEN/CLOSE ./init_heads/init_heads_lay1.dat            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./init_heads/init_heads_lay2.dat            1.0000000E+00   (FREE)  1  Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./init_heads/init_heads_lay3.dat            1.0000000E+00   (FREE) 1 Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./init_heads/init_heads_lay4.dat            1.0000000E+00   (FREE) 1  Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./init_heads/init_heads_lay5.dat            1.0000000E+00   (FREE) 1  Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
OPEN/CLOSE ./init_heads/init_heads_lay6.dat            1.0000000E+00   (FREE) 1  Line 3: IZON: OPEN/CLOSE FNAME CNSTNT FMTIN IPRN
