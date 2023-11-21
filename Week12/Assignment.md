# Week 12 - Ab initio molecular dynamics of water

In this lab, you will use the code cp2k to run AIMD simulations of water, and a solvated proton in water. Note that the input files are based on [this tutorial](https://www.cp2k.org/exercises:2015_pitt:aimd), and so the precise method used might not be good enough for use in research, but it is good enough to run the simulations we want within 1 day. 

## Part 1 - Run AIMD for water for up to 1 ps

1. Create a directory called Runs/Water
2. Copy the files from Inputs into this directory
3. In Runs/Water
	- Edit water.inp and replace `___FILL_IN___` with
		- A project name, such as, water_aimd_1ns_every0.5fs
		- A `WALLTIME` of 6 hours, **in seconds**
		- `STEPS` corresponding to 1 picosecond. How many steps is this??
	- Create an sbatch file to run this job with
		- 1 cpu per task
		- 12 tasks per node
		- Memory = 20GB
		- Wall time of 6 hours
		- `--reservation=gmh4` (this will make sure it starts right away during this class time)
		- In the sbatch script, first load the cp2k module `module load cp2k/openmpi/intel/20201212`
		- the run command should be `mpirun -np 12 cp2k.popt -i water.inp -o OUTPUT_FILE_NAME.log`
	- Submit the job, and make sure it is running before going on to the next part 

## Part 2 - Set up and run AIMD for an excess proton

1. Copy all of your files from Runs/Water to Runs/Proton
2. Rename the input xyz file to `proton.xyz` and change water to proton in the `.inp` file everywhere
3. Add an extra hydrogen to the `proton.xyz` file in a file editor:
	- Visualize the xyz file in vmd, and find an oxygen that is kind of near the middle of the box. Which atom index is this? In the xyz file, you should see that this is kind of close to position 0,0,0
	- Find this oxygen in the xyz file, duplicate it's line, change 'O' to 'H', and shift x y or z by 1 angstrom (at least, this is what I did)
	- Change the number of atoms at the top to be bigger by 1
	- Change the total system charge in the `.inp` file to be 1
4. Copy the sbatch file from the water directory, adjust it for proton, and submit it

## Part 3 - Analysis

- Make a jupyter notebook to analyze these simulations. 
	- Plot the energy versus time, as read in from the `.ener` file
	- Use mdtraj or mdanalysis to compute g(r) for the oxygens as you did before in our previous labs
		- Note that you have to set the box size. The box size is written in the xyz file and input file, and it is constant for the whole simulation
	- For your own benefit, compare your g(r) for Oxygen to one from the litterature. For example, does it look like [this one](https://aip.scitation.org/na101/home/literatum/publisher/aip/journals/content/jcp/2016/jcp.2016.145.issue-19/1.4967719/20161117/images/large/1.4967719.figures.online.f12.jpeg)
	- Visualize the proton simulation using VMD
		- Use VDW for the atoms, and shrink the radii
		- Make another represenation of type dynamic bonding. Set the bond length so that you only see bonds between O-H
		- After some steps for the system to equilibration, find the hydronium molecule, and save a picture of it
		- If you can, make a movie of the proton hopping. This may be hard to track, but you should be able to see a few proton hopping events.
		- (Bonus) If you were doing this for research, you *could* make a movie like [this one](https://youtu.be/7de68dos3qY) from Prof. Andrew White. He explains how to track a specific atom in a tcl script on a [blog post](https://thewhitelab.org/blog/graphics/2020/03/08/vmd-movie-scripts/). But to do this, you will have to identify the *special oxygen*. You can look in the literature to see how this is defined. Knowledge of this position would be required to compute the MSD of hydronium ions

## Final thoughts
1. Add all of your modified input files, output log files, and ener files to github
2. Add all of your analysis notebooks and any snapshots to github


