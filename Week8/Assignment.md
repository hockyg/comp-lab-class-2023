# Week 8 

## This week, we will use LAMMPS to study the crystallization of a purely repulsive system

### Setup
1. Request an interactive node with 1-8 tasks per node and 1 cpu-per-task (memory doesn't matter). More cpus will be faster, but you can do this assignment even on 1 cpu
2. Test the shared version of lammps. 
	- Get the `lmp` executable by doing `source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash`
	- Copy the directory `/scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/examples/melt/` into your Week 8 project directory
	- Go in to the melt directory and run the example by doing: `mpirun lmp -in in.melt`
	- Uncomment the `dump ... atom ...` line and the `dump 3 ... lines` to produce a movie and a trajectory file
	- Read the `dump.melt` file to make sure you understand what's in it.
	- Since this file is what VMD calls `lammpstrj` format, open it with VMD using `vmd -lammpstrj dump.melt` or similar; change the display type to orthographic, the representation to VDW, and the particle size to 0.5. 
	- Watch the movie, and if it worked, Save the movie in your figures folder with an appropriate name
	- Note that you can add `-log LOGFILE` after the command so the THERMO text in the screen goes to a log file, if you are writing a script. This could be helpful for analysis later
	- Note that you can add `-var VAR` to set a variable name inside the script, which can be helpful for changing parameters from the outside

### Part 1 - find the approximate density where these hard WCA disks crystalize 
1. Test the setup
	- I have provided a script for you called `Inputs/2dWCA.in`; It initializes a 2d WCA system at a certain *number density* (N/V) and higher temperature, runs the system for some time at that higher temperature, then cools down to a lower temperature over the course of some number of steps. The output is written to a DCD file, and also one frame is written to a LAMMPS file so that you can open it in VMD
		 - Try to understand what each part does! Don't be afriad to start looking at the LAMMPS manual
	- In a test directory, try running the script to see what it does at a certain density, e.g. `mpirun lmp -var density 0.5  -in ../Inputs/2dWCA.in` 
	- Open the output in VMD with the command `vmd 2dWCA_T0.1_d0.5_N100000.lammpstrj 2dWCA_T0.1_d0.5_N100000.dcd` and see what it looks like; change the display type to orthographic, the representation to VDW, and the particle size to 0.5. 
2. Now, write a bash script with a for loop that runs this simulation for different densities
	- Do this for densities ranging from 0.5 to 1.1 every 0.1
	- Save a log file for each one either using `-log LOGFILE.log` or ` > LOGILFE.log`
	- Using VMD to look at the final frame, what is the first density where it crystallizes? (Can you watch the dynamics of crystallization?)
	- Run at one more density between the one that did and did not crystallizes, did it crystalize there?
	- Save nice images of the crystalline and non crystaline phases in the image directory labeled by their density from VMD
	- Save the trajectories and log files in the Trajectories/ or Data/ folder

### Part 2 - Make a new script for 3D WCA
1. Make a script in Inputs called 3dWCA.in by copying 2dWCA.in
2. Make this work for 3d by
	- Change dimension to 3
	- Changing the region to be sized 8x8x8
	- Change the initial lattice type to `fcc` instead of `sq`
	- Change the dump files and log files to have the name `3d` instead of `2d`
3. Scan densities from 0.8 to 1.5
4. Save images of a configuration below and above the crystallization transition (the lowest density you find that crystallizes). You can do Perspective view here and you should find it's very obvious when you have a crystal (especially in the `points` representation`)
5. Save the relevant trajectory data
