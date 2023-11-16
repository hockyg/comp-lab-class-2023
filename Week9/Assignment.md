# Week 9

## This week, we will use LAMMPS to study simulate the 3D Kob-Andersen Lennard-Jones (KALJ) glass-forming liquid

## Overview

The folder Inputs containts scripts for running the KALJ system with LAMMPS. This illustrates how a more sophisitcated LAMMPS project might look.
To generate configurations of a supercooled liquid, first the system is created and equilibrated at high temperature, then successively lower temperatures are simulated for longer and longer times. 

Based on prior experience, the setup here should result in `equilibrated' samples. Note: glasses are techically out of equilibrium, but we call a supercooled liquid equilibrated if we see that the dynamics are not changing noticably over time, i.e dynamical properties computed using the first part of the simulation and final part agree.

## Setup

1. Create a Data directory to run in 
2. Get the `lmp` executable by doing `source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash`
3. copy or link the files `kalj.lmp  kalj_particles.lmp` from `Inputs` to the Data directory

## Part 1 - Create and cool down the system
Start writing a sbatch script to run the following steps, which will create and anneal the system. I suggest you use 4 tasks-per-node and 1 cpu-per-task.

First you will create the system using the command below, then you will progressively anneal the system by equilibrating to lower temperatures.

The command to create the system is:
`mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/create_3d_binary.lmp`

After creating the system, you will equilibrate at temperatures in `Inputs/n360/`: 1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475 (there is also a file for 0.45 if you want to run it)

The command to cool from temperature 2 to 1.5 is:
`mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T1.5.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp`

Then from 1.5 to 1 is
`mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T1.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp`

Rather than doing one at a time, write a for loop (like last week) that runs all of the equilibration runs.

Submit this job. It should finish all of the jobs in around 1 hour. 

While this job is running, read the mdp files a bit to try to understand what each one is doing.

## Part 2 - Run production runs
While equilibration is running, create another sbatch script to run production simulations that you will analyze.

This script should have the same for loop over temperatures, but with the script `../Inputs/production_3d_binary.lmp`

Submit this job. These jobs are 3 times shorter, so they should finish 3 times faster than the equilibration runs. 

You can start running the production jobs for higher temperatures while you wait for lower temperature runs to finish.

## Part 3 - Analyze runs
You will analyze these simulations in two ways, computing the mean-squared displacement (MSD) and the radial distribution functions (RDF). 

One way to do these calculations in `python` would be using using the python library `MDAnalysis`

The production jobs output unwrapped dcd files, meaning that both RDF and MSD can be computed directly from those files. They can be loaded in VMD or MDAnalysis using the `.lammpstrj` files in the equil dir.

As an example, to load a trajectory in MDAnalysis, one would do: `u = MDAnalysis.Universe("old_trj.lammpstrj", "trj_unwrapped.dcd", topology_format="LAMMPSDUMP")`

1. Using the production data, compute the radial distribution function between type 1 and type 1 particles, type 2 and type 2, and type 1 and type 2. 
Make 3 separate figures showing g_11(r), g_22(r), g_12(r) - each one at all the temperatures. 

2. Using the production data, compute the mean-squared displacement for type 1 particles at each tempearture. Make a figure showing the MSD at each temperature. This figure should be on a log-log scale. If you do this, you will see there is a small plateau and then diffusive behavior at longer time (linear slope).

3. Find the time where MSD = 1 at each temperature. This is the time where the particle would diffuse 1 diameter on average. Make a plot of this time vs $1/T$. This should also be a log-log plot.

Save your figures in the Figures folder. 

